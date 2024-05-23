package com.fz.followme.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.MessageDao;
import com.fz.followme.dto.MessageDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MessageServiceImpl implements MessageService {
	
	private final MessageDao messageDao;
	
	@Override
	public List<MessageDto> selectMsgList(MessageDto message) {
		return messageDao.selectMsgList(message);
	}

	@Override
	public List<MessageDto> selectMessages(MessageDto msg) {
		return messageDao.selectMessages(msg);
	}

	@Override
	public int insertMessage(MessageDto msg) {
		return messageDao.insertMessage(msg);
	}

	@Override
	public MessageDto selectLatestMessage(int msgRoNo) {
		return messageDao.selectLatestMessage(msgRoNo);
	}

	@Override
	public int createNewMessage(MessageDto newMessage) {
		return messageDao.createNewMessage(newMessage);
	}

	@Override
	public MessageDto selectLatestMessageByMsgNo(int msgNo) {
		return messageDao.selectLatestMessage(msgNo);
	}
	
	

}
