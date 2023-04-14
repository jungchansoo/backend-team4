package org.studywithme.dto;


import java.sql.Timestamp;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@Service
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class SmsResponseDTO {
    private String statusCode;
    private String statusName;
    private String requestId;
    private Timestamp requestTime;
}
