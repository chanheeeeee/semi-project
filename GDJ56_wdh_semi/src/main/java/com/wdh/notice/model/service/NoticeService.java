package com.wdh.notice.model.service;

import java.sql.Connection;
import java.util.List;

import com.wdh.notice.model.dao.NoticeDao;
import com.wdh.notice.model.vo.Notice;
import static com.wdh.common.JDBCTemplate.*;

public class NoticeService {
	private NoticeDao dao=new NoticeDao();
	
	public List<Notice> selectNoticeList(int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Notice> result=dao.searchNotice(conn,cPage,numPerpage);
		close(conn);
		return result;
	}
	public int selectNoticeCount() {
		Connection conn=getConnection();
		int result=dao.selectNoticeCount(conn);
		close(conn);
		return result;
	}
	public Notice selectNotice(int no) {
		Connection conn=getConnection();
		Notice n=dao.selectNotice(conn, no);
		close(conn);
		return n;
	}
	public int insertNotice(Notice n) {
		Connection conn=getConnection();
		int result=dao.insertNotice(conn, n);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;

	}
	
	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		int result = dao.updateNotice(conn, n);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}	
	
	
	public int deleteNotice(int no) {
		Connection conn=getConnection();
		int result=dao.deleteNotice(conn,no);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}
}		