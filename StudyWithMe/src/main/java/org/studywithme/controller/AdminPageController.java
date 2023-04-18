package org.studywithme.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.UserVO;
import org.studywithme.dto.PageDTO;
import org.studywithme.service.AdminPageService;

@Controller
public class AdminPageController {

    @Autowired
    private AdminPageService service;

//    @GetMapping("/userlist")
//    public String getUserList(Model model) {
//        List<UserVO> userList = service.getUserList();
//        model.addAttribute("userList", userList);
//        return "/adminpage/userManagement";
//    }

    @GetMapping("/userlist")
    public String getUserList(Model model, @ModelAttribute("criteria") Criteria cri) {
    	List<UserVO> userList = service.getUserList();
    	model.addAttribute("userList", userList);
    	model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
    	return "/adminpage/userManagement";
    }

}


