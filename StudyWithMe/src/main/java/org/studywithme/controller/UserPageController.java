package org.studywithme.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.studywithme.domain.UserVO;
import org.studywithme.util.UserUtil;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class UserPageController {
	@Autowired
	private UserUtil util;
	
	@GetMapping("/")
	public String userPage(Model model) {
		if(util.getUserDetails()!=null) {
			model.addAttribute("id", util.getUserDetails().getUserId());
			model.addAttribute("name",util.getUserDetails().getUserName());
		}
		return "page/userMainPage";
	}
}
