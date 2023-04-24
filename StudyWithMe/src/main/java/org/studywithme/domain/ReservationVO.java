package org.studywithme.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReservationVO {
    private int reservation_no;
    private int cafe_no;
    private String name;
    private Date start_time;
    private String category;
    private int num_using;
	private Long duration;
}





