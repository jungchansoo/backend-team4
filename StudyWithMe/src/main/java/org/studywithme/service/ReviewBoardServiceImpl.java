package org.studywithme.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.ReviewVO;
import org.studywithme.mapper.ReviewBoardMapper;

import lombok.Setter;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService {

	@Setter(onMethod_ = @Autowired)
	private ReviewBoardMapper mapper;
	
	@Override
	public void register(int cafeNo, ReviewVO review) {
		mapper.insert(cafeNo, review);
	}

	@Override
	public ReviewVO get(Long reviewNo) {
		return mapper.read(reviewNo);
	}

	@Override
	public boolean modify(ReviewVO review) {
		return mapper.update(review)==1;
	}

	@Override
	public boolean remove(Long reviewNo) {
		mapper.deleteComments(reviewNo);
		return mapper.delete(reviewNo)==1;
	}

	@Override
	public List<ReviewVO> getList(int cafeNo, Criteria cri) {
		return mapper.getBoardList(cafeNo, cri);
	}

	@Override
	public int getTotal(int cafeNo, Criteria cri) {
		return mapper.getTotalCount(cafeNo, cri);
	}

	@Override
	public boolean upvote(Long reviewNo) {
		return mapper.increaseUpvotes(reviewNo)==1;
	}

	@Override
	public boolean downvote(Long reviewNo) {
		return mapper.increaseDownvotes(reviewNo)==1;
	}

	@Override
	public boolean cancelUpvote(Long reviewNo) {
		return mapper.decreaseDownvotes(reviewNo)==1;
	}

	@Override
	public boolean canceldownvote(Long reviewNo) {
		return mapper.decreaseDownvotes(reviewNo)==1;
	}

}
