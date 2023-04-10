package org.studywithme.mapper;

import org.studywithme.domain.UserVO;

public interface UserMapper {

	public UserVO read(String userid);
	public void join(UserVO vo);
}
