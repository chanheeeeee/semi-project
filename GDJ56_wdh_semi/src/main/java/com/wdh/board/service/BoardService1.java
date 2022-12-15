package com.wdh.board.service;

import static com.wdh.common.JDBCTemplate.close;
import static com.wdh.common.JDBCTemplate.commit;
import static com.wdh.common.JDBCTemplate.getConnection;
import static com.wdh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.wdh.board.dao.BoardDao;
import com.wdh.board.vo.Board;
import com.wdh.board.vo.CopyFile;
import com.wdh.board.vo.ReviewBoard;

public class BoardService1 {
	
	private BoardDao dao=new BoardDao();
	
	public int insertBoard(Board b) {
		Connection conn=getConnection();
		int result=dao.insertBoard(conn, b);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int insertAfterBoard(ReviewBoard rb) {
		Connection conn=getConnection();
		int result=dao.insertAfterBoard(conn, rb);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int insertFile(CopyFile f) {
		Connection conn=getConnection();
		int result=dao.insertFile(conn, f);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int deleteBoard(int wdNo) {
		Connection conn=getConnection();
		int result=dao.deleteBoard(conn, wdNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
