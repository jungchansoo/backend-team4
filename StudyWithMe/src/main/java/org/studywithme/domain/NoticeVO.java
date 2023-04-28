package org.studywithme.domain;

import lombok.Data;

@Data
public class NoticeVO {

	private int noticeNo;
	private String title;
	private String createdDate;
	private String updatedDate;
	private String userId;
	private String content;
}
