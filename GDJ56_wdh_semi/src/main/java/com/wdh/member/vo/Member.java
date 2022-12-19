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
public class Member {
	private int member_no;
	private String member_id;
	private String member_nickname;
	private String name;
	private String password;
	private char gender;
	private Date birth;
	private String email;
	private String phone;
	private String address;
	private int grade;
	private String profile;

	
}
