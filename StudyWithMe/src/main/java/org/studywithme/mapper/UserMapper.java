package org.studywithme.mapper;

import org.apache.ibatis.annotations.Param;
import org.studywithme.domain.UserVO;

public interface UserMapper {

	public UserVO read(String userid); // 로그인

	public void join(UserVO vo); // 회원가입

	int checkUserId(String userid); // 아이디 중복확인

	public int updateUserNameForTest(UserVO vo); // UserName 변경(테스트용)

	public String searchIdbyEmail(@Param("userName") String userName, @Param("email") String email);

	public String searchIdbyPhoneNumber(@Param("userName") String userName, @Param("phoneNumber") String phoneNumber);

	public UserVO searchUserPassword(@Param("userId") String userId, @Param("userName") String userName, @Param("email") String email);

	public int updatePasswordByEmail(@Param("email") String email, @Param("encodedPw") String encodedPw);
}
