package org.studywithme.domain;

import lombok.Data;

@Data
public class TicketVO {
	private int ticketNo;
	private String category;
	private String ticketName;
	private long price;
	private long chargingTime;
	private String startTime;
	private String endTime;
	private int isSale;
}
