package org.studywithme.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.studywithme.domain.UserVO;
import org.studywithme.security.domain.CustomUser;
import org.studywithme.service.UserService;

@Component
public class UserUtil {
	
    @Autowired
    private UserService userService;

    public void refreshUserDetails(String userId) {
    	//DB에서 새로운 유저를 가져옴
        UserVO user = userService.get(userId);
        if (user == null) {
            throw new UsernameNotFoundException("유저 아이디를 찾지 못했습니다 : " + userId);
        }
        //DB에서 가져온 새로운 유저를 가지고 Authentication 객체를 새롭게 셋팅함
        CustomUser customUser = new CustomUser(user);
        Authentication newAuth = new UsernamePasswordAuthenticationToken(customUser, customUser.getPassword(), customUser.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(newAuth);
    }
	
	public UserVO getUserDetails() {
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    if (authentication == null || !(authentication.getPrincipal() instanceof CustomUser)) {
	        return null;
	    }
        CustomUser customUser = (CustomUser) authentication.getPrincipal();

	    return customUser.getUser();
	}
}
