package org.studywithme.mapper;

import java.util.List;

import org.studywithme.domain.ReviewVoteHistoryVO;

public interface ReviewVoteHistoryMapper {
    List<ReviewVoteHistoryVO> getVoteHistory(String userId, Long reviewNo);
	public void insertVoteHistory(String userId, Long reviewNo, String action);
	public int deleteVoteHistory(String userId, Long reviewNo, String action);
}
