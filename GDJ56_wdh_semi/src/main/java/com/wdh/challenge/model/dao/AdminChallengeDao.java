package com.wdh.challenge.model.dao;

import static com.wdh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.wdh.challenge.model.vo.Challenge;

public class AdminChallengeDao {
	private Properties sql=new Properties();
	
	public AdminChallengeDao() {
		String path=AdminChallengeDao.class.getResource("/sql/challenge/challenge_sql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public List<Challenge> searchChallenge(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Challenge> result=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectChallengeList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Challenge ch=getChallenge(rs);
				System.out.println(ch);
				result.add(ch);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public int selectChallengeCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectChallengeCount"));
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
	
	
	public int insertChallenge(Connection conn, Challenge ch) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertChallenge"));
			pstmt.setString(1, ch.getChallenge_img());
			pstmt.setString(2, ch.getChallenge_name());
			pstmt.setDate(3, new java.sql.Date(ch.getChallenge_date().getTime()));
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	public Challenge selectChallenge(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Challenge ch=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectChallenge"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ch=getChallenge(rs);
				System.out.println(ch);
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return ch;
	}
	
	
	public int deleteChallenge(Connection conn, int no) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteChallenge"));
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	public Challenge startChallenge(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Challenge ch=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("startChallenge"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ch=getChallenge(rs);	
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return ch;
	}
	
	public List<Map<String,String>> selectMyChallenge(Connection conn, int member_id){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Map<String,String>> ch=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectMyIngChallenge"));
			pstmt.setInt(1, member_id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ch.add(getMyChallenge(rs));	
				//System.out.println(ch);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return ch;
	}
	
	
	
	public int attenceChallenge(Connection conn, int challengeNo, int memberNo) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("attanceChallenge"));
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, challengeNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	
	
	private Map<String,String> getMyChallenge(ResultSet rs) throws SQLException{
		Map<String,String> data=new HashMap();
		data.put("filePath",rs.getString("file_path"));
		data.put("dayCnt",rs.getString("day_cnt"));
		data.put("challengeName",rs.getString("challenge_name"));
		data.put("challengeImg",rs.getString("challenge_img"));
		data.put("challengeNo",rs.getString("chjoin_no"));
		return data;
	}
	private Challenge getChallenge(ResultSet rs) throws SQLException{
		return Challenge.builder()
				.challenge_no(rs.getInt("challenge_no"))
				.challenge_img(rs.getString("challenge_img"))
				.challenge_name(rs.getString("challenge_name"))
				.challenge_date(rs.getDate("challenge_date"))

				.build();
	}
	
}	