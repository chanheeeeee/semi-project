package com.wdh.mypage.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class JsonDiary {
	private String title;
	private String description; 
	private String start; 
	private String end;
	private String backgroundColor;
}
