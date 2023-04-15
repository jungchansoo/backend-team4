package org.studywithme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class UserPageController {

	@GetMapping("/userMainPage")
	public String userPage(Model model) {

		// userVO 추가
		
		return "page/userMainPage";
	}
	
}
