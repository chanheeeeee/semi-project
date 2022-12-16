package com.wdh.board.service;

import static com.wdh.common.JDBCTemplate.close;
import static com.wdh.common.JDBCTemplate.commit;
import static com.wdh.common.JDBCTemplate.getConnection;
import static com.wdh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.wdh.board.dao.BoardDao;
import com.wdh.board.vo.Board;
import com.wdh.board.vo.CopyFile;
import com.wdh.board.vo.ReviewBoard;
import com.wdh.board.vo.WdJoin;

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
	
	public int updateBoard(Board b) {
		Connection conn=getConnection();
		int result=dao.updateBoard(conn, b);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int wdJoin(WdJoin wj) {
		Connection conn=getConnection();
		int result=dao.wdJoin(conn, wj);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int wdCancle(WdJoin wj) {
		Connection conn=getConnection();
		int result=dao.wdCancle(conn, wj);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<WdJoin> selectWdJoinM(int memberNo){
		Connection conn=getConnection();
		List<WdJoin> result=dao.selectWdJoinM(conn, memberNo);
		close(conn);
		return result;
	}
	
	public List<WdJoin> selectWdJoinW(int wdNo){
		Connection conn=getConnection();
		List<WdJoin> result=dao.selectWdJoinW(conn, wdNo);
		close(conn);
		return result;
	}

}
