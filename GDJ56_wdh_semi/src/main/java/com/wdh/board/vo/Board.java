package com.wdh.board.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;


@Data
@Builder
public class Board {

	private int wdNo;
	private String wdTitle;
	private String wdLocation;
	private String wdCategory;
	private char wdGender;
	private String wdContent;
	private Date wdDate;
	private int wdCount;
	private Date wdTime;
	private int memberNo;
}
