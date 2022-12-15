package com.wdh.mypage.dao;

import static com.wdh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.wdh.board.dao.BoardDao2;
import com.wdh.board.vo.Board;
import com.wdh.board.vo.ReviewBoard;
import com.wdh.member.dao.MemberDao;
import com.wdh.member.vo.Member;


public class MypageDao {
	
	private Properties sql = new Properties();
	
	public MypageDao() {
		
		try {
			String path=MemberDao.class
					.getResource("/sql/mypage/mypage_sql.properties")
					.getPath();
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	

//	회원 등급
	public String memberGrade(Connection conn, String member_id) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String grade = null;
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("memberGrade"));
			pstmt.setString(1, member_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				grade = rs.getString("GRADE_NAME");
				
			}
			
		}  catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		return grade;
		
	}
	
//	동행 글 목록 불러오기
	public List<Board> selectBoardList(Connection conn, int cPage, int numPerpage, Member m){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList();
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("selectBoardList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			pstmt.setInt(3, m.getMember_no());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				list.add(BoardDao2.getBoard(rs));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		return list;
		
	}
	
	public int selectBoardCount(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectBoardCount"));
			
			pstmt.setInt(1, m.getMember_no());
			
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
	
	
//	후기 목록 불러오기
	public List<ReviewBoard> selectBoardListR(Connection conn, int cPage, int numPerpage, Member m){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReviewBoard> list = new ArrayList();
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("selectBoardListR"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			pstmt.setInt(3, m.getMember_no());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				list.add(BoardDao2.getReviewBoard(rs));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		return list;
		
	}
	
	public int selectBoardCountR(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectBoardCountR"));
			
			pstmt.setInt(1, m.getMember_no());
			
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
	
//	후기 글 삭제
	public int deleteReview(Connection conn, int boardNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("deleteReview"));
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			
			e.printStackTrace();
			
		}finally {
			
			close(pstmt);
			
		}
	
		return result;
		
	}
	
	

}
