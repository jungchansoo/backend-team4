package org.studywithme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.studywithme.domain.Criteria;
import org.studywithme.dto.PageDTO;
import org.studywithme.service.AdminTicketService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class AdminTicketController {
	
	private final AdminTicketService service;
	
	@GetMapping("/ticketManagement")
	public String getUserList(Model model, Criteria cri) {
		
		String keyword = cri.getKeyword() == null ? "" : cri.getKeyword();
		model.addAttribute("ticketList", service.getListTicket(keyword, cri.getPageNum(), cri.getAmount()));
		
		int total = service.getTotal(cri);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "/adminpage/ticketManagement";
	}
	
}
