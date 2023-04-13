package org.studywithme.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.studywithme.domain.UserVO;
import org.studywithme.service.UserService;
import org.studywithme.util.UserUtil;

@Controller
public class MypageController {

	@Autowired
	private UserService service;

	@GetMapping("/mypage")
	public String mypageuserinfo(Model model) {
		UserUtil util = new UserUtil();
		UserVO vo = util.getUserDetails();
		model.addAttribute("loginUser", vo);
		model.addAttribute("name", vo.getUserName());
		model.addAttribute("password", vo.getPassword());
		return "/user/mypage";
	}
	
	@GetMapping("/updatePw")
	public String updatepw() {
		return "/user/updatePw";
	}
	
	@PostMapping("/userpwchangers")
	public String updatePassword(@RequestParam("newPassword") String newPassword, RedirectAttributes rttr) {
	    UserUtil util = new UserUtil();
	    UserVO vo = util.getUserDetails();
	    vo.setPassword(newPassword);
	    boolean isSuccess = service.updatePw(vo);
	    if (isSuccess) {
	        rttr.addFlashAttribute("successMsg", "비밀번호가 변경되었습니다.");
	    } else {
	        rttr.addFlashAttribute("errorMsg", "비밀번호 변경에 실패했습니다.");
	    }
	    return "redirect:/user/updatePw";
	}
}
