package org.studywithme.service;

public interface AuthMailSendService {
	public String sendJoinMail(String userMail);

	public void mailSend(String setFrom, String receiverMail, String title, String content);
}
