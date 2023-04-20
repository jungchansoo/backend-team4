package org.studywithme.mapper;

import org.apache.ibatis.annotations.Param;

public interface KaKaoPayMapper {

	public void addSeatTime(@Param("time") long time, @Param("userId") String userId);
	public void addStudyRoomTime(@Param("time") long time, @Param("userId") String userId);
	public void addLockerTime(@Param("time") long time, @Param("userId") String userId);
}
