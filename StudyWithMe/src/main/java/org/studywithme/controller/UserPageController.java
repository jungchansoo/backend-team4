package org.studywithme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.studywithme.domain.Criteria;
import org.studywithme.service.UserPageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class UserPageController {
	
	private UserPageService service;

	@GetMapping("/userMainPage")
	public String userPage(String error, String logout, Model model) {

		log.info("list");
	    model.addAttribute("list", service.getList());
		
		return "page/userMainPage";
	}
}
