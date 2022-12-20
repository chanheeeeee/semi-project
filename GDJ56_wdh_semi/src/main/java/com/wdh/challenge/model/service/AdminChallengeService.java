package com.wdh.challenge.model.service;

import static com.wdh.common.JDBCTemplate.close;
import static com.wdh.common.JDBCTemplate.commit;
import static com.wdh.common.JDBCTemplate.getConnection;
import static com.wdh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.wdh.challenge.model.dao.AdminChallengeDao;
import com.wdh.challenge.model.service.AdminChallengeService;
import com.wdh.challenge.model.vo.Challenge;
import com.wdh.member.vo.Member;

public class AdminChallengeService {
	
	private AdminChallengeDao dao=new AdminChallengeDao();
	public List<Challenge> searchChallenge(int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Challenge> result=dao.searchChallenge(conn,cPage,numPerpage);
		close(conn);
		return result;
	}
	public int selectChallengeCount() {
		Connection conn=getConnection();
		int result=dao.selectChallengeCount(conn);
		close(conn);
		return result;
	}
	public Challenge selectChallenge(int no) {
		Connection conn=getConnection();
		Challenge ch=dao.selectChallenge(conn, no);
		close(conn);
		return ch;
	}
	public int insertChallenge(Challenge ch) {
		Connection conn=getConnection();
		int result=dao.insertChallenge(conn, ch);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		}
	public int deleteChallenge(int no) {
		Connection conn=getConnection();
		int result=dao.deleteChallenge(conn,no);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public Challenge startChallenge() {
		Connection conn=getConnection();
		Challenge ch=dao.startChallenge(conn);
		close(conn);
		return ch;
	}
	public void selectMyChallenge(String member_id) {
		// TODO Auto-generated method stub
		
	}
	}