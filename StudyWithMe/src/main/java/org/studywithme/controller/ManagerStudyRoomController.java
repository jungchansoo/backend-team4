package org.studywithme.controller;

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

@Controller
public class ManagerStudyRoomController {
	@Autowired
	private StudyroomService service;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/managerstudyroom")
	public String UserStudyseat(Model model) {
		
		int cafeno = (int) session.getAttribute("cafeNum");
		model.addAttribute("cafeno", cafeno);
		model.addAttribute("lists", service.useroom(cafeno));
		
		//branch부분을 메인에서 넘어온 카페이름으로 바꿔야함. 당연히 view 폴더 이름도 같음.
		String cafe_name = "studycafe/";
		String branch = "chosim_Gangnam_Dogok_Manager/";
		String category = "managerstudyroom";
		return cafe_name+branch+category;
	}

	
	@PostMapping("/managerstudyroom/return")
	public ResponseEntity<String> returnroom(@RequestParam("num_using") int num_using,@RequestParam("start_time") Date start_time,@RequestParam("end_time") Date end_time,@RequestParam("user_id") String user_id) {
		int usetime = (int) ((start_time.getTime() - end_time.getTime()) / 60000);
		int cafe_no = (int) session.getAttribute("cafeNum");
		try {
			service.returnroom(user_id,cafe_no, num_using, start_time, end_time, usetime);
			return ResponseEntity.ok("Reservation Successful");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Reservation Failed");
		}
	}
	
}
