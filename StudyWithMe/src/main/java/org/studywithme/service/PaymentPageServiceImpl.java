package org.studywithme.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.studywithme.domain.TicketVO;
import org.studywithme.mapper.TicketMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@RequiredArgsConstructor
public class PaymentPageServiceImpl implements PaymentPageService {
	
	private final TicketMapper mapper;
	
	@Override
	public List<TicketVO> getSeatTicketList(String category) {
		return mapper.getSeatTicketList(category);
	}

	@Override
	public List<TicketVO> getStudyRoomTicketList(String category) {
		return mapper.getStudyRoomTicketList(category);
	}

	@Override
	public List<TicketVO> getLockerTicketList(String category) {
		return mapper.getLockerTicketList(category);
	}

}
