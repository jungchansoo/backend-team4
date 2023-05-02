package org.studywithme.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.studywithme.domain.LockerVO;
import org.studywithme.domain.RoomVO;
import org.studywithme.domain.SeatVO;

public interface StudyseatandroomandlockerMapper {
	public List<SeatVO> readuseseat(@Param("cafe_no")int cafe_no);
	public List<RoomVO> readuseroom(@Param("cafe_no")int cafe_no);
	public List<LockerVO> readuselocker(@Param("cafe_no")int cafe_no);
	public Map<String, Object> getmyreservationInfo(@Param("user_id")String user_id, @Param("category")String category);
	public void insert(@Param("cafe_no")int cafe_no, @Param("num_using")int num_using, @Param("user_id")String user_id , @Param("category")String category);
	public void insertroom(@Param("cafe_no")int cafe_no, @Param("num_using")int num_using, @Param("user_id")String user_id , @Param("start_time")Date start_time, @Param("end_time")Date end_time, @Param("duration")int duration);
	public void returnroom(@Param("cafe_no")int cafe_no, @Param("num_using")int num_using, @Param("user_id")String user_id , @Param("start_time")Date start_time, @Param("end_time")Date end_time);
	public boolean checkduration(@Param("cafe_no")int cafe_no, @Param("num_using")int num_using, @Param("start_time")Date start_time, @Param("end_time")Date end_time);
	public void updateRemainingRoomTime(@Param("duration") int duration,@Param("user_id") String user_id);
	
	public boolean isAvailable(@Param("cafe_no")int cafe_no, @Param("num_using")int num_using, @Param("category")String category);
	public void movedata(@Param("user_id")String user_id, @Param("category")String category);
	public void delete(@Param("user_id")String user_id, @Param("category")String category);
	public int getduration(@Param("user_id") String user_id, @Param("category") String category);
	public void updateRemainingSeatTime(@Param("duration") int duration,@Param("user_id") String user_id);
	public void updateRemainingLockerTime(@Param("duration") int duration,@Param("user_id") String user_id);
}
