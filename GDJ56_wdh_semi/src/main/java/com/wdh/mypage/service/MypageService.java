package com.wdh.mypage.service;

import static com.wdh.common.JDBCTemplate.close;
import static com.wdh.common.JDBCTemplate.commit;
import static com.wdh.common.JDBCTemplate.getConnection;
import static com.wdh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.wdh.board.vo.Board;
import com.wdh.board.vo.ReviewBoard;
import com.wdh.del.model.vo.Declaration;
import com.wdh.member.vo.Member;
import com.wdh.mypage.dao.MypageDao;
import com.wdh.mypage.vo.Diary;
import com.wdh.qs.model.vo.Question;

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

// 내가 참여한 동행 글 목록 불러오기
	public List<Board> selectBoardWdList(int cPage, int numPerpage, Member m){
			
		Connection conn = getConnection();
			
		List<Board> result = dao.selectBoardWdList(conn, cPage, numPerpage, m);
			
		close(conn);
		return result;
	}
		

	public int selectBoardWdCount(Member m) {
			
		Connection conn = getConnection();
			
		int result = dao.selectBoardWdCount(conn, m);
			
		close(conn);
		return result;
	}
	
//	동행 글 삭제
	public int deleteMyBoard(int boardNo) {
		
		Connection conn = getConnection();
		
		int result = dao.deleteMyboard(conn, boardNo);
		
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
	public int deleteReview(int reviewboardNo) {
		
		Connection conn = getConnection();
		
		int result = dao.deleteReview(conn, reviewboardNo);
		
		close(conn);
		
		return result;
		
	}
	
//	문의 목록 불러오기

	public List<Question> selectQsList(int cPage, int numPerpage, Member m){
		
		Connection conn = getConnection();
		
		List<Question> result = dao.selectQsList(conn, cPage, numPerpage, m);
		
		close(conn);
		
		return result;
	}
	

	public int selectQsCount(Member m) {
		
		Connection conn = getConnection();
		
		int result = dao.selectQsCount(conn, m);
		
		close(conn);
		return result;
	}
	
//	문의 삭제
	public int deleteQs(int qsNo) {
		
		Connection conn = getConnection();
		
		int result = dao.deleteQs(conn, qsNo);
		
		close(conn);
		
		return result;
		
	}
	
	
//	신고 목록 불러오기

	public List<Declaration> selectDclList(int cPage, int numPerpage, Member m){
		
		Connection conn = getConnection();
		
		List<Declaration> result = dao.selectDclList(conn, cPage, numPerpage, m);
		
		close(conn);
		
		return result;
	}
	

	public int selectDclCount(Member m) {
		
		Connection conn = getConnection();
		
		int result = dao.selectDclCount(conn, m);
		
		close(conn);
		return result;
	}
	
//	신고 삭제
	public int deleteDcl(int dclNo) {
		
		Connection conn = getConnection();
		
		int result = dao.deleteDcl(conn, dclNo);
		
		close(conn);
		
		return result;
		
	}
	
	//회원 탈퇴
	public int deleteMember(int member_no) {

		Connection conn = getConnection();
		
		int result = dao.deleteMember(conn, member_no);
		
		close(conn);
		
		return result;
		
	}
	
	//정보 수정
	public int updateMember(Member m) {
		
		Connection conn = getConnection();
		
		int result = dao.updateMember(conn, m);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
		
	}
	
//	멤버 아이디 비번 비교
	public Member searchMember(String memberId, String password) {
		Connection conn=getConnection();
		Member m=dao.searchMember(conn,memberId,password);
		close(conn);
		return m;
	}
	
//  비밀번호 변경
	public int updatePassword(String memberId, String password) {
		
		Connection conn=getConnection();
		int result=dao.updatePassword(conn, memberId, password);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	
//	프로필 사진 변경
	public int changeProfile(Member m, String fileName) {

		Connection conn = getConnection();
		
		int result = dao.changeProfile(conn, m, fileName);
		
		if (result > 0) {
			
			commit(conn);
			
		} else {
			
			rollback(conn);
			
		}
		
		close(conn);
		
		return result;
	}
	
//	내 점수 계산 출력
	public int myScore(Member m) {
		
		Connection conn = getConnection();
		
		int score = dao.myScore(conn, m);
		
		close(conn);
		
		return score;
		
	}
	
//	내 다이어리 불러오기
	public List<Diary> myDiary(Member m) {
		
		Connection conn = getConnection();
		
		List<Diary> result = dao.myDiary(conn, m);
		
		close(conn);
		return result;
		
	}
	
//	다이어리에 저장
	public int addDiary(Diary d, Member m) {
		
		Connection conn = getConnection();
		
		int result = dao.addDiary(conn, d, m);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}
	
//	내가 쓴 동행과 참여한 동행 다이어리에 뿌려 주기
	public List<Diary> myWd(Member m) {
		
		Connection conn = getConnection();
		
		List<Diary> result = dao.myWd(conn, m);
		
		close(conn);
		return result;
		
	}
	

	//다이어리 삭제
	public int deleteDiary(int diary_id) {

		Connection conn = getConnection();
		
		int result = dao.deleteDiary(conn, diary_id);
		
		close(conn);
		
		return result;
		
	}

}





