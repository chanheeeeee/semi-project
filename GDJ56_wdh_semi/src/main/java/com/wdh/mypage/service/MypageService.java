package com.wdh.mypage.service;

import static com.wdh.common.JDBCTemplate.close;
import static com.wdh.common.JDBCTemplate.commit;
import static com.wdh.common.JDBCTemplate.getConnection;
import static com.wdh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.wdh.board.vo.Board;
import com.wdh.board.vo.ReviewBoard;
import com.wdh.member.vo.Member;
import com.wdh.mypage.dao.MypageDao;

public class MypageService {
	
	private MypageDao dao = new MypageDao();
	
	//멤버 등급
	public String memberGrade(String member_id) {
		
		Connection conn = getConnection();
		
		String grade = dao.memberGrade(conn, member_id);
		
		close(conn);
		
		return grade;
		
	}
	
//동행 글 목록 불러오기
	public List<Board> selectBoardList(int cPage, int numPerpage, Member m){
		
		Connection conn = getConnection();
		
		List<Board> result = dao.selectBoardList(conn, cPage, numPerpage, m);
		
		close(conn);
		return result;
	}
	

	public int selectBoardCount(Member m) {
		
		Connection conn = getConnection();
		
		int result = dao.selectBoardCount(conn, m);
		
		close(conn);
		return result;
	}
	
//	후기 목록 불러오기

	public List<ReviewBoard> selectBoardListR(int cPage, int numPerpage, Member m){
		
		Connection conn = getConnection();
		
		List<ReviewBoard> result = dao.selectBoardListR(conn, cPage, numPerpage, m);
		
		close(conn);
		return result;
	}
	

	public int selectBoardCountR(Member m) {
		
		Connection conn = getConnection();
		
		int result = dao.selectBoardCountR(conn, m);
		
		close(conn);
		return result;
	}
	
//	후기 글 삭제
	public int deleteReview(int boardNo) {
		
		Connection conn = getConnection();
		
		int result = dao.deleteReview(conn, boardNo);
		
		close(conn);
		
		return result;
		
	}
	
	
	
	

}
