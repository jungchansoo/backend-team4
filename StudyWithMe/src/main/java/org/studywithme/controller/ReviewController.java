package org.studywithme.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.ReviewVO;
import org.studywithme.domain.UserVO;
import org.studywithme.dto.PageDTO;
import org.studywithme.service.ReviewBoardService;
import org.studywithme.service.ReviewVoteHistoryService;
import org.studywithme.util.UserUtil;
import org.studywithme.util.changetime;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ReviewController {
	@Autowired
	private ReviewBoardService service;

	@Autowired
	private ReviewVoteHistoryService voteHistoryService;

	@Autowired
	private HttpSession session;

	@Autowired
	private UserUtil util;

	@GetMapping("/reviewlist")
	public String getReviewList(Model model, Criteria cri) {
		log.info("getReviewList 호출");
		int cafeNum = (int) session.getAttribute("cafeNum");
		model.addAttribute("reviewList", service.getList(cafeNum, cri));
		int total = service.getTotal(cafeNum, cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		changetime changer = new changetime();
		model.addAttribute("changer", changer);
		return "/review/list";
	}

	@GetMapping("/insertReview")
	public String insertReview(Model model) {
		UserVO vo = util.getUserDetails();
		model.addAttribute("loginUser", vo);

		return "/review/insertReview";
	}

	@PostMapping("/addReview")
	public String addReview(@ModelAttribute ReviewVO vo) {
		int cafeNum = (int) session.getAttribute("cafeNum");
		vo.setUserId(util.getUserDetails().getUserId());
		log.info("ReviewVO*************************** " + vo);
		service.register(cafeNum, vo);

		return "redirect:/reviewlist";
	}

	@GetMapping("/getReview")
	public String getReview(@RequestParam("reviewNo") Long reviewNo, Model model) {
		ReviewVO board = service.get(reviewNo);
		log.info("Board object retrieved: {}" + board);
		model.addAttribute("board", board);
		Map<String, Boolean> voteResult = voteHistoryService.getVoteStatus(util.getUserDetails().getUserId(), reviewNo);
	    
		Boolean hasUpvoted = voteResult.get("upvoted");
	    Boolean hasDownvoted = voteResult.get("downvoted");
	    
	    model.addAttribute("hasUpvoted", hasUpvoted);
	    model.addAttribute("hasDownvoted", hasDownvoted);

		return "/review/getReview";
	}

	@GetMapping("/updateReview")
	public String updateReview(@RequestParam("reviewNo") Long reviewNo, Model model) {
		ReviewVO board = service.get(reviewNo);
		model.addAttribute("board", board);
		return "/review/updateReview";
	}

	@PostMapping({ "/modifyReview" })
	public String modifyReview(@ModelAttribute ReviewVO ReviewVO, Model model) {
		service.modify(ReviewVO);
		return "redirect:/reviewlist";
	}

	@GetMapping("/deleteReview")
	public String deleteReview(@RequestParam("reviewNo") Long reviewNo) {
		service.remove(reviewNo);
		return "redirect:/reviewlist";
	}

	@PostMapping("/upvoteReview")
	@ResponseBody
	public String upvoteReview(@RequestParam("userId") String userId, @RequestParam("reviewNo") Long reviewNo,
			@RequestParam("action") String action) {
		log.info("upvoteReview...........");
		service.upvote(reviewNo);
		voteHistoryService.insertVoteHistory(userId, reviewNo, action);
		
		return "success";
	}
	
	@PostMapping("/downvoteReview")
	@ResponseBody
	public String downvoteReview(@RequestParam("userId") String userId, @RequestParam("reviewNo") Long reviewNo,
			@RequestParam("action") String action) {
		service.downvote(reviewNo);
		voteHistoryService.insertVoteHistory(userId, reviewNo, action);
		return "success";
		}

	@PostMapping("/cancelReviewUpvote")
	@ResponseBody
	public String cancelReviewUpvote(@RequestParam("userId") String userId, @RequestParam("reviewNo") Long reviewNo,
			@RequestParam("action") String action) {
		log.info("CancelReviewUpvote...........");
		voteHistoryService.removeVoteHistory(userId, reviewNo, action);
		service.cancelUpvote(reviewNo);
		
		return "success";
	}
	
	
	@PostMapping("/cancelReviewDownvote")
	@ResponseBody
	public String cancelReviewDownvote(@RequestParam("userId") String userId, @RequestParam("reviewNo") Long reviewNo,
			@RequestParam("action") String action){
		voteHistoryService.removeVoteHistory(userId, reviewNo, action);
		service.canceldownvote(reviewNo);
		return "success";
	}
}
