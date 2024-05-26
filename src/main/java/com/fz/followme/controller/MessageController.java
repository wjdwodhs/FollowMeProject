package com.fz.followme.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;

import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.MessageDto;
import com.fz.followme.handler.AlarmEchoHandler;
import com.fz.followme.service.MemberService;
import com.fz.followme.service.MessageService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/message")
@Controller
public class MessageController {
	
	private final MessageService messageService;
	private final MemberService memberService;
	
	private final AlarmEchoHandler handler;
	
	
	@RequestMapping("/messagePage")
	public String messagePage() {
		return "message/messageList";
	}
	
	@ResponseBody
	@GetMapping(value="/getMsgList", produces="application/json; charset=utf-8" )
	public Map<String, Object> ajaxGetMsgList(HttpServletRequest request, Model model) {
		
		MemberDto loginUser = (MemberDto)request.getSession().getAttribute("loginUser");
		String memNo = loginUser.getMemNo();
		String memName = loginUser.getMemName();
		
		MessageDto message = new MessageDto();
		message.setThisMem(memNo);
		
		// 메세지 리스트 불러오기
		List<MessageDto> msgList = messageService.selectMsgList(message);

		log.debug("msgList : {}", msgList);
		
		Map<String, Object> response = new HashMap<>();
		response.put("memName", memName);
		response.put("memNo", memNo);
		response.put("msgList", msgList);
		
		return response;
	}
	
	
	/*
	@GetMapping("/getMsgList")
	public String getMsgList(HttpServletRequest request, Model model) {
		
		MemberDto loginUser = (MemberDto)request.getSession().getAttribute("loginUser");
		String memNo = loginUser.getMemNo();
		String memName = loginUser.getMemName();
		
		MessageDto message = new MessageDto();
		message.setThisMem(memNo);
		
		// 메세지 리스트 불러오기
		List<MessageDto> msgList = messageService.selectMsgList(message);

		log.debug("msgList : {}", msgList);
		
		model.addAttribute("msgList", msgList);
		model.addAttribute("memNo", memNo);
		model.addAttribute("memName", memName);
		

		return "message/messageList";
	}
	*/
	
	
	
	@ResponseBody
	@GetMapping(value="/getMsgListAgain", produces="application/json; charset=utf-8" )
	public Map<String, Object> ajaxGetMsgListAgain(HttpServletRequest request, Model model) {
		
		MemberDto loginUser = (MemberDto)request.getSession().getAttribute("loginUser");
		String memNo = loginUser.getMemNo();
		String memName = loginUser.getMemName();
		
		MessageDto message = new MessageDto();
		message.setThisMem(memNo);
		
		// 메세지 리스트 불러오기
		List<MessageDto> msgList = messageService.selectMsgList(message);

		log.debug("msgList : {}", msgList);
		
		Map<String, Object> response = new HashMap<>();
		response.put("memName", memName);
		response.put("memNo", memNo);
		response.put("msgList", msgList);
		
		return response;
	}
	
	
	@GetMapping("/getMessage")
	@ResponseBody
	public List<MessageDto> getMessage(int roomId, HttpServletRequest request) {
		
		MemberDto loginUser = (MemberDto)request.getSession().getAttribute("loginUser");
		String memNo = loginUser.getMemNo();
		
		MessageDto msg = new MessageDto();
		msg.setMsgRoNo(roomId);
		msg.setThisMem(memNo);
		
		List<MessageDto> messages = messageService.selectMessages(msg);
		
		log.debug("messages:{}", messages);
		
		return messages;
		
		
	}
	
	
	@PostMapping(value="/sendMessage", produces="application/json; charset=utf-8")
	@ResponseBody
	public MessageDto sendMessage(MessageDto msg, HttpServletRequest request, HttpSession session) throws Exception {
	    MemberDto loginUser = (MemberDto) request.getSession().getAttribute("loginUser");
	    String memNo = loginUser.getMemNo();
	    
	    MessageDto newMessage = new MessageDto();
	    newMessage.setMsgRoNo(msg.getMsgRoNo());
	    newMessage.setMsgFrom(memNo);
	    newMessage.setMsgTo(msg.getMsgTo());
	    newMessage.setMsgContent(msg.getMsgContent());
	    newMessage.setProfileImgPath(loginUser.getProfileImgPath());

	    int result = messageService.insertMessage(newMessage);
	    if (result > 0) {
            int msgRoNo = newMessage.getMsgRoNo();
            
            // 삽입된 메시지를 조회하는 대신 가장 최근에 삽입된 메시지를 조회 (해당 대화방 번호를 넘겨서)
            MessageDto latestMessage = messageService.selectLatestMessage(msgRoNo);
            
            //알림
            TextMessage message = new TextMessage("성공");    
            handler.broadcastMessageToUser(newMessage.getMsgTo(), message);
            
            
            return latestMessage;
        } else {
            return null;
        }
	}

	
	
	@GetMapping("/getMemberList")
	@ResponseBody
	public List<MemberDto> getMemberList(MessageDto msg) {
		
		List<MemberDto> memberList = memberService.selectMemberList();
		log.debug("memberList:{}", memberList);
		return memberList;
	}
	
	@RequestMapping("/empListPopUp")
	public String empListPopUp() {
		return "message/empListPopUp";
	}
	
	@PostMapping(value="/createNewMessage", produces="application/json; charset=utf-8")
	@ResponseBody
	public MessageDto createNewMessage(MessageDto newMessage, HttpSession session) throws Exception {
		
		// 신규 메시지를 삽입하고 생성된 msgRoNo 값을 얻어옴
	    int newMsgRoNo = messageService.createNewMessage(newMessage);
	    
	    // 삽입된 메시지를 조회하여 반환
	    MessageDto insertedMessage = messageService.selectLatestMessage(newMsgRoNo);
	    
	    if (insertedMessage != null) {
            TextMessage message = new TextMessage("성공");
            handler.broadcastMessageToUser(insertedMessage.getMsgTo(), message);
	    	
	        return insertedMessage;
	    } else {
	        
	        return null; 
	    }
	}

	@PostMapping(value="/newRoomSecondMessage", produces="application/json; charset=utf-8")
	@ResponseBody
	public MessageDto newRoomSecondMessage(MessageDto msg, HttpServletRequest request) {
	    MemberDto loginUser = (MemberDto) request.getSession().getAttribute("loginUser");
	    String memNo = loginUser.getMemNo();
	    
	    MessageDto newMessage = new MessageDto();
	    newMessage.setMsgRoNo(msg.getMsgRoNo());
	    newMessage.setMsgFrom(memNo);
	    newMessage.setMsgTo(msg.getMsgTo());
	    newMessage.setMsgContent(msg.getMsgContent());
	    newMessage.setProfileImgPath(loginUser.getProfileImgPath());

	    int result = messageService.insertMessage(newMessage);

	    if (result > 0) {
            int msgRoNo = newMessage.getMsgRoNo();
            
            // 삽입된 메시지를 조회하는 대신 가장 최근에 삽입된 메시지를 조회 (해당 대화방 번호를 넘겨서)
            MessageDto latestMessage = messageService.selectLatestMessage(msgRoNo);
            
            
            return latestMessage;
        } else {
            return null;
        }
	}

	
}

