package org.studywithme.type;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public enum StudyLockerTicket {
	THREE_DAY("3일권", 24 * 3 * 60),
	ONE_WEEK("1주권", 24 * 7 * 60),
	FOUR_WEEK("4주권", 24 * 7 * 4 * 60),
	TWELVE_WEEK("12주권", 24 * 7 * 12 * 60),
	SEVENTYTWO_WEEK("72주권", 24 * 7 * 72 * 60);
	
	private final String name;
	private final int time;
	
	public static StudyLockerTicket of(String ticketName) {
		for(StudyLockerTicket ticket : values()) {
			if (ticket.name.equals(ticketName)) {
				return ticket;
			}
		}
		
		return null;
	}
}
