package org.studywithme.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TicketVO {

	private int ticketNo;
	private String category;
	private String ticketName;
	private long price;
	private long chargingTime;
	private Date startTime;
	private Date endTime;
	
}
