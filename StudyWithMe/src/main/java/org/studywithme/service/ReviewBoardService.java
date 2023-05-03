package org.studywithme.service;

import java.util.List;

import org.studywithme.domain.Criteria;
import org.studywithme.domain.ReviewVO;

public interface ReviewBoardService {
	public void register(int cafeNo, ReviewVO review);
	public ReviewVO get(Long reviewNo);
	public boolean modify(ReviewVO review);
	public boolean remove(Long reviewNo);

	public List<ReviewVO> getList(int cafeNo, Criteria cri);
	public int getTotal(int cafeNo, Criteria cri);
	
	public boolean upvote(Long reviewNo);
	public boolean downvote(Long reviewNo);
	public boolean cancelUpvote(Long reviewNo);
	public boolean canceldownvote(Long reviewNo);
}
