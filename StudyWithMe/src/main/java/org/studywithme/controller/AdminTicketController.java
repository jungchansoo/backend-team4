package org.studywithme.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.studywithme.domain.AddTicketVO;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.TicketVO;
import org.studywithme.dto.PageDTO;
import org.studywithme.service.AdminTicketService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AdminTicketController {

	@Autowired
	private AdminTicketService service;
	
	@GetMapping("/ticketManagement")
	public String getTicketList(Model model, Criteria cri) {
		
		String keyword = cri.getKeyword() == null ? "" : cri.getKeyword();
		model.addAttribute("ticketList", service.getListTicket(keyword, cri.getPageNum(), cri.getAmount()));
		
		int total = service.getTotal(cri);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "/adminpage/ticketManagement";
	}
	
	@GetMapping("/insertTicket")
	public String insertTicket() {
		
		return "/adminpage/insertTicket";
	}
	
	@PostMapping("/addTicket")
	public String addTicket(@ModelAttribute AddTicketVO addTicketVO) {
		
		log.info("addTicketVO: {}" +  addTicketVO);
		
		service.register(addTicketVO);
		
		return "redirect:/ticketManagement";
	}
	
	@GetMapping({"/getTicket"})
	public String getTicket(@RequestParam("ticketNo") Long ticketNo, Model model) {
		
	    AddTicketVO ticket = service.get(ticketNo);
	    log.info("Ticket object retrieved: {}" + ticket);
	    model.addAttribute("ticket", ticket);
	    return "/adminpage/getTicket";
	}
	
	@GetMapping({"/updateTicket"})
	public String updateTicket(@RequestParam("ticketNo") Long ticketNo, Model model) {
		/*
		 * log.info("/getTicket or modifyTicket"); model.addAttribute("ticket",
		 * service.get(ticketNo));
		 * 
		 * return "/adminpage/getTicket";
		 */
		AddTicketVO ticket = service.get(ticketNo);
	    log.info("Ticket object retrieved: {}" + ticket);
	    model.addAttribute("ticket", ticket);
	    
	    return "/adminpage/updateTicket";
	}
	
	@PostMapping({"/modifyTicket"})
	public String modifyTicket(@ModelAttribute AddTicketVO addTicketVO, Model model) {
		/*
		 * log.info("/getTicket or modifyTicket"); model.addAttribute("ticket",
		 * service.get(ticketNo));
		 * 
		 * return "/adminpage/getTicket";
		 */
		log.info("modify:" + addTicketVO);
	    service.modify(addTicketVO);
	    
	    return "/adminpage/ticketManagement";
	}
	
	@GetMapping("/deleteTicket")
	public String deleteTicket(@RequestParam("ticketNo") Long ticketNo) {
		if (service.remove(ticketNo)) {
		      return "success";
		}
		return "fail";
	}
}
