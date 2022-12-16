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
	
	//멤버 정보 - 아이디 중복, 뷰
	public Member memberView(String member_id) {
		
		Connection conn = getConnection();
		
		Member m = dao.memberView(conn,member_id);
		
		close(conn);
		return m;
		
	}

	//닉네임 중복
	public Member NickNameDuplicate(String nickname) {
		Connection conn = getConnection();
		Member m = dao.NicknameDuplicate(conn, nickname);
		close(conn);
		return m;
	}

	//비밀번호 찾기-인증번호 구현(DB값 확인)
	public String authSendPw(String member_id, String name, String email) {
		Connection conn = getConnection();
		String password = dao.authSendPw(conn,member_id,name,email);
		close(conn);
		return password;
	}
	
	//멤버번호로 멤버찾기
	public Member searchMember(int memberNo) {
		Connection conn=getConnection();
		Member result=dao.searchMember(conn, memberNo);
		close(conn);
		return result;
	}
	
	
	
	

}
