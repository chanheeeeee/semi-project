package com.chat.controller;

import javax.websocket.EncodeException;
import javax.websocket.Encoder.Text;
import javax.websocket.EndpointConfig;

import com.google.gson.Gson;
import com.chat.vo.Message;

public class JsonEncoder implements Text<Message> {
	//alt+shift+s+v 인터페이스 생성
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(EndpointConfig arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String encode(Message arg0) throws EncodeException {
		// TODO Auto-generated method stub
		return new Gson().toJson(arg0);
	}
	
	
}
