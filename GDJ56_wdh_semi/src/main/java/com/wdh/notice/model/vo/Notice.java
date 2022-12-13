package com.wdh.notice.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;
	
	@Data
	@Builder
	public class Notice {
		private int NOTICE_NO;
		private String NOTICE_TITLE;
		private String NOTICE_CONTENT;
		private String NOTICE_WRITER; //admin
		private Date NOTICE_DATED;
	}

