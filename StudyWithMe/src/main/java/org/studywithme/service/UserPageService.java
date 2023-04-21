package org.studywithme.service;

import java.util.List;

import org.studywithme.domain.StudyCafeVO;

public interface UserPageService {

	List<StudyCafeVO> getStudyCafeList(String keyword, int currentPage, int perPage);

	public int getTotalCount(String keyword);
	public StudyCafeVO getStudyCafeByUserID(String userId);

}
