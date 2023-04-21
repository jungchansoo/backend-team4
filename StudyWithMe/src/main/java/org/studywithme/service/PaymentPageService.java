package org.studywithme.service;

import java.util.List;

import org.studywithme.domain.TicketVO;

public interface PaymentPageService {

	List<TicketVO> getSeatTicketList(String category);
	
	List<TicketVO> getStudyRoomTicketList(String category);
	
	List<TicketVO> getLockerTicketList(String category);
}
