package com.wdh.del.model.dao;

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
import com.wdh.del.model.vo.Declaration;

public class DclDao {
	private Properties sql=new Properties();
	
	public DclDao() {
		String path=DclDao.class.getResource("/sql/dcl/dclsql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public List<Declaration> searchDcl(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Declaration> result=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchDclList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getDcl(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	public int selectDclCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectDclCount"));
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
	public int insertDcl(Connection conn, Declaration dcl) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertDcl"));
			pstmt.setString(1, dcl.getDclTitle());
			pstmt.setString(2, dcl.getDclContent());
			pstmt.setString(3, dcl.getDclHeadTitle());
			pstmt.setInt(4, dcl.getMemberNo());
			pstmt.setString(5, dcl.getFilePath());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public Declaration selectDcl(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Declaration dcl=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectDcl"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) dcl=getDcl(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return dcl;
	}
	
	
	
	public static Declaration getDcl(ResultSet rs) throws SQLException{
		return Declaration.builder()
				.dclNo(rs.getInt("dcl_no"))
				.dclTitle(rs.getString("dcl_content"))
				.dclContent(rs.getString("dcl_content"))
				.dclDate(rs.getDate("dcl_date"))
				.dclHeadTitle(rs.getString("dcl_headtitle"))
				.dclResult(rs.getString("dcl_result").charAt(0))
				.memberNo(rs.getInt("member_no"))
				.filePath(rs.getString("filepath"))
				.build();
	}
}
