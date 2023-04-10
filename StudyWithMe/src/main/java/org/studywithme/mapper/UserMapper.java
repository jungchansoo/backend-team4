package org.studywithme.mapper;

import org.studywithme.domain.UserVO;

public interface UserMapper {

	public void join(UserVO vo);
	public UserVO read(String userid);
	public UserVO mypageGetList(String userId);
	
}
