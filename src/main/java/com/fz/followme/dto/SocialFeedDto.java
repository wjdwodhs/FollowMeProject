package com.fz.followme.dto;

import java.sql.Date;
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
public class SocialFeedDto {

	private int sfNo;
	private String memNo;
	private String sfContent;
	private int sfLikes;
	private String enrollDate;
	private String modifyDate;
	private String status;
	
	private List<AttachmentDto> attachList;
	
	private String profileImgPath;
	private String memName;
}
