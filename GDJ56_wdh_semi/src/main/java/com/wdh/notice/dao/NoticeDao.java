package com.wdh.notice.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.wdh.notice.model.vo.Notice;
import static com.wdh.common.JDBCTemplate.*;

public class NoticeDao {
	private Properties sql=new Properties();
	
	public NoticeDao() {
		String path=NoticeDao.class
				.getResource("/sql/notice/notice_sql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Notice> selectNoticeList(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Notice> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectNoticeList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getNotice(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int selectNoticeCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectNoticeCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public int insertNotice(Connection conn,Notice n) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertNotice"));
			pstmt.setString(1, n.getNOTICE_TITLE());
			pstmt.setString(2, n.getNOTICE_WRITER());
			pstmt.setString(3, n.getNOTICE_CONTENT());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public Notice selectNotice(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Notice n=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectNotice"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) n=getNotice(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return n;
	}
	
	
	
	private Notice getNotice(ResultSet rs) throws SQLException{
		return Notice.builder()
				.NOTICE_NO(rs.getInt("notice_no"))
				.NOTICE_TITLE(rs.getString("notice_title"))
				.NOTICE_CONTENT(rs.getString("notice_content"))
				.NOTICE_WRITER(rs.getString("notice_writer"))
				.NOTICE_DATED(rs.getDate("notice_dated"))
				.build();
		
	}
	
	
}