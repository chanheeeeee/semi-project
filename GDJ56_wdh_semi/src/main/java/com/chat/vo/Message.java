package com.chat.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Message {
	//JSON이랑 연동하는 클래스는
		//필드명과 JSON방식의 문자열의 key값이 일치해야 변환해줌
	private int msgNo;
	private int memberNo;
	private int chatNo;
	private String msgContent;
	private Date msgTime;
}
