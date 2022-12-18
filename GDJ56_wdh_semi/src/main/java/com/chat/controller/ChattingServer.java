package com.chat.controller;

import java.io.IOException;
import java.util.Set;

import javax.websocket.EncodeException;
import javax.websocket.EndpointConfig;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
import com.chat.vo.Message;

//index.jsp에  적은 멥핑주소를 적었음
@ServerEndpoint(value="/chatting",
	encoders = {JsonEncoder.class},	//자동으로 등록하게 해준다
	decoders = {JsonDecoder.class}

		)
public class ChattingServer {
//	private List<Session> client=new ArrayList();원래 웹소켓을 사용하지 않으면 리스트로 뽑아와야한다
	
	@OnOpen
	public void open(Session session, EndpointConfig config) {
		System.out.println("클라이언트 접속");
//		client.add(session);
	}
	
	@OnMessage
	public void messageObject(Session session,Message msg) {
		//session  사용자를 확인랑 데이터를 저장
		session.getUserProperties().put("uesrId", msg.getSender());
		
		//전체 접속자 가져오기
		Set<Session> clients=session.getOpenSessions();
		//session.isOpen(); 연결된 session인지 확인
		try {
			if(msg.getReceiver().equals("")) {
				for(Session client:clients) {
					client.getBasicRemote().sendObject(msg);
				}
			}else {
				for(Session client:clients) {
					Message userMsg=(Message)client.getUserProperties().get("msg");
					if(userMsg.getSender().equals(msg.getReceiver())
							||userMsg.getSender().equals(msg.getSender())) {
						client.getBasicRemote().sendObject(msg);
					}
				}
			}
		}catch(IOException|EncodeException e) {
			
		}
	}
	
	
	
//	@OnMessage
//	public void messageManage(Session session,String data) {
////		System.out.println("메세지 수신");
////		System.out.println(data);
////		System.out.println(session.getId());//아이디값은 중복되지않게 웹소켓이 만들어주었다
//		
//		//session에 대한 확인할 정보를 각 session객체에 저장함
//		//JSON을 자바 객체로 변환하기 - GSON이용!!
//		Message msg=new Gson().fromJson(data,Message.class);
//		System.out.println(msg);
//		session.getUserProperties().put("msg", msg);
//
//		//전송된 메세지를 접속한 클라이언트에세 전송해주기
//		//Session객체가 제공하는 getBasicRemote()메소드를 이용해서 
//		//			전송객체를 가져와 sendText("데이터")메소드를 실행
//		try {
//			//접속한 session 을 모두 가져오는 메소드 제공
//			//getOpenSession() -> set<Session>
//			Set<Session> clients=session.getOpenSessions(); //접속한 세션의 정보를 가져옴
//			
//			if(!msg.getReceiver().equals("")) {
//				//귓속말
//				for(Session client : clients) {
//					Message id=(Message)client.getUserProperties().get("msg");
//					if(id.getSender().equals(msg.getReceiver())) {
//						client.getBasicRemote().sendText(data);
//					}
//				}
//			}else {
//				//전체
//				for(Session client : clients) {
//					client.getBasicRemote().sendText(data);
//				}
//			}
//		}catch(IOException e) {
//			e.printStackTrace();
//		}
//	
//	
//	
//	}
	
}
