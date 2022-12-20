package com.wdh.member.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Message {

	private int msg_no;
	private int wd_no;
	private int receive_member_no;
	private String msg_content;
	private Date msg_date;
	private char read_YN;
	private int msg_writer;
	
	
}
