package org.studywithme.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.studywithme.domain.UserVO;
import org.studywithme.service.UserService;
import org.studywithme.util.UserUtil;

import lombok.AllArgsConstructor;

@Controller
public class MypageController {

	@Autowired
	private UserService service;
	
	@Autowired
	@Qualifier("bcryptPasswordEncoder")
	private PasswordEncoder passwordEncoder;
	

	@GetMapping("/userinfo")
	public String mypageuserinfo(Model model) {
		UserUtil util = new UserUtil();
		UserVO vo = util.getUserDetails();
		model.addAttribute("loginUser", vo);
		model.addAttribute("name", vo.getUserName());
		model.addAttribute("password", vo.getPassword());
		return "/mypage/userinfo";
	}
	
	@GetMapping("/reservationList")
	public String reservationList() {
		return "/mypage/reservationList";
	}
	
	@GetMapping("/updatePw")
	public String updatepw() {
		return "/mypage/updatePw";
	}
	
	
	@PostMapping("/userpwchangers")
	public String updateUserPassword(@RequestParam("password") String currentPassword,
	                                  @RequestParam("newPassword") String newPassword,
	                                  @RequestParam("pw_confirm") String newPasswordConfirm,
	                                  RedirectAttributes rttr) {
		UserUtil util = new UserUtil();
		UserVO vo = util.getUserDetails();

	   
	    // 기존 비밀번호가 일치하는지 확인
	    if (!passwordEncoder.matches(currentPassword, vo.getPassword())) {
	        rttr.addFlashAttribute("error", "기존 비밀번호가 일치하지 않습니다.");
	        return "redirect:/mypage/userinfo";
	    }

	    // 새 비밀번호와 비밀번호 확인이 일치하는지 확인
	    if (!newPassword.equals(newPasswordConfirm)) {
	        rttr.addFlashAttribute("error", "새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
	        return "redirect:/mypage/userinfo";
	    }

	    // 새 비밀번호를 암호화하여 업데이트
	    String encodedPassword = passwordEncoder.encode(newPassword);
	    vo.setPassword(encodedPassword);
	    service.updatePw(vo);

	    rttr.addFlashAttribute("success", "비밀번호가 변경되었습니다.");
	    return "redirect:/mypage/userinfo";
	}

	
		@GetMapping("/deleteUser")
		public String iddelete() {
			
			return "/mypage/deleteUser";
		}

		@PostMapping("/deleteUser")
		public String deleteUser(@RequestParam String userId, @RequestParam String password, @RequestParam String passwordConfirm, RedirectAttributes rttr) {
			
			if (!password.equals(passwordConfirm)) {
				// 비밀번호 확인이 일치하지 않으면 에러 메시지를 전달하고 마이페이지로 돌아갑니다.
				rttr.addFlashAttribute("error", "비밀번호 확인이 일치하지 않습니다.");
				return "redirect:/deleteUser";
			}

			// 입력받은 비밀번호를 암호화합니다.
			String encodedPassword = passwordEncoder.encode(password);

			// 회원 탈퇴를 시도합니다.
			boolean success = service.deleteUser(userId);

			if (success) {
				// 회원 탈퇴가 성공하면 로그아웃하고 로그인 화면으로 이동합니다.
				rttr.addFlashAttribute("message", "회원 탈퇴가 완료되었습니다. 이용해 주셔서 감사합니다.");
				return "redirect:/login";
			} else {
				// 회원 탈퇴가 실패하면 에러 메시지를 전달하고 마이페이지로 돌아갑니다.
				rttr.addFlashAttribute("error", "회원 탈퇴에 실패했습니다. 입력한 정보를 다시 확인해주세요.");
				return "redirect:/deleteUser";
			}
		}
	


}
