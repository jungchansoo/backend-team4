package org.studywithme.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.studywithme.domain.UserVO;
import org.studywithme.security.domain.CustomUser;


public class SecurityUtils {
    public static UserVO getUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !(authentication.getPrincipal() instanceof CustomUser)) {
            return null;
        }
        CustomUser customUser = (CustomUser) authentication.getPrincipal();
        return customUser.getUser();
    }
}