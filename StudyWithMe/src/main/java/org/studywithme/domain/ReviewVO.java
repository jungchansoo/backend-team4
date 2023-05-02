package org.studywithme.domain;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewNo;
	private int cafeNo;
	private String title;
	private String createdDate;
	private String updatedDate;
	private String userId;
	private String content;
	private int upvotes;
	private int downvotes;
	private int replyCnt;
}
