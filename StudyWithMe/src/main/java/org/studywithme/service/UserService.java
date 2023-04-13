package org.studywithme.service;

import org.studywithme.domain.UserVO;

public interface UserService {
	public void registerWithPwEncoding(UserVO vo);
	public UserVO get(String userId);
    public boolean isUserIdDuplicate(String userId);
//	public boolean modify(UserVO vo);
//	public boolean remove(String userId);

//	public List<UserVO> getList();
	
	public UserVO mypageGetList(String userId);
	public boolean updatePw(UserVO vo);
	

}
