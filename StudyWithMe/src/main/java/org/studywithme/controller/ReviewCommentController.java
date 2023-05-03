package org.studywithme.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.ReviewCommentVO;
import org.studywithme.dto.CommentPageDTO;
import org.studywithme.service.ReviewCommentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReviewCommentController {
	
	private ReviewCommentService service;
	
	@PostMapping(value ="/new", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReviewCommentVO vo) {
		
		log.info("ReviewCommentVO: " + vo);
		int insertCount = service.register(vo);
		
		log.info("Reply INSERT COUNT: " + insertCount);
		
		return insertCount==1 ? new ResponseEntity<> ("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value="/pages/{reviewNo}/{page}", produces= {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE
	})
	public ResponseEntity<CommentPageDTO> getList(
			@PathVariable("page") int page,
			@PathVariable("reviewNo") Long reviewNo
			) {
		Criteria cri = new Criteria(page, 10);
		log.info("get Reply List reviewNo : " + reviewNo);
		log.info("cri : " + cri);
		return new ResponseEntity<>(service.getListPage(cri, reviewNo), HttpStatus.OK);
	}
	
	@GetMapping(value="/{commentNo}", produces= {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE
	})
	public ResponseEntity<ReviewCommentVO> get(@PathVariable("commentNo") Long commentNo ) 
	{
			
		log.info("get : " + commentNo);
		return new ResponseEntity<>(service.get(commentNo), HttpStatus.OK);
	}
	
	
	@DeleteMapping(value="/{commentNo}", produces = {	MediaType.TEXT_PLAIN_VALUE	}) 
	public ResponseEntity<String> remove(@PathVariable("commentNo") Long commentNo){
		log.info("remove : " + commentNo);
		return service.remove(commentNo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}	
	
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
			value="/{commentNo}",
			consumes="application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ReviewCommentVO vo,
			@PathVariable("commentNo") Long commentNo) {
		vo.setCommentNo(commentNo);
		log.info("commentNo : " + commentNo);
		log.info("modify : " + vo);
		
		return service.modify(vo) == 1
				? new ResponseEntity<> ("success", HttpStatus.OK)
						: new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
