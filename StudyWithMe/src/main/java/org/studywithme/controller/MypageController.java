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
	
	@GetMapping("/updatePw")
	public String updatepw() {
		return "/mypage/updatePw";
	}
	
	
	@PostMapping("/userpwchangers")
	public String updateUserPassword(@RequestParam("password") String currentPassword, 
	        @RequestParam("newPassword") String newPassword, Model model) {
	    
	    // 현재 로그인된 사용자 정보 가져오기
	    UserUtil util = new UserUtil();
	    UserVO vo = util.getUserDetails();
	    
	    // 현재 비밀번호가 일치하는지 확인
	    if (!passwordEncoder.matches(currentPassword, vo.getPassword())) {
	        model.addAttribute("error", "현재 비밀번호가 일치하지 않습니다.");
	        return "errorPage"; // 비밀번호가 일치하지 않을 경우 에러 페이지로 이동
	    }
	    
	    // 새로운 비밀번호 업데이트하기
	    String encodedPassword = passwordEncoder.encode(newPassword);
	    vo.setPassword(encodedPassword);
	    service.updatePw(vo);
	    model.addAttribute("message", "비밀번호가 변경되었습니다.");
	    
	    return "redirect:/mypage/updatePw"; // 비밀번호가 업데이트된 후 마이페이지로 이동
	}
		
	


		@GetMapping("/deleteUser")
		public String myPage() {
			// 마이페이지 화면으로 이동하는 코드
			return "/mypage/deleteUser";
		}

		@PostMapping("/deleteUser")
		public String deleteUser(@RequestParam String userId, @RequestParam String password, @RequestParam String passwordConfirm, RedirectAttributes rttr) {
			
			if (!password.equals(passwordConfirm)) {
				// 비밀번호 확인이 일치하지 않으면 에러 메시지를 전달하고 마이페이지로 돌아갑니다.
				rttr.addFlashAttribute("error", "비밀번호 확인이 일치하지 않습니다.");
				return "redirect:/mypage";
			}

			// 입력받은 비밀번호를 암호화합니다.
			String encodedPassword = passwordEncoder.encode(password);

			// 회원 탈퇴를 시도합니다.
			boolean success = service.deleteUser(userId);

			if (success) {
				// 회원 탈퇴가 성공하면 로그아웃하고 로그인 화면으로 이동합니다.
				rttr.addFlashAttribute("message", "회원 탈퇴가 완료되었습니다. 이용해 주셔서 감사합니다.");
				return "redirect:/logout";
			} else {
				// 회원 탈퇴가 실패하면 에러 메시지를 전달하고 마이페이지로 돌아갑니다.
				rttr.addFlashAttribute("error", "회원 탈퇴에 실패했습니다. 입력한 정보를 다시 확인해주세요.");
				return "redirect:/mypage";
			}
		}
	


}
