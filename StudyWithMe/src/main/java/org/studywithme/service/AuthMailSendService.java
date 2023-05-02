package org.studywithme.service;

public interface AuthMailSendService {
	public String sendJoinMail(String userMail);
	
	public String sendTempPwMail(String userMail, String tempPw);

	public void mailSend(String setFrom, String receiverMail, String title, String content);
}
