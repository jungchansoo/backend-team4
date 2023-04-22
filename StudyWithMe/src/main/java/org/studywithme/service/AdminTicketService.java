package org.studywithme.service;

import java.util.List;

import org.studywithme.domain.Criteria;
import org.studywithme.domain.TicketVO;

public interface AdminTicketService {

	public void register(TicketVO ticket);
	public boolean modify(TicketVO ticket);
	public boolean remove(Long bno);
	public TicketVO get(Long bno);
	public List<TicketVO> getListTicket(String keyword, int pageNum, int amount);
	public int getTotal(Criteria cri);
}
