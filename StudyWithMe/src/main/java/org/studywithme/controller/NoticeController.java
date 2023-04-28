package org.studywithme.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.studywithme.domain.AddTicketVO;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.NoticeVO;
import org.studywithme.domain.UserVO;
import org.studywithme.dto.PageDTO;
import org.studywithme.service.NoticeService;
import org.studywithme.util.UserUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class NoticeController {
	
	@Autowired
	private NoticeService service;

	@GetMapping("/noticeBoard")
	public String getNoticeBoardList(Model model, Criteria cri) {
		
		  String keyword = cri.getKeyword() == null ? "" : cri.getKeyword();
		  String type = cri.getType() == null ? "title" : cri.getType();
		  cri.setKeyword(keyword);
		  cri.setType(type);
		  
		  model.addAttribute("boardList", service.getBoardList(cri.getType(), cri.getKeyword(), cri.getPageNum(), cri.getAmount()));
		  //log.info("model" + model);
			
		  int total = service.getTotal(cri);
		  model.addAttribute("pageMaker", new PageDTO(cri, total));
			 
		
		return "/notice/getListNotice";
	}
	
	@GetMapping("/insertNotice")
	public String insertNotice(Model model) {
		UserVO vo = new UserUtil().getUserDetails();
		model.addAttribute("loginUser", vo);
		
		return "/notice/insertNotice";
	}
	
	@PostMapping("/addNotice")
	public String addNotice(@ModelAttribute NoticeVO noticeVO) {
		
		UserVO vo = new UserUtil().getUserDetails();
		noticeVO.setUserId(vo.getUserId());
		log.info("noticeVO*************************** " + noticeVO);
		service.register(noticeVO);
		
		return "redirect:/noticeBoard";
	}
	
	@GetMapping("/getNotice")
	public String getNotice(@RequestParam("noticeNo") Long noticeNo, Model model) {
		UserVO vo = new UserUtil().getUserDetails();
		model.addAttribute("loginUser", vo);
		
	    NoticeVO board = service.get(noticeNo);
	    log.info("Board object retrieved: {}" + board);
	    model.addAttribute("board", board);
	    
	    return "/notice/getNotice";
	}
	
	@GetMapping("/updateNotice")
	public String updateNotice(@RequestParam("noticeNo") Long noticeNo, Model model) {
		
		NoticeVO board = service.get(noticeNo);
	    model.addAttribute("board", board);
	    
	    return "/notice/updateNotice";
	}
	
	@PostMapping({"/modifyNotice"})
	public String modifyNotice(@ModelAttribute NoticeVO noticeVO, Model model) {
		
	    service.modify(noticeVO);
	    
	    return "redirect:/noticeBoard";
	}
	
	@GetMapping("/deleteNotice")
	public String deleteNotice(@RequestParam("noticeNo") Long noticeNo) {
		
		service.remove(noticeNo);
		
		return "redirect:/noticeBoard";
	}
	
}
