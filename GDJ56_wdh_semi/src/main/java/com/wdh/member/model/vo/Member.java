package com.wdh.member.model.vo;

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
	private String nickname;
	private String name;
	private String password;
	private String gender;
	private Date birth;
	private String eamil;
	private String phone;
	private String address;

}
