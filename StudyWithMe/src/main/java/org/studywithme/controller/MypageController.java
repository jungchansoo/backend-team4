package org.studywithme.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.studywithme.domain.ReservationCriteria;
import org.studywithme.domain.UserVO;
import org.studywithme.dto.ReservationPageDTO;
import org.studywithme.service.MypageService;
import org.studywithme.util.UserUtil;
import org.studywithme.util.changetime;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MypageController {

	@Autowired
	private MypageService service;

	@Autowired
	@Qualifier("bcryptPasswordEncoder")
	private PasswordEncoder passwordEncoder;

	@GetMapping("/userinfo")
	public String mypageuserinfo(Model model) {
		UserVO vo = new UserUtil().getUserDetails();
		changetime changer = new changetime();
		String remainingSeatTime = changer.time_longtoString(vo.getRemainingSeatTime());
		String remainingRoomTime = changer.time_longtoString(vo.getRemainingStudyRoomTime());
		String remainingLockerTime = changer.time_longtoString(vo.getRemainingLockerTime());
		model.addAttribute("seattime", remainingSeatTime);
		model.addAttribute("roomtime", remainingRoomTime);
		model.addAttribute("lockertime", remainingLockerTime);

		return "/mypage/userinfo";
	}

	@GetMapping("/reservationList")
	public String reservationList( ReservationCriteria recri,Model model) {
		UserVO vo = new UserUtil().getUserDetails();
		String userId = vo.getUserId();
		recri.setUserId(userId);
		model.addAttribute("reservationList", service.getReservationListWithPaging(recri));
		int total = service.getTotalReservationCount(recri);
		model.addAttribute("pageMaker", new ReservationPageDTO(recri, total));
		changetime changer = new changetime();
		model.addAttribute("changer", changer);
		return "/mypage/reservationList";
	}
	
	@GetMapping("/updatePw")
	public String updatePwForm() {
		return "/mypage/updatePw";
	}

	@PostMapping("/userpwchangers")
	@ResponseBody
	public String updateUserPassword(@RequestParam("currentPassword") String currentPassword,
			@RequestParam("newPassword") String newPassword,
			@RequestParam("newPasswordConfirm") String newPasswordConfirm) {

		UserVO vo = new UserUtil().getUserDetails();
		// 기존 비밀번호가 일치하는지 확인
		if (!passwordEncoder.matches(currentPassword, vo.getPassword())) {
			return "fail_current_pw";
		}
		// 새 비밀번호와 비밀번호 확인이 일치하는지 확인
		if (!newPassword.equals(newPasswordConfirm)) {
			return "fail_new_pw_confirm";
		}
		// 새 비밀번호를 암호화하여 업데이트
		vo.setPassword(newPassword);
		boolean result = service.updatePw(vo);
		if (!result) {
			return "fail_update_pw";
		}
		log.info("비밀번호가변경되었습니다.");
		return "success";
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
			return "redirect:/deleteUser";
		}

		// 입력받은 비밀번호를 암호화합니다.
		String encodedPassword = passwordEncoder.encode(password);

		// DB에 저장된 비밀번호를 가져옵니다.
		String dbPassword = vo.getPassword();

		// 암호화된 비밀번호와 DB에 저장된 비밀번호를 비교합니다.
		if (passwordEncoder.matches(password, dbPassword)) {
			// 암호화된 비밀번호와 DB에 저장된 비밀번호가 일치하면 회원 탈퇴를 시도합니다.
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
		} else {
			// 비밀번호가 일치하지 않으면 에러 메시지를 전달하고 마이페이지로 돌아갑니다.
			rttr.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
			return "redirect:/deleteUser";
		}
	}

}
