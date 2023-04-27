package org.studywithme.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.studywithme.domain.UserVO;
import org.studywithme.service.StudyseatService;
import org.studywithme.util.UserUtil;
import org.studywithme.util.changetime;

@Controller
public class UserStudyLockerController {
	@Autowired
	private StudyseatService service;

	@Autowired
	private UserUtil util;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/userstudylocker")
	public String UserStudyseat(Model model) {
		/*
		 * UserVO vo = new UserUtil().getUserDetails(); changetime changer = new
		 * changetime(); String remainingSeatTime =
		 * changer.time_longtoString(vo.getRemainingSeatTime());
		 * 
		 * int cafeno = (int) session.getAttribute("cafeNum"); model.addAttribute("map",
		 * service.myuseseat(vo.getUserId())); model.addAttribute("cafeno", cafeno);
		 * model.addAttribute("lists", service.useseat(cafeno));
		 * model.addAttribute("name", vo.getUserName()); model.addAttribute("id",
		 * vo.getUserId()); model.addAttribute("time", remainingSeatTime);
		 * model.addAttribute("long_time", vo.getRemainingSeatTime());
		 */
		//branch부분을 메인에서 넘어온 카페이름으로 바꿔야함. 당연히 view 폴더 이름도 같음.
		String cafe_name = "studycafe/";
		String branch = "chosim_Gangnam_Dogok/";
		String category = "userstudylocker";
		return cafe_name+branch+category;
	}
}
