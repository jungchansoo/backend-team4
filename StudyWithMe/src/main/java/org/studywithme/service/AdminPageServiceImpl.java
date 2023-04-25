package org.studywithme.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.UserVO;
import org.studywithme.mapper.MypageMapper;
import org.studywithme.mapper.UserMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminPageServiceImpl implements AdminPageService {

	@Autowired
	private MypageMapper mapper;

	@Override
	public List<UserVO> getListWithPaging(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public int deleteAdminUser(String userId) {
        return mapper.deleteUser(userId);
	}

}
