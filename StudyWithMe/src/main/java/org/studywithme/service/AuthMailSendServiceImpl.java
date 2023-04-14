package org.studywithme.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.studywithme.util.AuthUtil;

@Service
public class AuthMailSendServiceImpl implements AuthMailSendService {
	@Autowired
	private JavaMailSenderImpl mailSender;

	@Override
	public String sendJoinMail(String userMail) {
		//난수 생성
		AuthUtil util = new AuthUtil();
		int authNumber = util.makeRandomNumber();
		
		//메일 작성

		String setFrom = "StudyWithMeForEgg@gmail.com"; // 보내는 사람 
		String title = "Study With Me 서비스 회원 가입 인증 이메일 입니다."; // 이메일 제목 
		String content = 
				"저희 서비스를 방문해 주셔서 감사합니다." + 	//html 형식으로 작성 ! 
                "<br><br>" + 
			    "인증 번호는 <Strong>" + authNumber + "</Strong>입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
		//메일 전송
		mailSend(setFrom, userMail, title, content);
		return Integer.toString(authNumber);
	}
	
	@Override
	public void mailSend(String setFrom, String setTo, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			//메일에 값 셋팅
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(setTo);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			//메일 전송
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

}
