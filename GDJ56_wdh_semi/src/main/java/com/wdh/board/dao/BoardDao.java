package com.wdh.board.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Properties;

import com.wdh.board.vo.Board;

public class BoardDao {
	
	private Properties sql=new Properties();
	
	public BoardDao() {
		String path=BoardDao.class.getResource("/sql/board/board.sql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
//	public int insertBoard(Connection conn, Board b) {
//		PreparedStatement pstmt=null;
//		int result=0;
//		try {
//			pstmt=conn.prepareStatement(sql.getProperty("insertBoard"));
//			pstmt.setString(1, result);
//		}
//	}

}
