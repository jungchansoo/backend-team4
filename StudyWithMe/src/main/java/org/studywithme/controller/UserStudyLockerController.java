package org.studywithme.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.studywithme.domain.UserVO;
import org.studywithme.exception.LockerNotAvailableException;
import org.studywithme.service.LockerService;
import org.studywithme.util.UserUtil;
import org.studywithme.util.changetime;

@Controller
public class UserStudyLockerController {
	@Autowired
	private LockerService service;

	@Autowired
	private UserUtil util;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/userstudylocker")
	public String UserStudylocker(Model model) {

		UserVO vo = new UserUtil().getUserDetails();
		changetime changer = new changetime();
		String remainingLockerTime = changer.time_longtoString(vo.getRemainingLockerTime());
		
		int cafeno = (int) session.getAttribute("cafeNum");
		model.addAttribute("map", service.myuselocker(vo.getUserId()));
		model.addAttribute("cafeno", cafeno);
		model.addAttribute("lists", service.uselocker(cafeno));
		model.addAttribute("name", vo.getUserName());
		model.addAttribute("id", vo.getUserId());
		model.addAttribute("time", remainingLockerTime);
		model.addAttribute("long_time", vo.getRemainingLockerTime());
		
		//branch부분을 메인에서 넘어온 카페이름으로 바꿔야함. 당연히 view 폴더 이름도 같음.
		String cafe_name = "studycafe/";
		String branch = "chosim_Gangnam_Dogok/";
		String category = "userstudylocker";
		return cafe_name+branch+category;
	}
	
	@PostMapping("/userstudylocker/reservation")
	public ResponseEntity<String> reservation(@RequestParam("num_using") int num_using, @RequestParam("cafe_no") int cafe_no) {
		UserVO vo = new UserUtil().getUserDetails();
		
		try {
			try {
				service.insertlocker(cafe_no, num_using, vo.getUserId());
				return ResponseEntity.ok("Reservation Successful");
			}catch (LockerNotAvailableException e) {
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Reservation Failed");
			
			}
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Reservation Failed");
		}
	}
	
	@PostMapping("/userstudylocker/return")
	public ResponseEntity<String> returnlocker(@RequestParam("user_id") String user_id) {
		try {
			service.returnlocker(user_id);
			return ResponseEntity.ok("Returnlocker Successful");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Returnlocker Failed");
		}finally {
			util.refreshUserDetails(user_id);
		}
	}
}
