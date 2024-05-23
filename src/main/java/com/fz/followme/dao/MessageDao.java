package com.fz.followme.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.dto.MessageDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class MessageDao {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	// 메세지 리스트 불러오기
	public List<MessageDto> selectMsgList(MessageDto message) {
		
		String thisMem = message.getThisMem();
		
		List<MessageDto> msgList = sqlSessionTemplate.selectList("messageMapper.selectMsgList", message);
		
		for (MessageDto mto : msgList) {
			mto.setThisMem(thisMem);
			// 현재 사용자가 해당 room에서 안읽은 메세지의 갯수를 가져온다.
			int unread = sqlSessionTemplate.selectOne("messageMapper.countUnread", mto);
			// 현재 사용자가 메세지를 주고받는 상대 profile을 가져온다.
			String profileImgPath = sqlSessionTemplate.selectOne("messageMapper.selectOtherProfileImg",mto);
			// 안읽은 메세지 갯수를 mto에 set한다.
			mto.setUnread(unread);
			// 메세지 상대의 프로필사진을 mto에 set한다.
			mto.setProfileImgPath(profileImgPath);
			
		}

		return msgList;
	}
	
	// room 별 메세지 내용 가져오기
	public List<MessageDto> selectMessages(MessageDto msg) {
		
		List<MessageDto> messages = sqlSessionTemplate.selectList("messageMapper.selectMessages", msg);

		// 해당 방의 메세지들 중 받는 사람이 현재 사용자인 메세지를 모두 읽음 처리한다
		sqlSessionTemplate.update("messageMapper.updateMessageReadCheck", msg);

		return messages;
	}
	
	// room별 메세지 보내기
	public int insertMessage(MessageDto msg) {
		return sqlSessionTemplate.insert("messageMapper.insertMessage", msg);
	}
	
	// 신규 메세지 입력 후 가장 최근에 삽입된 메세지 조회하기 (기존 방 번호로)
	public MessageDto selectLatestMessage(int msgRoNo) {
		return sqlSessionTemplate.selectOne("messageMapper.selectLatestMessage", msgRoNo);
	}
	
	// 신규 채팅방 생성 및 메세지 보내기 (신규 생성 대화방 번호 반환)
	public int createNewMessage(MessageDto newMessage) {
        sqlSessionTemplate.insert("messageMapper.createNewMessage", newMessage);
        return newMessage.getMsgRoNo();
	}
	
	// 신규 메세지 입력 후 가장 최근에 삽입된 메세지 조회하기 (신규 메세지 번호로)
	public MessageDto selectLatestMessageByMsgNo(int msgNo) {
		return sqlSessionTemplate.selectOne("messageMapper.selectLatestMessageByMsgNo", msgNo);
	}
}
