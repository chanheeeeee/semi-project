package com.wdh.del.model.vo;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class DclComment {
	private int dclCommentNo;
	private int dclCommentLevel;
	private String dclCommentWriter;
	private String dclCommentContent;
	private int dclRef;
	private int dclCommentRef;
	private Date DclCommentDate;
}
