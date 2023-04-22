package org.studywithme.service;

import java.util.Date;
import java.util.List;import javax.xml.stream.events.EndDocument;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
	public void insert(String user_id,int cafe_no, int num_using, Date start_time, Date end_time, int usetime) {
		
		mapper.insertroom(cafe_no, num_using, user_id, new java.sql.Date(start_time.getTime()), new java.sql.Date(end_time.getTime()), usetime*60);
		//2. 시간빼기
	}

	@Override
	public void returnroom(String id) {
		// TODO Auto-generated method stub

	}

}
