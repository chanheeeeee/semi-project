package com.wdh.challenge.model.vo;

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


	public class Challenge {
	
		private int challenge_no;
		private String challenge_name;
		private Date challenge_date;
		private String challenge_img;
		
		
	}
