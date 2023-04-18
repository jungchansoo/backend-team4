package org.studywithme.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.studywithme.domain.UserVO;
import org.studywithme.mapper.UserMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminPageServiceImpl implements AdminPageService {
	
	@Autowired
	private UserMapper mapper;

	@Override
	public List<UserVO> getUserList() {
		return mapper.getUserList();
	}

}
