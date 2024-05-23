package com.fz.followme.handler;



import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AlarmEchoHandler extends TextWebSocketHandler {

	// sessionList : 현재 웹소켓과 연결된 클라이언트들을 저장해놓는 리스트
	private List<WebSocketSession> sessionList = new ArrayList<>();
	
	/**
	 * 1) afterConnectionEstablished : 클라이언트와 연결되었을 때 처리할 내용을 정의
	 * 
	 * @param session - 현재 웹소켓과 연결된 클라이언트 정보를 가지고 있는 객체
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	
		log.debug("========== websocket 연결됨 ==========");
		log.debug("WebSocketSession객체 : {}", session);
		log.debug("session Id: {}", session.getId());
		log.debug("session Attributes: {}", session.getAttributes());
		log.debug("로그인 세션 객체 : {}", session.getAttributes().get("loginUser"));
	
		sessionList.add(session);
		
	}
	
	/**
	 * 2) handleMessage : 데이터(텍스트, 파일 등)가 웹소켓으로 전송되었을 때 처리할 내용을 정의
	 * 
	 * @param message - 현재 웹소켓으로 전달된 데이터에 대한 정보를 가지고 있는 객체
	 */
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		log.debug("========== 메세지 들어옴 ==========");
		log.debug("현재 웹소켓으로 알림을 전달받는 세션 객체 : {}", session.getAttributes().get("loginUser"));
		log.debug("현재 웹소켓으로 전달된 메세지의 내용: {}", message.getPayload());
		
		// 현재 해당 웹소켓에 연결되어있는 모든 클라이언트들에게 현재 들어온 메세지를 재발송함 (작성자본인포함)
		for(WebSocketSession client : sessionList) {
			// 전달하고자 하는 메세지의 형식 : 메세지유형(chat/entry/exit)|메세지내용|발신자아이디|...+프로필이미지?정도
			String msg = (String) message.getPayload();
			client.sendMessage(new TextMessage(msg)); // * 채팅방jsp의 onMesaage function실행됨
		}
		
	}
	
	/**
	 * 3) afterConnectionClosed : 클라이언트와 연결이 끊겼을 때 처리할 내용을 정의
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	
		log.debug("========== websocket 연결끊김 ==========");
		log.debug("WebSocketSession객체: {}", session);
		log.debug("session Id: {}", session.getId());
		log.debug("로그아웃 세션 객체 : {}", session.getAttributes().get("loginUser"));
		
		sessionList.remove(session);

	}
	
	
	
	
}
