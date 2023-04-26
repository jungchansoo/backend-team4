package org.studywithme.domain;



import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservationCriteria {
	private int pageNum; // 페이지 번호
	private int amount; // 한 페이지에 몇 개의 데이터를 보여줄 것

	private String searchType; // 검색 조건
	private String keyword; // 검색어

	private String userId; // 예약자 아이디


    // 생성자 => 필드의 초기값 지정
    public ReservationCriteria() {
        this(1, 10); // userId 필드를 null로 초기화
    }

    public ReservationCriteria(int pageNum, int amount) { // 외부에서 별도 지정
        // 필드 = 매개변수
        this.pageNum = pageNum;
        this.amount = amount;
    }

	public String[] getSearchTypeArr() {
		// 삼항연산자 searchType == (조건식) ? 참 : 거짓
		return searchType == null ? new String[] {} : searchType.split("");
	}
//	// searchTypeArr 프로퍼티에 대한 getter 메소드 추가
//    public String[] getTypeArr() {
//        return this.getSearchTypeArr();
//    }

}

