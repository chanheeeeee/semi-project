package com.wdh.board.dao;

import static com.wdh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.wdh.board.vo.Board;

public class BoardDao2 {
	
	private Properties sql = new Properties();

	public BoardDao2() {
		String path = BoardDao2.class.getResource("/sql/board/board_sql.properties2").getPath();
		try {
			sql.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Board> selectBoardList(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectBoardList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(getBoard(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int selectBoardCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectBoardCount"));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	
	//공통으로 사용 
	public static Board getBoard(ResultSet rs) throws SQLException{
		return Board.builder()
				.wdNo(rs.getInt("WD_NO"))
				.wdTitle(rs.getString("WD_TITLE"))
				.wdLocation(rs.getString("WD_LOCATION"))
				.wdCategory(rs.getString("WD_CATEGORY"))
				.wdGender(rs.getString("WD_GENDER"))
				.wdContent(rs.getString("WD_CONTENT"))
				.wdDate(rs.getDate("WD_DATE"))
				.wdCount(rs.getInt("WD_COUNT"))
				.wdTime(rs.getDate("WD_TIME"))
				.memberNo(rs.getInt("MEMBER_NO"))
				.wdPurpose(rs.getString("WD_PURPOSE"))
				.build();
	}

}
