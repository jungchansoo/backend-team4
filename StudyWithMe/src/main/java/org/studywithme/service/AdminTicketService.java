package org.studywithme.service;

import java.util.List;

import org.studywithme.domain.AddTicketVO;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.TicketVO;

public interface AdminTicketService {

	public void register(AddTicketVO ticket);
	public boolean modify(AddTicketVO ticket);
	public boolean remove(Long ticketNo);
	public AddTicketVO get(Long ticketNo);
	public List<TicketVO> getListTicket(String keyword, int pageNum, int amount);
	public int getTotal(Criteria cri);
}
