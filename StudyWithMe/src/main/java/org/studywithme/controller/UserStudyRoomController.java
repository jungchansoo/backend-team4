package org.studywithme.controller;

import java.text.SimpleDateFormat;
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
import org.studywithme.exception.SeatNotAvailableException;
import org.studywithme.service.StudyroomService;
import org.studywithme.util.UserUtil;

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
		model.addAttribute("my_id", vo.getUserId());
		model.addAttribute("lists", service.useroom(cafeno));
		
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
			System.out.println("완료");
			return ResponseEntity.ok("Reservation Successful");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Reservation Failed");
		}
	}
	
	@PostMapping("/userstudyroom/return")
	public ResponseEntity<String> returnseat(@RequestParam("user_id") String user_id) {
		return null;
	}
	
}
