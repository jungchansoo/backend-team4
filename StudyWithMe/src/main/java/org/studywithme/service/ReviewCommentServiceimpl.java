package org.studywithme.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.ReviewCommentVO;
import org.studywithme.dto.CommentPageDTO;
import org.studywithme.mapper.ReviewBoardMapper;
import org.studywithme.mapper.ReviewCommentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
public class ReviewCommentServiceimpl implements ReviewCommentService {

	
	
	@Setter(onMethod_ = @Autowired)
	private ReviewCommentMapper mapper; 	
	
	@Setter(onMethod_ = @Autowired)
	private ReviewBoardMapper boardMapper; 

	@Transactional
	@Override
	public int register(ReviewCommentVO vo, Long reviewNo) {
		log.info("register....." + vo);
		boardMapper.increaseReplyCnt(reviewNo);
		return mapper.insert(vo);
	}

	@Override
	public ReviewCommentVO get(Long commentNo) {
		log.info("get........."+commentNo);
		return mapper.read(commentNo);
	}

	@Override
	public int modify(ReviewCommentVO vo) {
		log.info("get........."+vo);
		return mapper.update(vo);
	}
	@Transactional
	@Override
	public int remove(Long commentNo, Long reviewNo) {
		log.info("get........."+commentNo);
		boardMapper.decreaseReplyCnt(reviewNo);
		return mapper.delete(commentNo);
	}

	@Override
	public List<ReviewCommentVO> getList(Criteria cri, Long reviewNo) {
		log.info("get Reply List of a Board"+reviewNo);
		return mapper.getListWithPaging(cri, reviewNo);
	}

	@Override
	public CommentPageDTO getListPage(Criteria cri, Long reviewNo) {
		
		return new CommentPageDTO(mapper.getCountByReviewNo(reviewNo), mapper.getListWithPaging(cri, reviewNo));
	}

}
