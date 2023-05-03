package org.studywithme.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class SessionController {
	
	@Autowired
	HttpSession session;

	@GetMapping("/getCafeNum")
	@ResponseBody
	public Integer getCafeNum() {
		
		if(session.getAttribute("cafeNum") == null) {
			return null;
		}
		
		return (Integer) session.getAttribute("cafeNum");
	}
}
