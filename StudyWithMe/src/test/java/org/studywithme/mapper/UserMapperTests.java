package org.studywithme.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.studywithme.domain.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
		,"file:src/main/webapp/WEB-INF/spring/security-context.xml"
		}
)
@Log4j
public class UserMapperTests {
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;

	@Test
	public void testRead() {
		UserVO vo = mapper.read("testuser5");

		assertNotNull(vo);
		assertEquals("testuser5", vo.getUserId());
		log.info(vo);
	}

	@Test
	public void testJoin() {
		UserVO vo = new UserVO();
		vo.setUserId("testuser");
		vo.setPassword("testpassword");
		vo.setUserName("홍길동2");
		vo.setPhoneNumber("010-1234-5678");
		vo.setEmail("test@example.com");
		vo.setRole("admin");

		mapper.join(vo);

		log.info(vo);
	}

	@Test
	public void testJoinWithPasswordEncoding() {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		UserVO vo = new UserVO();
		vo.setUserId("testuser7");
		vo.setPassword(passwordEncoder.encode("testpassword"));
		vo.setUserName("홍길동2");
		vo.setPhoneNumber("010-1234-5678");
		vo.setEmail("test@example.com");
		vo.setRole("admin");

		mapper.join(vo);

		log.info(vo);
	}
}
