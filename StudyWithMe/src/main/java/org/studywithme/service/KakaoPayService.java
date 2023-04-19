package org.studywithme.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.studywithme.domain.KakaoPayApprovalVO;
import org.studywithme.domain.KakaoPayReadyVO;
import org.studywithme.mapper.KaKaoPayMapper;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class KakaoPayService {
    private static final String HOST = "https://kapi.kakao.com";
    
    private final KaKaoPayMapper mapper;
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    
    public String kakaoPayReady(String item_name, String price) {
 
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "c842f6150ae1b12b06bdbe93a1488d31");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "gorany");
        params.add("item_name", item_name);
        params.add("quantity", "1");
        params.add("total_amount", price);
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://localhost:8080/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8080/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8080/kakaoPaySuccessFail");
 
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            log.info("" + kakaoPayReadyVO);
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
        	log.error("rest api error", e);
        } catch (URISyntaxException e) {
        	log.error("uri syntax error", e);
        }
        
        return "/pay";
    }
    
    public KakaoPayApprovalVO kakaoPayInfo(String pg_token, String product, String price, String userId) {
 
        log.info("KakaoPayInfoVO............................................");
        log.info("-----------------------------");
        
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "c842f6150ae1b12b06bdbe93a1488d31");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "gorany");
        params.add("pg_token", pg_token);
        params.add("total_amount", price);
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            log.info("" + kakaoPayApprovalVO);
            
            return kakaoPayApprovalVO;
        } catch (RestClientException e) {
        	log.error("rest api error", e);
        } catch (URISyntaxException e) {
        	log.error("uri syntax error", e);
        }
        
       
        
        return null;
    }
    
    public void kakaoUpdate(String product, String price, String userId) {
    	String[] productInfo = product.split(" "); // 공백을 기준으로 문자열 나누기
        String itemName = productInfo[0]; // 첫 번째 요소가 상품명
        String duration = productInfo[1]; // 두 번째 요소가 기간
        log.info("==========================================================");
        log.info(itemName);
        log.info(duration);
        log.info(userId);
        
        if(itemName.equals("스터디석")) {
        	if(duration.equals("1시간권")) mapper.addSeatTime(1 * 60, userId);
        	else if(duration.equals("3시간권")) mapper.addSeatTime(3 * 60, userId);
        	else if(duration.equals("6시간권")) mapper.addSeatTime(6 * 60, userId);
        	else if(duration.equals("1일권(24시간권)")) mapper.addSeatTime(24 * 60, userId);
        	else if(duration.equals("3일권(72시간권)")) mapper.addSeatTime(72 * 60, userId);
        }
        else if(itemName.equals("스터디룸")) {
        	if(duration.equals("1시간권")) mapper.addStudyRoomTime(1 * 60, userId);
        	else if(duration.equals("3시간권")) mapper.addStudyRoomTime(3 * 60, userId);
        	else if(duration.equals("6시간권")) mapper.addStudyRoomTime(6 * 60, userId);
        	else if(duration.equals("1일권(24시간권)")) mapper.addStudyRoomTime(24 * 60, userId);
        	else if(duration.equals("3일권(72시간권)")) mapper.addStudyRoomTime(72 * 60, userId);
        }
        else {
        	
        }
    }
    
}