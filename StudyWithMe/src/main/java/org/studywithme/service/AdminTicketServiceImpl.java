package org.studywithme.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.studywithme.domain.AddTicketVO;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.TicketVO;
import org.studywithme.mapper.TicketMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminTicketServiceImpl implements AdminTicketService {
	
	private TicketMapper mapper;

	@Override
	public void register(AddTicketVO ticket) {
		if(ticket.getTimeType().equals("hour")) {
			ticket.setChargingTime(ticket.getChargingTime() * 60);
		}
		else if(ticket.getTimeType().equals("day")) {
			ticket.setChargingTime(ticket.getChargingTime() * 60 * 24);
		}
		else if(ticket.getTimeType().equals("week")) {
			ticket.setChargingTime(ticket.getChargingTime() * 60 * 24 * 7);
		}
		else if(ticket.getTimeType().equals("month")) {
			ticket.setChargingTime(ticket.getChargingTime() * 60 * 24 * 7 * 4);
		}
		
		log.info("ticket" + ticket);
		
		mapper.insert(ticket);
	}

	@Override
	public boolean modify(AddTicketVO ticket) {
		if(ticket.getTimeType().equals("hour")) {
			ticket.setChargingTime(ticket.getChargingTime() * 60);
		}
		else if(ticket.getTimeType().equals("day")) {
			ticket.setChargingTime(ticket.getChargingTime() * 60 * 24);
		}
		else if(ticket.getTimeType().equals("week")) {
			ticket.setChargingTime(ticket.getChargingTime() * 60 * 24 * 7);
		}
		else if(ticket.getTimeType().equals("month")) {
			ticket.setChargingTime(ticket.getChargingTime() * 60 * 24 * 7 * 4);
		}
		
		log.info("modify....." + ticket);
		return mapper.update(ticket) == 1;
	}

	@Override
	public boolean remove(Long ticketNo) {
		log.info("remove....." + ticketNo);
		return mapper.delete(ticketNo) == 1;
	}

	@Override
	public AddTicketVO get(Long ticketNo) {
		log.info("get......" + ticketNo);
		return mapper.read(ticketNo);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("cri" + cri);
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<TicketVO> getListTicket(String keyword, int pageNum, int amount) {
		log.info("getListTicket=============" + keyword + " " + pageNum + " " + amount);
		return mapper.getTicketList(keyword, pageNum, amount);
	}

	

}
