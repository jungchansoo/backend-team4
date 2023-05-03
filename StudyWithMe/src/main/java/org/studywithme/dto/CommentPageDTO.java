package org.studywithme.dto;

import java.util.List;

import org.studywithme.domain.ReviewCommentVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class CommentPageDTO {
	private int commentCnt;
	private List<ReviewCommentVO> list;
}