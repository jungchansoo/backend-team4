package org.studywithme.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.StudyCafeVO;
import org.studywithme.mapper.StudyCafeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserPageServiceImpl implements UserPageService {
	
	private StudyCafeMapper mapper;

	@Override
	public List<StudyCafeVO> getList() {
		
		log.info("get List with criteria: " );
		return mapper.getList();
	}

}
