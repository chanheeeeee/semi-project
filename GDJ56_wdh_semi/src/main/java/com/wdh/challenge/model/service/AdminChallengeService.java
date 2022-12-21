package com.wdh.challenge.model.service;

import static com.wdh.common.JDBCTemplate.close;
import static com.wdh.common.JDBCTemplate.commit;
import static com.wdh.common.JDBCTemplate.getConnection;
import static com.wdh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.wdh.challenge.model.dao.AdminChallengeDao;
import com.wdh.challenge.model.vo.Challenge;

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
	public List<Map<String,String>> selectMyChallenge(int member_id) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		List<Map<String,String>> ch=dao.selectMyChallenge(conn, member_id);
		close(conn);
		return ch;
	}
	public int attenceChallenge(int challengeNo, int memberNo) {
		Connection conn=getConnection();
		int result=dao.attenceChallenge(conn,challengeNo,memberNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int selectChallengeResultCount() {
		Connection conn=getConnection();
		int result=dao.selectChallengeCount(conn);
		close(conn);
		return result;
	}
	public List<Challenge> searchChallengeResult(int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<Challenge> result=dao.searchChallenge(conn,cPage,numPerpage);
		close(conn);
		return result;
	}
	
	}
