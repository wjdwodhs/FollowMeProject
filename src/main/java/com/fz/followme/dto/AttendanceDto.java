package com.fz.followme.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class AttendanceDto {

	 private String memNo;
	 private Timestamp startTime;
	 private Timestamp endTime;
	 private int workTime;
	 private String type;
	 private Date attDate;
	 private String attContent;
	
}
