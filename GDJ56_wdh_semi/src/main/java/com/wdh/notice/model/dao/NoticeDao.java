package com.wdh.notice.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static com.wdh.common.JDBCTemplate.*;

import com.wdh.member.dao.MemberDao;
import com.wdh.notice.model.vo.Notice;

public class NoticeDao {
	private Properties sql=new Properties();
	
	public NoticeDao() {
		String path=NoticeDao.class.getResource("/sql/notice/notice_sql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public List<Notice> searchNotice(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Notice> result=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectNoticeList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Notice n=getNotice(rs);
				n.setMember(MemberDao.getMember(rs));
				result.add(n);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
				
	}
	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertNotice"));
			pstmt.setString(1, n.getNoticeTitle());
//			pstmt.setString(2, n.getNoticeWriter());
			pstmt.setString(2, n.getNoticeContent());
			//pstmt.setString(4, n.getFilePath());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int selectNoticeCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectNoticeCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("cnt");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return count;
	}
	public Notice selectNotice(Connection conn, int no) {
		//공지사항 상세페이지 넘버를 받기위해 선언한 메소드
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Notice n=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectNotice"));
			pstmt.setInt(1,no);
			rs=pstmt.executeQuery();
			if(rs.next())
				n=getNotice(rs);
			n.setMember(MemberDao.getMember(rs));
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return n;
	}
	
	public int updateNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("updateNotice"));
			pstmt.setString(1, n.getNoticeTitle());
//			pstmt.setString(2, n.getNoticeWriter());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getNoticeNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public int deleteNotice(Connection conn, int no) {
		PreparedStatement pstmt =null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteNotice"));
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	public static Notice getNotice(ResultSet rs) throws SQLException{
		return Notice.builder()
				.noticeNo(rs.getInt("notice_no"))
				.noticeTitle(rs.getString("notice_title"))
				.noticeWriter(rs.getString("member_no"))
				.noticeContent(rs.getString("notice_content"))
				.noticeEnroll(rs.getDate("notice_dated"))
				.build();
	}
}