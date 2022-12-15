package com.wdh.board.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CopyFile {

	private int fileNo;
	private int reviewSeq;
	private String fileOrg;
}
