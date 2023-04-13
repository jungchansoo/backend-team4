package org.studywithme.controller;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.studywithme.domain.UserVO;
import org.studywithme.service.AuthMailSendService;
import org.studywithme.service.SmsService;
import org.studywithme.service.UserService;

import com.fasterxml.jackson.core.JsonProcessingException;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserController {
	
	@Autowired
	private UserService service;
	@Autowired
	private AuthMailSendService mailService;
	@Autowired
	private SmsService smsService;
	
	//회원가입 폼으로 이동
	@GetMapping("/join")
	public String join() {
		return "user/joinForm";			
	}
	

    @GetMapping("/checkIdDuplicate")
    @ResponseBody
    public boolean checkIdDuplicate(@RequestParam("userId") String userId) {
		log.info("아이디 중복 확인 버튼 클릭");
		boolean isDuplicate = service.isUserIdDuplicate(userId);
		if(isDuplicate) {
			log.info("아이디 중복 조회 결과: 중복 아이디 있음");
		} else {
			log.info("아이디 중복 조회 결과: 중복 아이디 없음");
		}

        return isDuplicate;
    }
    
    @PostMapping("/smsCheck")
    @ResponseBody
    public String smsCheck(@RequestParam String phoneNumber) {
		log.info("문자 인증 요청이 들어옴!");
		log.info("문자 인증 요청 번호 : " + phoneNumber);
    	
        // 인증번호 생성 및 전송 로직
        try {
            String verificationCode = smsService.sendVerificationCode(phoneNumber);
    		log.info("문자 전송 성공!");
            return verificationCode;

        } catch (JsonProcessingException | RestClientException | URISyntaxException | InvalidKeyException | NoSuchAlgorithmException | UnsupportedEncodingException e) {
        	e.printStackTrace();
    		log.info("문자 전송 실패");
    		return null;
        }
    }
    
    
	//이메일 인증 버튼 확인
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		log.info("이메일 인증 요청이 들어옴!");
		log.info("이메일 인증 이메일 : " + email);
		return mailService.sendJoinMail(email);
	}
	
    @PostMapping("/join")
    public String join(UserVO userVO) {
    	try {
			service.registerWithPwEncoding(userVO);
			log.info("회원가입 성공!!");
			return "redirect:/sample/all";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/sample/all";
		}
    }
    
    @GetMapping("/mypage")
    public String mypagegetList() {
    	log.info("Mypage 회원정보페이지");
    	return "user/mypage";
    }
	

}
