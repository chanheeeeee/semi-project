package com.chat.controller;

import java.io.IOException;
import java.util.Set;

import javax.websocket.EncodeException;
import javax.websocket.EndpointConfig;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.chat.vo.Message;

//index.jsp에  적은 멥핑주소를 적었음
@ServerEndpoint(value="/chatting", encoders = {JsonEncoder.class}, decoders = {JsonDecoder.class})
//request.getContextPath()%>/chatting여기서 가져온것임! 서블렛 아니고 일반클래스 생성후@ServerEndpoint("/chatting")이걸로 생성해줘야함!
public class ChattingServer {
	
	//일반클래스 생성해줘야함
	@OnOpen
	public void open(Session session, EndpointConfig config) {
		System.out.println("클라이언트접속!!");
		//웹소켓을 생성하면 자동적으로 생성이된다!
	}
	
	/*
	 * @OnMessage public void messageManage(Session session, String data) { //
	 * System.out.println("메세지 수진!!"); // System.out.println(data); //
	 * System.out.println(session.getId()); // //session(보낸사람)은 브라우저에 대한 정보이다!
	 * 
	 * //전송된 메세지를 접속한 클라이언트에게 전송해주기 //session에서 제공하는 getBasicRemote()메소드를 이용해서 전송객체를
	 * 가져와 sendText("보내고싶은 데이터작성")메소드를 실행
	 * 
	 * //JSON을 자바 객체로 변환하기 - GSON이용!! //vo클래스에 만들어놓은 객체로 사용 Message msg = new
	 * Gson().fromJson(data,Message.class); System.out.println(msg);
	 * 
	 * 
	 * //session이 넘어오면 session에 대한 확인할 정보를 각 session객체에 저장함
	 * session.getUserProperties().put("msg",msg);//session안에 별도로 저장할수있는 공간을
	 * 제공(키,벨류)=>(data:벨류)에는 문자열로 온 데이터가 저장됨!
	 * 
	 * try { //getOpenSession() -> Set<Session>을 이용해서 손쉽게 관리가능 //접속한 session을 가져와야함
	 * //접속한 session을 모두 가져오는 메소드를 제공 Set<Session> clients =
	 * session.getOpenSessions(); if(!msg.getReceiver().equals("")) { //리시버가 있으면!
	 * 공란이 아니면! //귓속말 for(Session client : clients) { Message id =
	 * (Message)client.getUserProperties().get("msg");
	 * if(id.getSender().equals(msg.getReceiver())) {
	 * client.getBasicRemote().sendText(data); } } }else { //전체 for(Session client :
	 * clients) { //session.getBasicRemote().sendText(data);//전송하는 문구이기때문에
	 * try~catch필요! //보낸사람한테 전송객체를 가져와서 내자신에게 보내 라는 뜻! 그렇기 때문에 상대방에게 전달x
	 * client.getBasicRemote().sendText(data); } } } catch (IOException e) {
	 * e.printStackTrace(); } }
	 */
	@OnMessage
	public void messageObject(Session session, Message msg){
		//session사용자를 확인할 데이터를 저장
		session.getUserProperties().put("msg", msg);
		
		//전체 접속자 가져오기
		Set<Session> clients = session.getOpenSessions();
		//session.isOpen();열렸는지 닫혔는지 확인 가능 한 함수!연결된 session인지 확인
		try {
			if(msg.getReceiver().equals("")) {
				for(Session client : clients) {
					client.getBasicRemote().sendObject(msg);
				}
			}else {
				for(Session client : clients) {
					Message userMsg = (Message)client.getUserProperties().get("msg");
					//userMsg란?session이 갖고있는것!
					if(userMsg.getSender().equals(msg.getReceiver())
							||userMsg.getSender().equals(msg.getSender())) {
						client.getBasicRemote().sendObject(msg);
					}
				}
			}
		}catch(IOException|EncodeException e) {
				
		}
	}
}