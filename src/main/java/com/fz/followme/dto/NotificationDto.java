package com.fz.followme.dto;

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
public class NotificationDto {

	private int notiNo;
	private String notiType;
	private String memNo;
	private String notiMsg;
	private String createDate;
	private int isRead; 

	
}
