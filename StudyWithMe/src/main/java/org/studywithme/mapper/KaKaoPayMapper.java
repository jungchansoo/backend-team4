package org.studywithme.mapper;

import org.apache.ibatis.annotations.Param;

public interface KaKaoPayMapper {

	public void addSeatTime(@Param("time") int time, @Param("userId") String userId);
	public void addStudyRoomTime(@Param("time")int time, @Param("userId") String userId);
}
