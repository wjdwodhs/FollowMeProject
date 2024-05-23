package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.MessageDto;

public interface MessageService {
	
	// 메세지 리스트 불러오기
	List<MessageDto> selectMsgList(MessageDto message);
	
	// 메세지 내용 불러오기
	List<MessageDto> selectMessages(MessageDto msg);
	
	// 신규 메세지 입력하기
	int insertMessage(MessageDto msg);
	
	// 신규 메세지 삽입 후 가장 최근에 삽입된 메세지 조회하기
	MessageDto selectLatestMessage(int msgRoNo);
	
	// 신규 채팅방 생성 및 메세지 입력하고 신규 메시지 번호 반환하기
	int createNewMessage(MessageDto newMessage);
	
	// 신규 메세지 삽입 후 가장 최근에 삽입된 메세지 조회하기 (MsgNo로)
	MessageDto selectLatestMessageByMsgNo(int msgNo);
}
