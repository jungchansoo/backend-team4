package org.studywithme.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.studywithme.domain.StudyCafeVO;
import org.studywithme.domain.UserVO;
import org.studywithme.service.UserPageService;
import org.studywithme.util.UserUtil;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class UserPageController {
	@Autowired
	private UserUtil util;
	
	@Autowired
	private UserPageService service;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping("/")
	public String userPage(Model model) {
		if(util.getUserDetails()!=null) {
			model.addAttribute("id", util.getUserDetails().getUserId());
			model.addAttribute("name",util.getUserDetails().getUserName());
			
			if(util.getUserDetails().getRole().equals("ROLE_MANAGER")) {
				System.out.print("ROLE MANAGER 로그인");
				StudyCafeVO cafeVO = service.getStudyCafeByUserID(util.getUserDetails().getUserId());

				session.setAttribute("cafeNum", cafeVO.getCafe_no());				
				session.setAttribute("cafeName", cafeVO.getName());
			}
		}
		

		return "page/userMainPage";
	
	}
	
}
