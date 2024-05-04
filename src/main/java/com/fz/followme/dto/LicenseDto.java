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
public class LicenseDto {
	
	private int licNo;
	private int memNo;
	private String licName;
	private String licConfirmNo;
	private Date issuedDate;
	private String licAgency;

	private AttachmentDto attachment; // 단일 첨부파일 변수
	private String originName; // 첨부파일 originName
}
