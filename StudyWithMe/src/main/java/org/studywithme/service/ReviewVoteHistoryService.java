package org.studywithme.service;

import java.util.Map;

public interface ReviewVoteHistoryService {
	public Map<String, Boolean> getVoteStatus(String userId, Long reviewNo);
	public void insertVoteHistory(String userId, Long reviewNo, String action);
	public boolean removeVoteHistory(String userId, Long reviewNo, String action);

}
