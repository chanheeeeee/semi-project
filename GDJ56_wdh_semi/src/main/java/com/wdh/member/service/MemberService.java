package com.wdh.member.service;

import static com.wdh.common.JDBCTemplate.close;
import static com.wdh.common.JDBCTemplate.commit;
import static com.wdh.common.JDBCTemplate.getConnection;
import static com.wdh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.wdh.member.dao.MemberDao;
import com.wdh.member.vo.Member;
import com.wdh.member.vo.Message;

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
	
	//비밀번호 재설정
	public int rePassword(String member_id, String newpw) {
		Connection conn = getConnection();
		int result = new MemberDao().rePassword(conn,member_id,newpw);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//쪽지보내기
	public int sendMessage(String wdNo, String receiveMemberNo, String content, int msg_writer) {
		Connection conn = getConnection();
		int result = new MemberDao().sendMessage(conn, wdNo, receiveMemberNo ,content, msg_writer);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//쪽지 리스트
	public List<Message> messageList(int msg_writer) {
		Connection conn = getConnection();
		List<Message>list = new MemberDao().messageList(conn,msg_writer);
		close(conn);
		return list;
	}
	
	//쪽지 지우기
	public int deleteMessage(int msg_no) {
		Connection conn = getConnection();
		int result = new MemberDao().deleteMessage(conn,msg_no);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//답장하기
	public int readYN(int msgNo) {
		Connection conn = getConnection();
		int result = new MemberDao().readYn(conn,msgNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	//이모티콘 갯수
	public int readCount(int mem_no) {
		Connection conn = getConnection();
		int result = new MemberDao().readCount(conn,mem_no);
		close(conn);
		return result;
	}
	
	
	
	

}
