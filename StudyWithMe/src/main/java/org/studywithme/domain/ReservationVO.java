package org.studywithme.domain;

import lombok.Data;

@Data
public class ReservationVO {
	
	private Long reservationNo;
	private StudyCafeVO cafeName;
	private String reserveDate;
	private String category;
	private int usingNum;
	private Long duration;

}


