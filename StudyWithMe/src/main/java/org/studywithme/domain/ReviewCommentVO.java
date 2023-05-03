package org.studywithme.domain;

import lombok.Data;

@Data
public class ReviewCommentVO {
	private long commentNo;
	private long reviewNo;
	private String createdDate;
	private String updatedDate;
	private String userId;
	private String content;
}
