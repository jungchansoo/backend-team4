package org.studywithme.type;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public enum StudySeatTicket {
	ONE_HOUR("1시간권", 1 * 60),
	THREE_HOUR("3시간권", 3 * 60),
	SIX_HOUR("6시간권", 6 * 60),
	ONE_DAY("1일권(24시간)", 24 * 60),
	THREE_DAY("3일권(72시간)", 72 * 60);
	
	private final String name;
	private final int time;
	
	public static StudySeatTicket of(String ticketName) {
		for(StudySeatTicket ticket : values()) {
			if (ticket.name.equals(ticketName)) {
				return ticket;
			}
		}
		
		return null;
	}
}
