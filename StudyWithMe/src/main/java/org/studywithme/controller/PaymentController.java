package org.studywithme.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequiredArgsConstructor
public class PaymentController {

	@GetMapping("/selectProduct")
    @ResponseBody
	public void selectProduct(@RequestParam String product, Model model) {
		
		
		
	}
}
