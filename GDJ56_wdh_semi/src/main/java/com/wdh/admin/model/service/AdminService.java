package com.wdh.admin.model.service;

import java.sql.Connection;
import java.util.List;

import static com.wdh.common.JDBCTemplate.*;
import com.wdh.admin.model.dao.AdminDao;
import com.wdh.member.vo.Member;

public class AdminService {
	private AdminDao dao=new AdminDao();
	
	/*
	 * public List<Member> searchMemberList(int cPage,int numPerpage){ Connection
	 * conn=getConnection(); List<Member>
	 * result=dao.searchMemberList(conn,cPage,numPerpage); close(conn); return
	 * result; }
	 */
	public int selectMemberCount() {
		Connection conn=getConnection();
		int result=dao.selectMemberCount(conn);
		close(conn);
		return result;
	}
	
	public List<Member> adminMemberList() {
		Connection conn=getConnection();
		List<Member> list=dao.adminMemberList(conn);
		close(conn);
		return list;
	}
	
	
	public List<Member> searchMemberList(){
		Connection conn=getConnection();
		List<Member> list=dao.searchMemberList(conn);
		close(conn);
		return list;
	}
	
	public int selectMemberCount(String type, String keyword) {
		Connection conn=getConnection();
		int result=dao.selectMemberCount(conn,type,keyword);
		close(conn);
		return result;
	}

}