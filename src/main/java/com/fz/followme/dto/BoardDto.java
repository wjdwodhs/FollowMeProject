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
public class BoardDto {

	private String boardNo;
	private int subNo;
	private String boardTitle;
	private String boardContent;
	private String boardType;
	private Date enrollDate;
	private Date modifyDate;
	private int readCount;
	private String status;
	private String memNo;
	private int replyNo;
	private int fileNo;
	private int attachCount;
	
}
