package org.studywithme.service;

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


}
