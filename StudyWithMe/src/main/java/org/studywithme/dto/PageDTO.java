package org.studywithme.dto;

import org.studywithme.domain.Criteria;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

	private int startPage; // 시작페이지
	private int endPage; // 끝페이지
	private boolean prev, next; // 이전, 다음페이지

	private int total; // 전체 데이터 수
	private Criteria cri; // 페이징

	public PageDTO(Criteria cri, int total) {

		this.cri = cri;
		this.total = total;

		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;

		this.startPage = this.endPage - 9;

		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}

		this.prev = this.startPage > 1;

		this.next = this.endPage < realEnd;
	}
}
