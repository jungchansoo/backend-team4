package org.studywithme.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.ReviewCommentVO;

public interface ReviewCommentMapper {
	public int insert(ReviewCommentVO vo);
	public ReviewCommentVO read(Long rno);
	public int delete(Long rno);
	public int update(ReviewCommentVO reply);
	public List<ReviewCommentVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);	
	public int getCountByBno(Long bno);
	
}