package org.studywithme.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.ReviewCommentVO;

public interface ReviewCommentMapper {
	public int insert(ReviewCommentVO vo);
	public ReviewCommentVO read(Long commentNo);
	public int delete(Long commentNo);
	public int update(ReviewCommentVO content);
	public List<ReviewCommentVO> getListWithPaging(@Param("cri") Criteria cri, @Param("reviewNo") Long reviewNo);	
	public int getCountByReviewNo(Long reviewNo);
}