package org.studywithme.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.studywithme.domain.AddTicketVO;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.TicketVO;

public interface TicketMapper {

	public List<TicketVO> getSeatTicketList(@Param("category") String category);
	public List<TicketVO> getStudyRoomTicketList(@Param("category") String category);
	public List<TicketVO> getLockerTicketList(@Param("category") String category);
	
	public void insert(AddTicketVO ticket);
	public int update(AddTicketVO ticket);
	public int delete(Long ticketNo);
	public AddTicketVO read(Long ticketNo);
	public List<TicketVO> getTicketList(@Param("keyword") String keyword, @Param("pageNum") int pageNum, @Param("amount") int amount);
	public int getTotalCount(@Param("keyword") String keyword);
}
