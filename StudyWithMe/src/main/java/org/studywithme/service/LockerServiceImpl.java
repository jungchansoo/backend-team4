package org.studywithme.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.studywithme.domain.LockerVO;
import org.studywithme.exception.LockerNotAvailableException;
import org.studywithme.mapper.StudyseatandroomandlockerMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class LockerServiceImpl implements LockerService{

	@Setter(onMethod_ = @Autowired)
	private StudyseatandroomandlockerMapper mapper;

	
	@Override
	public List<LockerVO> uselocker(int cafeno) {
		return mapper.readuselocker(cafeno);
	}

	@Override
	public Map<String, Object> myuselocker(String id) {
		return mapper.getmyreservationInfo(id, "LOCKER");
	}

	@Override
	@Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
	public void insertlocker(int cafe_no, int num_using, String id) {
		boolean isAvailable = mapper.isAvailable(cafe_no, num_using,"LOCKER");
		if (isAvailable) {
			throw new LockerNotAvailableException();
		}
		mapper.insert(cafe_no, num_using, id, "LOCKER");
	}

	@Override
	public void returnlocker(String id) {
		mapper.movedata(id, "LOCKER");
		mapper.delete(id, "LOCKER");
		int duration = mapper.getduration(id, "LOCKER");
		mapper.updateRemainingLockerTime(duration, id);
	}

}
