package org.studywithme.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.studywithme.domain.UserVO;
import org.studywithme.service.KakaoPayService;
import org.studywithme.util.UserUtil;

import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
public class KakaoPayReadyController {
    private final KakaoPayService kakaopay;
    
    @GetMapping("/kakaoPay")
    public String kakaoPay(@RequestParam("product") String product, @RequestParam("price") String price, HttpSession session) {
        log.info("kakaoPay post............................................");
        log.info("product : " + product);
        log.info("price : " + price);
        
        session.setAttribute("product", product);
        session.setAttribute("price", price);
        
        return "redirect:" + kakaopay.kakaoPayReady(product, price);
    }
    
    @GetMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, HttpSession session) {
    	
    	UserUtil util = new UserUtil();
		UserVO vo = util.getUserDetails();
		String product = (String) session.getAttribute("product");
        String price = (String) session.getAttribute("price");
        
        log.info("product:" + product);
        log.info("price:" + price);

        kakaopay.kakaoUpdate(product, price, vo.getUserId());
		
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        
        
        
        
        
        
        
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token, product, price, vo.getUserId()));
        
        // 결제 완료 후 이동 페이지
        return "redirect:/userMainPage";
    }
    
}