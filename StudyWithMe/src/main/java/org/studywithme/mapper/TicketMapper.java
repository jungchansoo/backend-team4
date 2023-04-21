package org.studywithme.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.studywithme.domain.TicketVO;

public interface TicketMapper {

	public List<TicketVO> getSeatTicketList(@Param("category") String category);
	
	public List<TicketVO> getStudyRoomTicketList(@Param("category") String category);
	
	public List<TicketVO> getLockerTicketList(@Param("category") String category);
}
