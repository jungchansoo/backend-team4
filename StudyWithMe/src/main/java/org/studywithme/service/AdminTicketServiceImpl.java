package org.studywithme.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
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
	public void register(TicketVO ticket) {
		
	}

	@Override
	public boolean modify(TicketVO ticket) {
		
		return false;
	}

	@Override
	public boolean remove(Long bno) {
		
		return false;
	}

	@Override
	public TicketVO get(Long bno) {
		
		return null;
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<TicketVO> getListTicket(String keyword, int pageNum, int amount) {
		log.info("getListTicket=============" + keyword + " " + pageNum + " " + amount);
		return mapper.getTicketList(keyword, pageNum, amount);
	}

	

}
