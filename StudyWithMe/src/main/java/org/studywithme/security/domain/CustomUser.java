package org.studywithme.security.domain;

import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.studywithme.domain.UserVO;

import lombok.Getter;

@Getter
public class CustomUser extends User {

	private static final long serialVersionUID = 1L;

	private UserVO user;

	public CustomUser(String username, String password,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CustomUser(UserVO vo) {
		super(vo.getUserId(), vo.getPassword(), Collections.singletonList(new SimpleGrantedAuthority(vo.getRole())));
		this.user = vo;
	}
}
