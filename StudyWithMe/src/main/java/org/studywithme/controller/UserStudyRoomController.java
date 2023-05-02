package org.studywithme.controller;

import java.io.Console;
import java.util.Date;

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
import org.studywithme.service.StudyroomService;
import org.studywithme.util.UserUtil;
import org.studywithme.util.changetime;

import lombok.extern.log4j.Log4j;

@Controller
public class UserStudyRoomController {
	@Autowired
	private StudyroomService service;

	@Autowired
	private UserUtil util;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/userstudyroom")
	public String UserStudyseat(Model model) {
		
		UserVO vo = new UserUtil().getUserDetails();
		int cafeno = (int) session.getAttribute("cafeNum");
		changetime changer = new changetime();
		String remainingRoomTime = changer.time_longtoString(vo.getRemainingStudyRoomTime());
		
		model.addAttribute("my_id", vo.getUserId());
		model.addAttribute("lists", service.useroom(cafeno));
		model.addAttribute("time", vo.getRemainingStudyRoomTime());
		model.addAttribute("remainingRoomTime", remainingRoomTime);
		
		//branch부분을 메인에서 넘어온 카페이름으로 바꿔야함. 당연히 view 폴더 이름도 같음.
		String cafe_name = "studycafe/";
		String branch = "chosim_Gangnam_Dogok/";
		String category = "userstudyroom";
		return cafe_name+branch+category;
	}
	
	@PostMapping("/userstudyroom/reservation")
	public ResponseEntity<String> reservation(@RequestParam("num_using") int num_using, @RequestParam("start_time") Date start_time,@RequestParam("end_time") Date end_time, @RequestParam("usetime") int usetime) {
		UserVO vo = new UserUtil().getUserDetails();
		int cafe_no = (int) session.getAttribute("cafeNum");
		try {
			service.insert(vo.getUserId(),cafe_no, num_using, start_time, end_time, usetime);
			return ResponseEntity.ok("Reservation Successful");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Reservation Failed");
		}finally {
			util.refreshUserDetails(vo.getUserId());
		}
		
	}
	
	@PostMapping("/userstudyroom/return")
	public ResponseEntity<String> returnroom(@RequestParam("num_using") int num_using,@RequestParam("start_time") Date start_time,@RequestParam("end_time") Date end_time,@RequestParam("user_id") String user_id) {
		UserVO vo = new UserUtil().getUserDetails();
		int usetime = (int) ((start_time.getTime() - end_time.getTime()) / 60000);
		int cafe_no = (int) session.getAttribute("cafeNum");
		try {
			service.returnroom(user_id,cafe_no, num_using, start_time, end_time, usetime);
			return ResponseEntity.ok("Reservation Successful");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Reservation Failed");
		}finally {
			util.refreshUserDetails(vo.getUserId());
		}
	}
	
}
