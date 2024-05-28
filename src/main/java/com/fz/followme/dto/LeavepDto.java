package com.fz.followme.dto;

import java.sql.Date;

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
public class LeavepDto {

	 private int leavepNo;
	 private String memNo;
	 private Date leavepDate;
	 private int ableDate;
	 private int pay;
	 private int used;
	 private int left;
	 private String startDate;
	 private String endDate;
		
	
}
