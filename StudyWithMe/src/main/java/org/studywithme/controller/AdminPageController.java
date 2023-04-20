package org.studywithme.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.studywithme.domain.Criteria;
import org.studywithme.dto.PageDTO;
import org.studywithme.service.AdminPageService;

@Controller
@RequestMapping("/adminpage/*")
public class AdminPageController {

    @Autowired
    private AdminPageService service;

    @GetMapping("/userlist")
    public String getUserList(Model model, Criteria cri) {
        model.addAttribute("userList", service.getUserList(cri));
        int total = service.getTotal(cri);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        return "/adminpage/userManagement";
    }
    
    @PostMapping("/deleteUser")
    @ResponseBody
    public String deleteUser(@RequestParam("userId") String userId) {
        int result = service.deleteAdminUser(userId);
        if (result == 1) {
            return "success";
        } else {
            return "fail";
        }
    }

}


