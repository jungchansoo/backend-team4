package org.studywithme.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RoomVO {
	private String user_id;
	private int num_using;
	private String start_time;
	private String end_time;
}
