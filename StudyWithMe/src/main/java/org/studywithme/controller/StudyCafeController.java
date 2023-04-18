package org.studywithme.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.studywithme.domain.StudyCafeVO;
import org.studywithme.service.UserPageService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequiredArgsConstructor
public class StudyCafeController {

	private final UserPageService service;

	@GetMapping("/getStudyCafeList")
    @ResponseBody
    public List<StudyCafeVO> getStudyCafeList(@RequestParam String keyword, int currentPage, int perPage){
		// 검색키워드 , currentPage, perPage(화면 노출할 리스 개수)
		log.info("getList...............");

		List<StudyCafeVO> result = service.getStudyCafeList(keyword, currentPage, perPage);

		log.info(result);
		return result;
	}

	@GetMapping("/mytest")
	public String test() {
	    return "my test test";
	}

	@GetMapping("/totalCount")
	public int getTotalCount(String keyword) {

		return service.getTotalCount(keyword);
	}

}
