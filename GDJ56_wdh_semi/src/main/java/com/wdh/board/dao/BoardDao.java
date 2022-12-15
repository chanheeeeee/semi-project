package com.wdh.board.dao;

import static com.wdh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.wdh.board.vo.Board;
import com.wdh.board.vo.CopyFile;
import com.wdh.board.vo.ReviewBoard;

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
	
	public int insertBoard(Connection conn, Board b) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertBoard"));
			pstmt.setString(1, b.getWdTitle());
			pstmt.setString(2, b.getWdLocation());
			pstmt.setString(3, b.getWdCategory());
			pstmt.setString(4, String.valueOf(b.getWdGender()));
			pstmt.setString(5, b.getWdContent());
			pstmt.setDate(6, new java.sql.Date(b.getWdDate().getDate()));
			pstmt.setInt(7, b.getWdCount());
			pstmt.setInt(8, b.getMemberNo());
			pstmt.setString(9, b.getWdPurpose());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int insertAfterBoard(Connection conn, ReviewBoard ab) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertReview"));
			pstmt.setInt(1, ab.getMemberNo());
			pstmt.setString(2, ab.getReviewTitle());
			pstmt.setString(3, ab.getReviewContent());
			pstmt.setInt(4, ab.getWdNo());
			pstmt.setDouble(5, ab.getReviewScore());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int insertFile(Connection conn, CopyFile f) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertFile"));
			pstmt.setInt(1, f.getReviewSeq());
			pstmt.setString(2, f.getFileOrg());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int deleteBoard(Connection conn, int wdNo) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("boardDelete"));
			pstmt.setInt(1, wdNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int updateBoard(Connection conn, Board b) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("boardUpdate"));
			pstmt.setString(1, b.getWdTitle());
			pstmt.setString(2, b.getWdLocation());
			pstmt.setString(3, b.getWdCategory());
			pstmt.setString(4, b.getWdGender());
			pstmt.setString(5, b.getWdContent());
			pstmt.setDate(6, new java.sql.Date(b.getWdDate().getDate()));
			pstmt.setInt(7, b.getWdCount());
			pstmt.setString(8, b.getWdPurpose());
			pstmt.setInt(9, b.getWdNo());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}

}
