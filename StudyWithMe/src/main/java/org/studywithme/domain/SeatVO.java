package org.studywithme.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SeatVO {
	private int num_using;
	private String user_id;
	private Date start_time;
}
