package org.studywithme.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.studywithme.domain.Criteria;
import org.studywithme.domain.ReviewVO;

public interface ReviewBoardMapper {
	public List<ReviewVO> getBoardList(@Param("cafeNo") int cafeNo, @Param("criteria") Criteria criteria);
	public int getTotalCount(@Param("cafeNo") int cafeNo, @Param("criteria") Criteria criteria);
	public void insert(@Param("cafeNo") int cafeNo, @Param("review") ReviewVO board);
	public ReviewVO read(Long ReviewNo);
	public int update(ReviewVO board);
	public int delete(Long ReviewNo);
	public int deleteComments(Long ReviewNo);
    public int increaseUpvotes(Long reviewNo);
    public int increaseDownvotes(Long reviewNo);
    public int decreaseUpvotes(Long reviewNo);
    public int decreaseDownvotes(Long reviewNo);
}