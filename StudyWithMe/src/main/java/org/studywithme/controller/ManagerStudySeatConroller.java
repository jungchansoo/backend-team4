package org.studywithme.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.studywithme.domain.UserVO;
import org.studywithme.service.StudyseatService;
import org.studywithme.service.UserService;

@Controller
public class ManagerStudySeatConroller {
	@Autowired
	private StudyseatService service;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/managerstudyseat")
	public String ManagerStudyseat(Model model) {
		
		int cafeno = (int) session.getAttribute("cafeNum");
		model.addAttribute("cafeno", cafeno);
		model.addAttribute("lists", service.useseat(cafeno));

		//branch부분을 메인에서 넘어온 카페이름으로 바꿔야함. 당연히 view 폴더 이름도 같음.
		String cafe_name = "studycafe/";
		String branch = "chosim_Gangnam_Dogok_Manager/";
		String category = "managerstudyseat";
		
		return cafe_name+branch+category;
	}

	@PostMapping("/managerstudyseat/return")
	public ResponseEntity<String> returnseat(@RequestParam("user_id") String user_id) {
		try {
			service.returnseat(user_id);
			return ResponseEntity.ok("Returnseat Successful");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Returnseat Failed");
		}
	}
	
	@RequestMapping(value = "/managerstudyseat/getUserDetail", method = RequestMethod.GET)
	@ResponseBody
	public UserVO getUserDetail(@RequestParam("user_id") String user_id) {
		return userService.get(user_id);
	}

}
