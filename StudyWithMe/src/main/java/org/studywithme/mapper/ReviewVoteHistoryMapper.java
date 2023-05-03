package org.studywithme.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.studywithme.domain.ReviewVoteHistoryVO;

public interface ReviewVoteHistoryMapper {
    List<ReviewVoteHistoryVO> getVoteHistory(@Param("userId") String userId, @Param("reviewNo") Long reviewNo);
	public void insertVoteHistory(@Param("userId")String userId, @Param("reviewNo") Long reviewNo, @Param("action") String action);
	public int deleteVoteHistory(@Param("userId")String userId, @Param("reviewNo") Long reviewNo, @Param("action") String action);
}
