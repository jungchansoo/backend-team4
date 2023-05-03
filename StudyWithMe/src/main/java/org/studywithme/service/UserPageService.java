package org.studywithme.service;

import java.util.List;

import org.studywithme.domain.StudyCafeVO;

public interface UserPageService {

	public List<StudyCafeVO> getStudyCafeList(String keyword, int currentPage, int perPage);

	public int getTotalCount(String keyword);
	public StudyCafeVO getStudyCafeByUserID(String userId);
	public List<StudyCafeVO> studycafeallList();
}
