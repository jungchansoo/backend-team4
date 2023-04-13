package org.studywithme.service;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import org.springframework.web.client.RestClientException;
import org.studywithme.dto.MessageDTO;
import org.studywithme.dto.SmsResponseDTO;

import com.fasterxml.jackson.core.JsonProcessingException;

public interface SmsService {
	//네이버 api 양식에 맞는 헤더 구성
	public String makeSignature(Long time) throws NoSuchAlgorithmException, UnsupportedEncodingException, InvalidKeyException;
	//문자 보내기
	public SmsResponseDTO sendSms(MessageDTO messageDto) throws JsonProcessingException, RestClientException,
			URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, UnsupportedEncodingException;
	//인증 번호 보내기
	public String sendVerificationCode(String phoneNumber) throws JsonProcessingException, RestClientException,
			URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, UnsupportedEncodingException;

}