package com.wdh.challenge.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class Challenge2 {
	
	private int challenge_no;
	private String challenge_name;
	private Date challenge_date;
	private String challenge_img;
	private String file_path;
	
}
