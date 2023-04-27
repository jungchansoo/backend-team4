package org.studywithme.dto;

import org.studywithme.domain.ReservationCriteria;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ReservationPageDTO {

	private int startPage; // 시작페이지
	private int endPage; // 끝페이지
	private boolean prev, next; // 이전, 다음페이지

	private int total; // 전체 데이터 수
	private ReservationCriteria recri; // 페이징
	private int pageSize; // 페이지당 데이터 수
	private int page; // 현재 페이지 번호
	private int realEnd;

	public ReservationPageDTO(ReservationCriteria recri, int total) {

		this.recri = recri;
		this.total = total;
		this.pageSize = recri.getAmount();
		this.page = recri.getPageNum();

		this.endPage = (int) (Math.ceil(page / 10.0)) * 10;
		this.startPage = this.endPage - 9;

		this.realEnd = (int) (Math.ceil(total * 1.0 / pageSize));

		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;

		this.next = this.endPage < realEnd;

	}

	public int getRealIndex(int index) {
		return this.total - (this.pageSize * (this.page - 1)) - index;
	}
}
