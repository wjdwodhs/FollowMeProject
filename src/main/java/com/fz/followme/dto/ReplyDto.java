package com.fz.followme.dto;

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
public class ReplyDto {

	private int replyNo;
	private String memNo;
	private String refType;
	private int refBno;
	private String replyContent;
	private String enrollDate;
	private String status;
	
	private String memName;
	private String profileImgPath;
}
