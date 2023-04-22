package org.studywithme.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.studywithme.domain.TicketVO;
import org.studywithme.domain.UserVO;
import org.studywithme.service.PaymentPageService;
import org.studywithme.util.UserUtil;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class PaymentPageController {
	
	private final PaymentPageService service;

	@GetMapping("/paymentSeatPage")
	public String paymentSeatPage(Model model) {
		UserUtil util = new UserUtil();
		UserVO vo = util.getUserDetails();
		
		List<TicketVO> ticketList = service.getSeatTicketList("SEAT");
		
		model.addAttribute("id", vo.getUserId());
		model.addAttribute("name", vo.getUserName());
		model.addAttribute("ticketList", ticketList);
		
		return "payment/paymentSeatPage";
	}
	
	@GetMapping("/paymentRoomPage")
	public String paymentRoomPage(Model model) {
		UserUtil util = new UserUtil();
		UserVO vo = util.getUserDetails();
		
		List<TicketVO> ticketList = service.getSeatTicketList("STUDY_ROOM");
		
		model.addAttribute("id", vo.getUserId());
		model.addAttribute("name", vo.getUserName());
		model.addAttribute("ticketList", ticketList);
		
		return "payment/paymentRoomPage";
	}
	
	@GetMapping("/paymentLockerPage")
	public String paymentLockerPage(Model model) {
		UserUtil util = new UserUtil();
		UserVO vo = util.getUserDetails();
		
		List<TicketVO> ticketList = service.getSeatTicketList("LOCKER");
		
		model.addAttribute("id", vo.getUserId());
		model.addAttribute("name", vo.getUserName());
		model.addAttribute("ticketList", ticketList);
		
		return "payment/paymentLockerPage";
	}
}
