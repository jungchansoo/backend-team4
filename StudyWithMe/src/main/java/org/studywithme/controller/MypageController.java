package org.studywithme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.studywithme.domain.UserVO;
import org.studywithme.util.UserUtil;

@Controller
public class MypageController {
	
	 @GetMapping("/mypage")
	    public String mypageguserinfo(Model model) {
		UserUtil util = new UserUtil();
		UserVO vo = util.getUserDetails();
		model.addAttribute("loginUser", vo);
		model.addAttribute("name", vo.getUserName());
		model.addAttribute("password", vo.getPassword());
	    	return "user/mypage";
	    }
	 
	 @GetMapping("/updatePw")
	 public String changepassword() {
		 return "user/updatePw";
	 }
	 

}
