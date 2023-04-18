package org.studywithme.service;

import java.util.List;

import org.studywithme.domain.Criteria;
import org.studywithme.domain.UserVO;

public interface AdminPageService {

	public List<UserVO> getUserList();

	public List<UserVO> getList(Criteria cri); // 페이징

	public int getTotal(Criteria cri);

}
