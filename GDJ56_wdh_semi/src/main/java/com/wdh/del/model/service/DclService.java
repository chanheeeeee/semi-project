package com.wdh.del.model.service;

import static com.wdh.common.JDBCTemplate.close;
import static com.wdh.common.JDBCTemplate.commit;
import static com.wdh.common.JDBCTemplate.getConnection;
import static com.wdh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.wdh.del.model.dao.DclDao;
import com.wdh.del.model.vo.DclComment;
import com.wdh.del.model.vo.Declaration;
import com.wdh.member.vo.Member;

public class DclService {
	
	private DclDao dao=new DclDao();
	public List<Declaration> searchDcl(int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Declaration> result=dao.searchDcl(conn,cPage,numPerpage);
		close(conn);
		return result;
	}
	public int selectDclCount() {
		Connection conn=getConnection();
		int result=dao.selectDclCount(conn);
		close(conn);
		return result;
	}
	public Declaration selectDcl(int no) {
		Connection conn=getConnection();
		Declaration dcl=dao.selectDcl(conn, no);
		close(conn);
		return dcl;
	}
	public int insertDcl(Declaration dcl, Member m) {
		Connection conn=getConnection();
		int result=dao.insertDcl(conn, dcl, m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		}
	public int deleteDcl(int no) {
		Connection conn=getConnection();
		int result=dao.deleteDcl(conn,no);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int insertDclComment(DclComment dc) {
		Connection conn=getConnection();
		int result=dao.insertDclComment(conn,dc);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public List<DclComment> selectDclComment(int dclNo){
		Connection conn=getConnection();
		List<DclComment> list=dao.selectDclComment(conn,dclNo);
		close(conn);
		return list;
	}
	
	}
