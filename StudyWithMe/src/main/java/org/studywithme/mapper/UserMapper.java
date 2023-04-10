package org.studywithme.mapper;

import org.studywithme.domain.UserVO;

public interface UserMapper {

	public UserVO read(String userid); // 로그인
	public void join(UserVO vo); //회원가입
	int checkUserId(String userid); //아이디 중복확인
}
