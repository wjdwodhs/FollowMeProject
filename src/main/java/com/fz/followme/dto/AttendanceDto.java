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
	 private String startTime;
	 private String endTime;
	 private int workTime;
	 private String type;
	 private Date attDate;
	 private String attContent;
	 private int count;
	 private String targetMonth;
     private int workingDays;
     private int monthWorkTime;
     private double avgWorkTime;
     private int totalWorkTime;
     private int totalworkingDays;
	
}
