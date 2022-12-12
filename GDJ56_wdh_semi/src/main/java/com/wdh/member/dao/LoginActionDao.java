package com.wdh.member.dao;

import static com.wdh.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;

import com.wdh.member.vo.Member;

public class LoginActionDao {

	private Properties sql = new Properties();
	
	public LoginActionDao() {
		try {
			String path=LoginActionDao.class
					.getResource("/sql/member/member_sql.properties")
					.getPath();
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public Member loginAction(Connection conn, String loginId, String password) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("login"));
			pstmt.setString(1, loginId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = getMember(rs);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return m;
	}


	private Member getMember(ResultSet rs) throws SQLException {
		Member m = new Member();
		m.setUser_id(rs.getString("USER_ID"));
		m.setNick_name(rs.getString("NICK_NAME"));
		m.setName(rs.getString("NAME"));
		m.setPassword(rs.getString("PASSWORD"));
		m.setGender(rs.getString("GENDER").charAt(0));
		m.setBirth(rs.getDate("BIRTH"));
		m.setEmail(rs.getString("EMAIL"));
		m.setPhone(rs.getString("PHONE"));
		m.setAddress(rs.getString("ADDRESS"));
		return m;
	}

}
