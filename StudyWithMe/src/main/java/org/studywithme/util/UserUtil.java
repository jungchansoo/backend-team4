package org.studywithme.util;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.studywithme.domain.UserVO;

public class UserUtil {
	public UserVO getUserDetails() {
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    if (authentication == null) {
	        return null;
	    }
	    return (UserVO) authentication.getPrincipal();
	}
}
