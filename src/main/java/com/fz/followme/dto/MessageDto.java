package com.fz.followme.dto;

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
public class MessageDto {
	
	private int msgNo;
	private int msgRoNo;
	private String msgFrom;
	private String msgTo;
	private String msgContent;
	private Timestamp sendDate;
	private Timestamp readDate;
	private String readCheck;
	
	private String msgFromName;
	private String msgToName;
	
	// 가장 최근에 생성된 Msg_RoNo
	private int latestMsgRoNo;
	
	
	// 현재 사용자의 메세지 상대 memNo
	private String otherMem;
	
	// 현재 사용자의 메세지 상대 profile 이미지
	private String profileImgPath;
	
	// 현재 사용자 memNo
	private String thisMem;
	
	// 안읽은 메세지 갯수 
	private int unread;

}
