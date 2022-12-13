package com.wdh.board.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.wdh.board.vo.Board;

public class BoardDao2 {
	
	private Properties sql = new Properties();

	public BoardDao2() {
		String path = BoardDao2.class.getResource("/sql/board/board_sql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Board> selectBoardList(Connection conn, int cPage, int numPerpage){
		List<Board> list = new ArrayList();
		return list;
	}

}
