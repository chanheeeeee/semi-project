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
	private String user_id;
	private String nick_name;
	private String name;
	private String password;
	private char gender;
	private Date birth;
	private String email;
	private String phone;
	private String address;

	
}
