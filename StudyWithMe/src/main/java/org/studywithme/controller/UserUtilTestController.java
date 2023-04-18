package org.studywithme.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.studywithme.domain.UserVO;
import org.studywithme.service.UserService;
import org.studywithme.util.UserUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserUtilTestController {
	//테스트 과정에서 userName을 바꾸기 위해 주입(UserUtil과 무관)
	@Autowired
	private UserService service;
	
	//-----------!!! 중요 !!!!-------
	//유저정보를 다시 가져오려면(refreshUserDetails) UserUtil을 로컬 변수로 선언 및 autowired로 빈으로 등록해야함
	@Autowired
	private UserUtil util;
	
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
        
        //이하 refreshUserDetails 테스트를 위한 DB 변경
	    user.setUserName("유저이름 변경 테스트2");
	    boolean nameChangeResult = service.modifyUserNameForTest(user);
	    if(!nameChangeResult) {
	        log.info("유저이름 변경에 실패했습니다.");
	    }
        log.info("유저이름 변경에 성공했습니다."+user.getUserName());
        
	    //DB에서 다시 userID를 가져와서 셋팅함
        log.info("userID:"+ user.getUserId());
        
        //ID를 기반으로 유저 정보를 서버에서 새롭게 받아옴.
        util.refreshUserDetails(user.getUserId());
        
        //아래처럼 메소드 안에서 UserUtil 인스턴스를 생성한 경우 nullPointException 발생
//        userUtil.refreshUserDetails(user.getUserId());
        
        //View에서 볼 수 있도록 attribute 추가. 이때, getUserDetails 메소드를 다시 실행하도록 하여 Authentication을 새로 가져옴
        //기존에 메소드 안에서 선언한 userUtil로 유저 정보를 가져오는건 가능
        model.addAttribute("nameChangeResult", userUtil.getUserDetails().getUserName());
        
        //로컬로 선언한 util에서 userUtil로 유저 정보를 가져오는것도 가능
        model.addAttribute("nameChangeResult2", util.getUserDetails().getUserName());

        
        return "user/userRoleTest";
    }
}
