package org.studywithme.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.ReviewCommentVO;

public interface ReviewVoteHistoryMapper {
	public int insert(ReviewCommentVO vo);
	public ReviewCommentVO chkUpvote(Long rno);
	public ReviewCommentVO chkDownvote(Long rno);
}
