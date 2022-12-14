package com.wdh.del.model.service;

import static com.wdh.common.JDBCTemplate.close;
import static com.wdh.common.JDBCTemplate.commit;
import static com.wdh.common.JDBCTemplate.getConnection;
import static com.wdh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.wdh.del.model.dao.DclDao;
import com.wdh.del.model.vo.Declaration;

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
	public int insertDcl(Declaration dcl) {
		Connection conn=getConnection();
		int result=dao.insertDcl(conn, dcl);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		}
	}
