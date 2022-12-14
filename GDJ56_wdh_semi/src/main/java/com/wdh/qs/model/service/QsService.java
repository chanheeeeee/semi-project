package com.wdh.qs.model.service;

import static com.wdh.common.JDBCTemplate.close;
import static com.wdh.common.JDBCTemplate.commit;
import static com.wdh.common.JDBCTemplate.getConnection;
import static com.wdh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;


import com.wdh.qs.model.dao.QsDao;
import com.wdh.qs.model.vo.Question;

public class QsService {
	private QsDao dao=new QsDao();
	
	public List<Question> searchQs(int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Question> result=dao.searchQs(conn,cPage,numPerpage);
		close(conn);
		return result;
	}
	public int selectQsCount() {
		Connection conn=getConnection();
		int result=dao.selectQsCount(conn);
		close(conn);
		return result;
	}
	public Question selectQs(int no) {
		Connection conn=getConnection();
		Question qs=dao.selectQs(conn, no);
		close(conn);
		return qs;
	}
	public int insertQs(Question qs) {
		Connection conn=getConnection();
		int result=dao.insertQs(conn, qs);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		}
}
