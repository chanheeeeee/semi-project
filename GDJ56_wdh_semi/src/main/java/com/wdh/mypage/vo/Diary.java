package com.wdh.mypage.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Diary {
	
	private int diaryId; //다이어리 아이디
	private String title; //제목
	private int memberNo; //멤버 번호
	private int wdNo; //불러올 동행 번호
	private String start; //시작 날짜
	private String end; //끝 날짜
	private String memo; //메모
	private String bgColor; //메모 색깔
	

}
