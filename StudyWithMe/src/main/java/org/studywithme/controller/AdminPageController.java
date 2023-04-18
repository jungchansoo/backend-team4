package org.studywithme.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.studywithme.domain.UserVO;
import org.studywithme.service.AdminPageService;

@Controller
public class AdminPageController {

    @Autowired
    private AdminPageService service;

    @GetMapping("/userlist")
    public String getUserList(Model model) {
        List<UserVO> userList = service.getUserList();
        model.addAttribute("userList", userList);
        return "/adminpage/userManagement";
    }
    
    
}
