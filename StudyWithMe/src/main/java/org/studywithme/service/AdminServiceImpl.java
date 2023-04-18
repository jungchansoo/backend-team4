package org.studywithme.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.studywithme.domain.UserVO;
import org.studywithme.mapper.UserMapper;

public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private UserMapper mapper;

	@Override
	public List<UserVO> getUserList() {
		return mapper.getUserList();
	}

}
