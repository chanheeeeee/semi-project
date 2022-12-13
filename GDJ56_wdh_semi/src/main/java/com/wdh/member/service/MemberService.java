package com.wdh.member.service;

import static com.wdh.common.JDBCTemplate.close;
import static com.wdh.common.JDBCTemplate.commit;
import static com.wdh.common.JDBCTemplate.getConnection;
import static com.wdh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.wdh.member.dao.MemberDao;
import com.wdh.member.vo.Member;

public class MemberService {
	private MemberDao dao = new MemberDao();
	
	
	//로그인 액션
	public Member loginAction(String loginId, String password) {
		Connection conn = getConnection();
		MemberDao dao = new MemberDao();
		Member m = dao.loginAction(conn, loginId, password);
		close(conn);
		
		return m;
	}

	//회원가입
	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = dao.insertMember(conn,m);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	//아이디 찾기
	public Member searchMemberId(String name, String email){
		Connection conn = getConnection();
		Member m = dao.searchMemberId(conn, name, email);
		close(conn);
		return m;
	}
	
	
	

}
