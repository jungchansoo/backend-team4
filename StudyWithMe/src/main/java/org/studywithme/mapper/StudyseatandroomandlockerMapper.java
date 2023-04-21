package org.studywithme.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.studywithme.domain.SeatVO;

public interface StudyseatandroomandlockerMapper {
	public List<SeatVO> readuse(@Param("cafe_no")int cafe_no ,@Param("category")String category);
	public Map<String, Object> getmyreservationInfo(@Param("user_id")String user_id, @Param("category")String category);
	public void insert(@Param("cafe_no")int cafe_no, @Param("num_using")int num_using, @Param("user_id")String user_id , @Param("category")String category);
	public boolean isAvailable(@Param("cafe_no")int cafe_no, @Param("num_using")int num_using, @Param("category")String category);
	public void movedata(@Param("user_id")String user_id, @Param("category")String category);
	public void delete(@Param("user_id")String user_id, @Param("category")String category);
	public int getduration(@Param("user_id") String user_id, @Param("category") String category);
	public void updateRemainingSeatTime(@Param("duration") int duration,@Param("user_id") String user_id);
}
