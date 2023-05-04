package org.studywithme.service;

import java.util.List;

import org.studywithme.domain.Criteria;
import org.studywithme.domain.ReviewCommentVO;
import org.studywithme.dto.CommentPageDTO;


public interface ReviewCommentService {

	public int register(ReviewCommentVO vo, Long reviewNo);

	public ReviewCommentVO get(Long commentNo);

	public int modify(ReviewCommentVO vo);

	public int remove(Long commentNo, Long reviewNo);

	public List<ReviewCommentVO> getList(Criteria cri, Long reviewNo);
	
	public CommentPageDTO getListPage(Criteria cri, Long reviewNo);
}
