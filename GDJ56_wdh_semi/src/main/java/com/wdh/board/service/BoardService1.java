package com.wdh.board.service;

import java.sql.Connection;

import com.wdh.board.dao.BoardDao;
import com.wdh.board.vo.Board;
import static com.wdh.common.JDBCTemplate.*;

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

}
