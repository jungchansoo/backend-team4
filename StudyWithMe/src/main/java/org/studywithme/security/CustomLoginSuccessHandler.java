package org.studywithme.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {

		log.warn("Login Success");

		List<String> roleNames = new ArrayList<>();

		auth.getAuthorities().forEach(authority -> {
			log.info("리스트에 추가된 role: "+authority.getAuthority());
			roleNames.add(authority.getAuthority());

		});

		//각 메인 페이지로 이동하도록 수정 필요.
		if (roleNames.contains("admin")) {
			log.warn("ROLE NAMES: " + roleNames);

			response.sendRedirect("/sample/admin");
			return;
		}

		if (roleNames.contains("manager")) {
			log.warn("ROLE NAMES: " + roleNames);

			response.sendRedirect("/sample/manager");
			return;
		}

		if (roleNames.contains("user")) {
			log.warn("ROLE NAMES: " + roleNames);

			response.sendRedirect("/sample/all");
			return;
		}

		response.sendRedirect("/");
	}
}


