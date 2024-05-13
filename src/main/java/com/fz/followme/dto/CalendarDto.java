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
    private String title;
    private String content;
    private Timestamp calDate;
    private Date start;
    private Date end;
    private String category;
    private String type;
}


