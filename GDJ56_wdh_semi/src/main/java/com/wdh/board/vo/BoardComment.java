package com.wdh.board.vo;


import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class BoardComment {
	private int commentNo;
	private String wcContent;
	private Date wcDate;
	private int wcNo;
	private int memberNo;
	private int wdCommentRef;
	private int wdCommentLev;
}