package org.studywithme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.studywithme.domain.UserVO;
import org.studywithme.util.UserUtil;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class UserPageController {
	@GetMapping("/userMainPage")
	public String userPage(Model model) {
		UserUtil util = new UserUtil();
		UserVO vo = util.getUserDetails();
		
		model.addAttribute("id", vo.getUserId());
		model.addAttribute("name", vo.getUserName());
		
		return "page/userMainPage";
	}
}
