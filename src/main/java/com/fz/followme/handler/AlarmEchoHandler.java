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

		sessionList.add(session);
		
	}
	
	/**
	 * 3) afterConnectionClosed : 클라이언트와 연결이 끊겼을 때 처리할 내용을 정의
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		sessionList.remove(session);

	}
	
	public List<WebSocketSession> getSessionList(){
		
		return sessionList;
	}
	
	// 알람용 핸들러에서 websockerSessionLIst를 반환하는 get~~~ 메소드 작성해두기 => 그래야 어떠한 컨트롤러든 웹소켓에 연결된 사원들에 접근할 수 있음
		// 전자결재 등록시 (전자결재 controller) => get~~~ 메소드 호출해서 sessionLIst받아와서 각 기능안에서 성공시 for문돌려서 target에게 메세지 발송
		// 예약시 (예약관련 controller)
		// .... 
	// 알람용	클래스 컨트롤러 만들어놓기. 알람리스트 조회, 알람읽음처리용 메소드, 알람삭제용 메소드 
		   
	
	
}
