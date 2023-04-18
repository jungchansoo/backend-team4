package org.studywithme.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.studywithme.domain.UserVO;
import org.studywithme.service.UserService;
import org.studywithme.util.UserUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MypageController {

	@Autowired
	private UserService service;

	@Autowired
	@Qualifier("bcryptPasswordEncoder")
	private PasswordEncoder passwordEncoder;

	@GetMapping("/userinfo")
	public String mypageuserinfo(Model model) {
		UserVO vo = new UserUtil().getUserDetails();
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
	public String updatePwForm() {
	return "/mypage/updatePw";
	}

	@PostMapping("/userpwchangers")
	public String updateUserPassword(@RequestParam("currentPassword") String currentPassword,
	        @RequestParam("newPassword") String newPassword, @RequestParam("newPasswordConfirm") String newPasswordConfirm,
	        RedirectAttributes rttr) {
//	    log.info("updateUserPassword 호출");
	    UserVO vo = new UserUtil().getUserDetails();
	    // 기존 비밀번호가 일치하는지 확인
	    if (!passwordEncoder.matches(currentPassword, vo.getPassword())) {
	        rttr.addFlashAttribute("error", "기존 비밀번호가 일치하지 않습니다.");
//		    log.info("기존 비밀번호가 일치하지 않습니다.");
	        return "redirect:/userinfo";
	    }
	    // 새 비밀번호와 비밀번호 확인이 일치하는지 확인
	    if (!newPassword.equals(newPasswordConfirm)) {
	        rttr.addFlashAttribute("error", "새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
//	        log.info("새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
	        return "redirect:/updatePw";
	    }
	    // 새 비밀번호를 암호화하여 업데이트
	    vo.setPassword(newPassword);
	    boolean result = service.updatePw(vo);
	    if (!result) {
	        rttr.addFlashAttribute("error", "비밀번호 변경에 실패했습니다.");
//	        log.info("비밀번호 변경에 실패했습니다.");
	        return "redirect:/updatePw";
	    }
	    rttr.addFlashAttribute("success", "비밀번호가 변경되었습니다.");
//	    log.info("비밀번호가 변경되었습니다.");
	    return "redirect:/userinfo";
	}



	@GetMapping("/deleteUser")
	public String iddelete(Model model) {
		UserVO vo = new UserUtil().getUserDetails();
		model.addAttribute("name", vo.getUserName());
		model.addAttribute("userid", vo.getUserId());
		return "/mypage/deleteUser";
	}

	@PostMapping("/deleteUser")
	public String deleteUser(@RequestParam String userId, @RequestParam String password,
	                          @RequestParam String passwordConfirm, RedirectAttributes rttr) {

	    UserVO vo = new UserUtil().getUserDetails();

	    if (!password.equals(passwordConfirm)) {
	        // 비밀번호 확인이 일치하지 않으면 에러 메시지를 전달하고 마이페이지로 돌아갑니다.
	        rttr.addFlashAttribute("error", "비밀번호 확인이 일치하지 않습니다.");
//	        log.info("비밀번호 확인이 일치하지 않습니다.");
	        return "redirect:/deleteUser";
	    }

	    // 입력받은 비밀번호를 암호화합니다.
	    String encodedPassword = passwordEncoder.encode(password);

	    // DB에 저장된 비밀번호를 가져옵니다.
	    String dbPassword = vo.getPassword();
//	    log.info("encodedPassword : "+encodedPassword);
//	    log.info("dbPassword: "+dbPassword);
	    
	    // 암호화된 비밀번호와 DB에 저장된 비밀번호를 비교합니다.
	    if (passwordEncoder.matches(password, dbPassword)) {
	        // 암호화된 비밀번호와 DB에 저장된 비밀번호가 일치하면 회원 탈퇴를 시도합니다.
	        boolean success = service.deleteUser(userId);
	        if (success) {
	            // 회원 탈퇴가 성공하면 로그아웃하고 로그인 화면으로 이동합니다.
	            rttr.addFlashAttribute("message", "회원 탈퇴가 완료되었습니다. 이용해 주셔서 감사합니다.");
//	            log.info("회원탈퇴완료");
	            return "redirect:/login";
	        } else {
	            // 회원 탈퇴가 실패하면 에러 메시지를 전달하고 마이페이지로 돌아갑니다.
	            rttr.addFlashAttribute("error", "회원 탈퇴에 실패했습니다. 입력한 정보를 다시 확인해주세요.");
//	            log.info("회원탈퇴실패");
	            return "redirect:/deleteUser";
	        }
	    } else {
	        // 비밀번호가 일치하지 않으면 에러 메시지를 전달하고 마이페이지로 돌아갑니다.
	        rttr.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
//	        log.info("비밀번호가 일치하지 않습니다.");
	        return "redirect:/deleteUser";
	    }
	}


}
