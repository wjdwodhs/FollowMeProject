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
public class AttachmentDto {
	private int fileNo;
	private String filePath;
	private String originName;
	private String systemName;
	private String type;
	private int refNo;
	private Date uploadDate;
}
