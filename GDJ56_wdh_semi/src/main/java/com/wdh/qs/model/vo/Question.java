package com.wdh.qs.model.vo;

import java.util.Date;

import com.wdh.member.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Question {
	private int qsNo;
	private String qsTitle;
	private String qsContent;
	private Date qsDate;
	private String qsHeadTitle;
	private char qsResult;
	private int memberNo;
	private Member member;
	
	
}
