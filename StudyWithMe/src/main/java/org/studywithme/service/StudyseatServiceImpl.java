package org.studywithme.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.studywithme.domain.SeatVO;
import org.studywithme.exception.SeatNotAvailableException;
import org.studywithme.mapper.StudyseatandroomandlockerMapper;
import org.studywithme.util.UserUtil;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
public class StudyseatServiceImpl implements StudyseatService {

	@Setter(onMethod_ = @Autowired)
	private StudyseatandroomandlockerMapper mapper;

	@Override
	public List<SeatVO> useseat(int cafeno) {
		return mapper.readuse(cafeno,"SEAT");
	}

	@Override
	public Map<String, Object> myuseseat(String id) {
		return mapper.getmyreservationInfo(id, "SEAT");
	}

	@Override
	@Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
	public void insertseat(int cafe_no, int num_using, String id) {
		boolean isAvailable = mapper.isAvailable(cafe_no, num_using,"SEAT");
		if (isAvailable) {
			throw new SeatNotAvailableException();
		}
		mapper.insert(cafe_no, num_using, id, "SEAT");
	}

	@Override
	public void returnseat(String id) {
		mapper.movedata(id, "SEAT");
		mapper.delete(id, "SEAT");
		int duration = mapper.getduration(id, "SEAT");
		mapper.updateRemainingSeatTime(duration, id);
	}
}
