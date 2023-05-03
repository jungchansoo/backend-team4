package org.studywithme.domain;

import lombok.Data;

@Data
public class ReviewVoteHistoryVO {
	private int reviewVoteNo;
	private int reviewNo;
	private String userId;
	private String action;
}
