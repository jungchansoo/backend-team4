package org.studywithme.service;

import java.util.List;

import org.studywithme.domain.Criteria;
import org.studywithme.domain.ReviewCommentVO;
import org.studywithme.dto.CommentPageDTO;


public interface ReviewCommentService {

	public int register(ReviewCommentVO vo);

	public ReviewCommentVO get(Long rno);

	public int modify(ReviewCommentVO vo);

	public int remove(Long rno);

	public List<ReviewCommentVO> getList(Criteria cri, Long bno);
	
	public CommentPageDTO getListPage(Criteria cri, Long bno);
}
