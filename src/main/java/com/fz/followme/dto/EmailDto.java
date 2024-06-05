package com.fz.followme.dto;

import java.util.Date;
import java.util.List;

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
	private String emailTo;
	private String emailFrom;
	private String subject;
	private String cc;
	private String text;
	private String registDate;
	private String emailStatus;
	private String forder;
	private int isImportant;
	private int isRead;
	
	// 직원 조회용
	private String memNo;
	private String deptName;
	private String memName;
	private String memEmail;
	private String status;

	private List<AttachmentDto> attachList;
	
	// 메일선택 번호
	private int[] checkMail;
}
