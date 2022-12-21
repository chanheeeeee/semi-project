package com.wdh.member.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Message {
	private int msg_no;				//시퀀스
	private String writer_nickname;	//보낸사람 닉네임
	private String msg_content;		//메세지 내용
	private String msg_date;			//시간
	private char read_yn;			//읽음 여부
	private int wdNo;				//게시글번호
	private int msg_writer;			//보낸사람 시퀀스
}
