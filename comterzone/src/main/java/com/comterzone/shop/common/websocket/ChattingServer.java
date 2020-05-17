package com.comterzone.shop.common.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

//웹소켓서버구성하기
//책임/역할 -> 접속한 사용자의 session관리 및 데이터전송
// 1. TextWebSocketHandler객체를 상속! 문자전용
// 2. BinaryWebSocketHandler객체 상속. 문자,데이터까지 처리
@Slf4j
public class ChattingServer extends TextWebSocketHandler{
	//세션관리용 객체 생성
	private Map<String,WebSocketSession> clients=new HashMap();
	
	@Autowired
	ObjectMapper mapper;
	//json객체를 자바객체로 자바객체를 json으로 변환해주는 jackson제공 객체
	
	//메세지 처리 메소드를 오버라이딩처리해서 사용
	
	@Override//page에서 new WebSocket(주소);가 실행되어 접속요청을 하면 실행되는 매소드
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		log.debug("사용자 접속!");

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//클라이언트들이 보내는 모든데이터가 오면 실행되는 매소드
		log.debug(message.getPayload());
		
		
		SocketMessage msg=getMessage(message.getPayload());
		
		session.getAttributes().put("data", msg);
		
		log.debug("메세지 변환 후 "+msg);
		switch(msg.getType()) {
			case "new" : addClient(msg,session);break; 
			case "msg" : sendMessage(msg,session);break;
		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		log.debug("클라언트 접속 끊김!");
		Set<Map.Entry<String, WebSocketSession>> entry=clients.entrySet();
		Iterator<Map.Entry<String, WebSocketSession>> it=entry.iterator();
		while(it.hasNext()) {
			Map.Entry<String, WebSocketSession> client=it.next();
			if(!client.getValue().isOpen()) {
				it.remove();
			}
		}
		
		
	}
	//클라언트 등록하기
	private void addClient(SocketMessage msg,WebSocketSession session) {
		clients.put(msg.getSender(), session);
		log.info("접속자 : "+clients);
		//현재접속자 전송
		SocketMessage serverMsg=new SocketMessage("curClient","ad","",sendConnectClient());
		sendMessage(serverMsg, session);
		//사용자에게 접속 축하메세지발송!
		//session.sendMessage(new TextMessage("채팅접속을 환영합니다!"));
		serverMsg=new SocketMessage("info","ad","","채팅접속을 환영합니다!");
		sendMessage(serverMsg, session);
	}
	
	//메세지변환용메소드
	private SocketMessage getMessage(String msg) {
		SocketMessage message=null;
		try {
			message=mapper.readValue(msg,SocketMessage.class);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return message;
	}
	private String getJsonMessage(SocketMessage msg) {
		String jsonMsg="";
		try {
			jsonMsg=mapper.writeValueAsString(msg);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return jsonMsg;
	}
	
	private void sendMessage(SocketMessage msg, WebSocketSession session) {
		//클라이언트가 보낸 데이터를 보내기
		//대상에 따라 분기해서 보내
		//if(msg.getReceiver().equals("all")) {
			Set<Map.Entry<String,WebSocketSession>> entry=clients.entrySet();
			for(Map.Entry<String, WebSocketSession> client : entry) {
				try {
					if(!msg.getReceiver().equals("")) {
						if(msg.getReceiver().equals(client.getKey()))
							client.getValue().sendMessage(new TextMessage(getJsonMessage(msg)));
					}else {
						client.getValue().sendMessage(new TextMessage(getJsonMessage(msg)));
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		//}
	}
	
	//접속자 정보 전송하기
	private String sendConnectClient() {
		String clientIds="";
		Set<Map.Entry<String, WebSocketSession>> entry=clients.entrySet();
		for(Map.Entry<String,WebSocketSession> c : entry) {
			clientIds+=c.getKey()+",";
		}
		return clientIds;
	}
	
	
}





