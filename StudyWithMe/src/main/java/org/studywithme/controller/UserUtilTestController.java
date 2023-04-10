package org.studywithme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.studywithme.domain.UserVO;
import org.studywithme.util.UserUtil;

@Controller
public class UserUtilTestController {
	//유저 util이 정상적으로 작동하는지 확인하기 위한 테스트 코드 입니다.
    @GetMapping("/userRoleTest")
    public String userRoleTest(Model model) {
    	UserUtil userUtil = new UserUtil();
        UserVO user = userUtil.getUserDetails();

        if (user == null) {
            return "유저 VO값이 없습니다.";
        }

        String userRole = user.getRole();
        String result;

        if ("admin".equals(userRole)) {
            result = "유저의 권한은 admin입니다.";
        } else if ("manager".equals(userRole)) {
            result = "유저의 권한은 MANAGER입니다.";
        } else if ("user".equals(userRole)){
            result = "유저의 권한은 일반 유저입니다.";
        } else {
        	result = "유저의 권한이 없거나, admin, manager,일반유저가 아닙니다.";
        }
        model.addAttribute("result", result);

        return "user/userRoleTest";
    }
}
