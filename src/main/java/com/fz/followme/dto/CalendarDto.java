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
public class CalendarDto {

	
	private int calNo;
    private String memNo;
    private String calTitle;
    private String calContent;
    private Timestamp calDate;
    private Date startDate;
    private Date endDate;
    private String category;
    private String type;
}


