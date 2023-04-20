package org.studywithme.service;

import java.util.List;

import org.studywithme.domain.Criteria;
import org.studywithme.domain.UserVO;

public interface AdminPageService {

	public List<UserVO> getUserList(Criteria cri);
	public int getTotal(Criteria cri);
    public int deleteAdminUser(String userId); // 회원 탈퇴


}
