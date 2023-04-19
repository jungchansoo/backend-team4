package org.studywithme.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

// 페이징기법, sql문의 rownum을 사용사여 실행결과에 번호를 주어준다. 검색 기준 클래스
public class Criteria {

	private int pageNum; // 페이지 번호
	private int amount; // 한 페이지에 몇개의 데이터를 보여줄 것

	private String type; // 검색조건
	private String keyword; // 검색어

	// 생성자 => 필드의 초기값 지정
	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) { // 외부에서 별도 지정
		// 필드 = 매개변수
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {
		// 삼항연산자 type == (조건식) ? 참 : 거짓
		return type == null ? new String[] {} : type.split("");
	}

}
