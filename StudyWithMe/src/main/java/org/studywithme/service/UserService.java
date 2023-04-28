package org.studywithme.service;

import org.studywithme.domain.UserVO;

public interface UserService {
	public void registerWithPwEncoding(UserVO vo);
	public UserVO get(String userId);
    public boolean isUserIdDuplicate(String userId);
    public String searchIdbyEmail(String userName, String email);
    public String searchIdbyPhoneNumber(String userName, String PhoneNumber);

    //	public boolean modify(UserVO vo);
//	public boolean remove(String userId);

//	public List<UserVO> getList();

	public boolean modifyUserNameForTest(UserVO vo);


}
