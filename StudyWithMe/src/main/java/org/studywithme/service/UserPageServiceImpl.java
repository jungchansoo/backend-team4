package org.studywithme.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.studywithme.domain.StudyCafeVO;
import org.studywithme.mapper.StudyCafeMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@RequiredArgsConstructor
public class UserPageServiceImpl implements UserPageService {

	private final StudyCafeMapper mapper;

	@Override
	public List<StudyCafeVO> getStudyCafeList(String keyword, int currentPage, int perPage) {
		return mapper.selectStudyCafeList(keyword, currentPage, perPage);
	}

	@Override
	public int getTotalCount(String keyword) {
		return mapper.getTotalCount(keyword);
	}

	@Override
	public StudyCafeVO getStudyCafeByUserID(String userId) {
		return mapper.getStudyCafeByUserID(userId);
	}

}
