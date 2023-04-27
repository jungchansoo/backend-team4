package org.studywithme.service;

import java.util.List;
import java.util.Map;

import org.studywithme.domain.LockerVO;

public interface LockerService {
	public List<LockerVO> uselocker(int cafeno);
	public Map<String, Object> myuselocker(String id);
	public void insertlocker(int cafe_no, int num_using, String id);
	public void returnlocker(String id);
}
