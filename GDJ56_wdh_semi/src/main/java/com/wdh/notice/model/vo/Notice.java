package com.wdh.notice.model.vo;


import java.sql.Date;

import lombok.Builder;
import lombok.Data;


import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
	private Date noticeEnroll;
	private String filePath;
	//private char status;
	
}

