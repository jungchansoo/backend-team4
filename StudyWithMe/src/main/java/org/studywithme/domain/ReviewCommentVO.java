package org.studywithme.domain;

import lombok.Data;

@Data
public class ReviewCommentVO {
	private int comment_No;
	private int review_No;
	private String created_Date;
	private String updated_Date;
	private String user_Id;
	private String content;
}
