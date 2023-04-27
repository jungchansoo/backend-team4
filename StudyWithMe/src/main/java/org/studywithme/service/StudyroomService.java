package org.studywithme.service;

import java.util.Date;
import java.util.List;

import org.studywithme.domain.RoomVO;


public interface StudyroomService {
	public List<RoomVO> useroom(int cafeno);
	public void insert(String id,int cafe_no,int num_using,Date start_time,Date end_time ,int usetime);
	public void returnroom(String id,int cafe_no,int num_using,Date start_time,Date end_time ,int usetime);
}
