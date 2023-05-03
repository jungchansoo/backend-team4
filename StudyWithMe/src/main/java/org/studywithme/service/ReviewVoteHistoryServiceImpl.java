package org.studywithme.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.studywithme.domain.ReviewVoteHistoryVO;
import org.studywithme.mapper.ReviewVoteHistoryMapper;

import lombok.Setter;


@Service
public class ReviewVoteHistoryServiceImpl implements ReviewVoteHistoryService{
	

	@Setter(onMethod_ = @Autowired)
	private ReviewVoteHistoryMapper mapper;
	
	@Override
	public Map<String, Boolean> getVoteStatus(String userId, Long reviewNo){
        List<ReviewVoteHistoryVO> voteHistory = mapper.getVoteHistory(userId, reviewNo);
        
        boolean upvoted = false;
        boolean downvoted = false;

        for (ReviewVoteHistoryVO history : voteHistory) {
            if ("upvote".equals(history.getAction())) {
                upvoted = true;
            } else if ("downvote".equals(history.getAction())) {
                downvoted = true;
            }
        }

        Map<String, Boolean> voteStatus = new HashMap<>();
        voteStatus.put("upvoted", upvoted);
        voteStatus.put("downvoted", downvoted);

        return voteStatus;
	}


	@Override
	public void insertVoteHistory(String userId, Long reviewNo, String action) {
		mapper.insertVoteHistory(userId, reviewNo, action);
	}


	@Override
	public boolean removeVoteHistory(String userId, Long reviewNo, String action) {
		return mapper.deleteVoteHistory(userId, reviewNo, action)==1;
	};
}
