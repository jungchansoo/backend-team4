package org.studywithme.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.studywithme.domain.RoomVO;
import org.studywithme.mapper.StudyseatandroomandlockerMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class StudyroomServiceImpl implements StudyroomService {

	@Setter(onMethod_ = @Autowired)
	private StudyseatandroomandlockerMapper mapper;

	@Override
	public List<RoomVO> useroom(int cafeno) {
		 return mapper.readuseroom(cafeno); 
	}

	@Override
	@Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
	public void insert(String user_id,int cafe_no, int num_using, Date start_time, Date end_time, int usetime) {
		boolean check = mapper.checkduration(cafe_no, num_using, start_time, end_time);
		if (check) {
		       throw new RuntimeException("선택한 시간에 예약이 이미 존재합니다.");
		}
		mapper.insertroom(cafe_no, num_using, user_id, start_time, end_time, usetime*60);
		mapper.updateRemainingRoomTime(usetime*60, user_id);
	}

	@Override
	public void returnroom(String user_id, int cafe_no, int num_using, Date start_time, Date end_time, int usetime) {
		mapper.returnroom(cafe_no, num_using, user_id, start_time, end_time);
		mapper.updateRemainingRoomTime(usetime, user_id);
	}

}
