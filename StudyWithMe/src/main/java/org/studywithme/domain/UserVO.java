package org.studywithme.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {

	private String userId;
	private String password;
	private String userName;
	private String phoneNumber;
	private String email;
	private String role;
	private Date joinDate;
	private long remainingSeatTime;
	private long remainingStudyRoomTime;
	private long remainingLockerTime;
	private boolean phoneVerified;
	private boolean emailVerified;
}
