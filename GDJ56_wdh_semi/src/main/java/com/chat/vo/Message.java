package com.chat.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Message {
	//JSON이랑 연동하는 클래스는 필드명과 JSON방식의 문자열의 key값이 일치해야한다!!
	private String sender;
	private String receiver;
	private String msg;
}
