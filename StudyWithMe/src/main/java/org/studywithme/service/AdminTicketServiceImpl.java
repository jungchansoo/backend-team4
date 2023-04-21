package org.studywithme.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.TicketVO;
import org.studywithme.mapper.TicketMapper;

import lombok.AllArgsConstructor;

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
	public List<TicketVO> getList(Criteria cri) {
		
		return mapper.getTicketList(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	

}
