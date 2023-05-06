package org.studywithme.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.studywithme.domain.StudyCafeVO;
import org.studywithme.service.UserPageService;
import org.studywithme.util.UserUtil;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
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
	public String userPage(Model model, @RequestParam(value = "errorMessage", required = false) String errorMessage) {
		if(util.getUserDetails()!=null) {
			model.addAttribute("id", util.getUserDetails().getUserId());
			model.addAttribute("name",util.getUserDetails().getUserName());
			model.addAttribute("lists", service.studycafeallList());
			model.addAttribute("errorMessage", errorMessage);
			model.addAttribute("cafeno",session.getAttribute("cafeNum"));
			log.info("errorMessage : " + errorMessage);
			
			if(util.getUserDetails().getRole().equals("ROLE_MANAGER")) {
				System.out.print("ROLE MANAGER 로그인");
				StudyCafeVO cafeVO = service.getStudyCafeByUserID(util.getUserDetails().getUserId());
				
				session.setAttribute("cafeNum", cafeVO.getCafe_no());				
				session.setAttribute("cafeName", cafeVO.getName());
				model.addAttribute("role","1");
			}
			else if(util.getUserDetails().getRole().equals("ROLE_ADMIN")){
				model.addAttribute("role","2");
			}
			else {
				model.addAttribute("role","0");
			}
		}
		

		return "page/userMainPage";
	}
	
}
