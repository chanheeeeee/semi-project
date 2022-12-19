package com.wdh.qs.model.vo;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class QsComment {
	private int qsCommentNo;
	private int qsCommentLevel;
	private String qsCommentWriter;
	private String qsCommentContent;
	private int qsRef;
	private int qsCommentRef;
	private Date qsCommentDate;
}
