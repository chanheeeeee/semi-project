package com.wdh.board.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class AfterBoard {

	private int reviewSeq;
	private int memberNo;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewDate;
	private int wdNo;
	private double reviewScore;
}
