package org.studywithme.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.studywithme.domain.UserVO;
import org.studywithme.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;

	@Autowired
	@Qualifier("bcryptPasswordEncoder")
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private AuthMailSendService authMailSendService;

	@Override
	public void registerWithPwEncoding(UserVO vo) {
		log.info("register...." + vo);
		String rawPassword = vo.getPassword();
		String encodedPassword = passwordEncoder.encode(rawPassword);
		vo.setPassword(encodedPassword);

		mapper.join(vo);
	}

	@Override
	public UserVO get(String userId) {
		log.info("read...." + userId);
		return mapper.read(userId);
	}

	@Override
	public boolean isUserIdDuplicate(String userId) {
		boolean isUserIdDuplicate = false;
		int count = mapper.checkUserId(userId);
		if (count > 0) {
			isUserIdDuplicate = true;
		}
		return isUserIdDuplicate;
	}

	@Override
	public boolean modifyUserNameForTest(UserVO vo) {
		log.info("update...." + vo.getUserName());
		return mapper.updateUserNameForTest(vo)==1;
	}

	@Override
	public String searchIdbyEmail(String userName, String email) {
		return mapper.searchIdbyEmail(userName, email);
	}

	@Override
	public String searchIdbyPhoneNumber(String userName, String PhoneNumber) {
		return mapper.searchIdbyPhoneNumber(userName, PhoneNumber);
	}
	
	@Override
	public String sendTempPwMail(@Param("userId") String userId, @Param("userName") String userName,
			@Param("email") String email) {
	    // DB에서 해당하는 유저 정보 확인
	    UserVO user = mapper.searchUserPassword(userId, userName, email);
	    if (user == null) {
	        throw new IllegalArgumentException("해당하는 유저 정보를 찾을 수 없습니다.");
	    }
	    log.info("유저확인완료");

	    // 임시 비밀번호 생성
	    String tempPw = Double.toString(Math.random()).substring(2);

	    // 메일 전송
	    authMailSendService.sendTempPwMail(email, tempPw);
	    log.info("메일전송");

	    // 임시 비밀번호 암호화
	    String encodedPw = passwordEncoder.encode(tempPw);

	    // DB에 저장
	    mapper.updatePasswordByEmail(email, encodedPw);
	    log.info("임시비밀번호 암호화 후 db에 저장");

	    return tempPw;
	}




}
