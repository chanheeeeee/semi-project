package com.wdh.board.dao;

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

import com.wdh.board.vo.Board;
import com.wdh.board.vo.ReviewBoard;
import com.wdh.board.vo.WdJoin;
import com.wdh.member.dao.MemberDao;
import com.wdh.member.vo.Member;

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
			pstmt.setDate(6, new java.sql.Date(b.getWdDate().getTime()));
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
			pstmt.setString(6, ab.getImg());
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
			pstmt.setDate(6, new java.sql.Date(b.getWdDate().getTime()));
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

	public int wdJoin(Connection conn, WdJoin wj) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertJoin"));
			pstmt.setInt(1, wj.getMemberNo());
			pstmt.setInt(2, wj.getWdNo());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	public int wdCancle(Connection conn, WdJoin wj) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("cancleJoin"));
			pstmt.setInt(1, wj.getMemberNo());
			pstmt.setInt(2, wj.getWdNo());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public List<WdJoin> selectWdJoinM(Connection conn, int memberNo){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<WdJoin> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectWdJoinM"));
			pstmt.setInt(1, memberNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getWdJoin(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public List<WdJoin> selectWdJoinW(Connection conn, int wdNo){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<WdJoin> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectWdJoinW"));
			pstmt.setInt(1, wdNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getWdJoin(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public List<Member> JoinMember(Connection conn, int wdNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("joinMemberName"));
			pstmt.setInt(1, wdNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(MemberDao.getMember(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int outMember(Connection conn, int memberNo, int wdNo) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteWdJoin"));
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, wdNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public Member selectMember(Connection conn, int wdNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectMeber"));
			pstmt.setInt(1, wdNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=MemberDao.getMember(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			
		}return m;
		
	}
	
	public ReviewBoard selectReview(Connection conn, int reviewNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ReviewBoard rb=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectReview"));
			pstmt.setInt(1, reviewNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				rb=BoardDao2.getReviewBoard(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return rb;
	}
	
	public int updateReview(Connection conn, ReviewBoard rb) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("reviewUpdate"));
			pstmt.setString(1, rb.getReviewTitle());
			pstmt.setString(2, rb.getReviewContent());
			pstmt.setDouble(3, rb.getReviewScore());
			pstmt.setInt(4, rb.getReviewSeq());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int updateGrade(Connection conn, Board b) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateGrade"));
			pstmt.setInt(1, b.getMemberNo());
			pstmt.setInt(2, b.getMemberNo());
			pstmt.setInt(3, b.getMemberNo());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public static WdJoin getWdJoin(ResultSet rs) throws SQLException {
		return WdJoin.builder().memberNo(rs.getInt("MEMBER_NO")).wdNo(rs.getInt("WD_NO")).build();
	}
}
