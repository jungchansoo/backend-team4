package org.studywithme.domain;

import lombok.Data;

@Data
public class StudyCafeVO {

	private String name;
	private String address;
	private String qr_code;
	private int room_count;
	private int seat_count;
	private int locker_count;
}
