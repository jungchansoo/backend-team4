package org.studywithme.domain;

import lombok.Data;

@Data
public class AddTicketVO {
	private int ticketNo;
	private String category;
	private String ticketName;
	private long price;
	private long inputChargingTime;
	private long chargingTime;
	private String timeType;
	private String startTime;
	private String endTime;
}
