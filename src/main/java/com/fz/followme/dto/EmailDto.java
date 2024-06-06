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
public class EmailDto {
	
	private int emailNo;
	private String toEmail;
	private String fromEmail;
	private String subject;
	private String cc;
	private String text;
	private Date regist_date;
	private String status;
	private String forder;
	private int isImportant;
	private int isRead;

}
