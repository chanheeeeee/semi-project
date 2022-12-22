package com.wdh.mypage.dao;

import static com.wdh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.wdh.board.dao.BoardDao2;
import com.wdh.board.vo.Board;
import com.wdh.board.vo.ReviewBoard;
import com.wdh.del.model.dao.DclDao;
import com.wdh.del.model.vo.Declaration;
import com.wdh.member.dao.MemberDao;
import com.wdh.member.vo.Member;
import com.wdh.mypage.vo.Diary;
import com.wdh.qs.model.dao.QsDao;
import com.wdh.qs.model.vo.Question;


public class MypageDao {
	
	private Properties sql = new Properties();
	
	public MypageDao() {
		
		try {
			String path=MemberDao.class
					.getResource("/sql/mypage/mypage_sql.properties")
					.getPath();
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	

//	회원 등급
	public String memberGrade(Connection conn, String member_id) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String grade = null;
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("memberGrade"));
			pstmt.setString(1, member_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				grade = rs.getString("GRADE_NAME");
				
			}
			
		}  catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		return grade;
		
	}
	
//	동행 글 목록 불러오기
	public List<Board> selectBoardList(Connection conn, int cPage, int numPerpage, Member m){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList();
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("selectBoardList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			pstmt.setInt(3, m.getMember_no());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				list.add(BoardDao2.getBoard(rs));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		return list;
		
	}
	
	public int selectBoardCount(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectBoardCount"));
			
			pstmt.setInt(1, m.getMember_no());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	
//	동행 글 목록 불러오기
	public List<Board> selectBoardWdList(Connection conn, int cPage, int numPerpage, Member m){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList();
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("selectWdJoin"));
			pstmt.setInt(1, m.getMember_no());
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				list.add(BoardDao2.getBoard(rs));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		return list;
		
	}
	
	public int selectBoardWdCount(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectWdJoinCount"));
			
			pstmt.setInt(1, m.getMember_no());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}

//	동행 글 삭제
	public int deleteMyboard(Connection conn, int boardNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("deleteMyBoard"));
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			
			e.printStackTrace();
			
		}finally {
			
			close(pstmt);
			
		}
		
		return result;
	}
	
//	후기 목록 불러오기
	public List<ReviewBoard> selectBoardListR(Connection conn, int cPage, int numPerpage, Member m){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReviewBoard> list = new ArrayList();
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("selectBoardListR"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			pstmt.setInt(3, m.getMember_no());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				list.add(BoardDao2.getReviewBoard(rs));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		return list;
		
	}
	
	public int selectBoardCountR(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectBoardCountR"));
			
			pstmt.setInt(1, m.getMember_no());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
//	후기 글 삭제
	public int deleteReview(Connection conn, int reviewboardNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("deleteReview"));
			pstmt.setInt(1, reviewboardNo);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			
			e.printStackTrace();
			
		}finally {
			
			close(pstmt);
			
		}
	
		return result;
		
	}
	
	
//	문의 목록 불러오기
	public List<Question> selectQsList(Connection conn, int cPage, int numPerpage, Member m){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Question> list = new ArrayList();
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("selectQsList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			pstmt.setInt(3, m.getMember_no());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				list.add(QsDao.getQs(rs));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		return list;
		
	}
	
	public int selectQsCount(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectQsCount"));
			
			pstmt.setInt(1, m.getMember_no());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
//	문의 삭제
	public int deleteQs(Connection conn, int qsNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("deleteQs"));
			pstmt.setInt(1, qsNo);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			
			e.printStackTrace();
			
		}finally {
			
			close(pstmt);
			
		}
	
		return result;
		
	}
	
	
//	신고 목록 불러오기
	public List<Declaration> selectDclList(Connection conn, int cPage, int numPerpage, Member m){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Declaration> list = new ArrayList();
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("selectDclList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			pstmt.setInt(3, m.getMember_no());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				list.add(DclDao.getDcl(rs));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		return list;
		
	}
	
	public int selectDclCount(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectDclCount"));
			
			pstmt.setInt(1, m.getMember_no());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
//	신고 삭제
	public int deleteDcl(Connection conn, int qsNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("deleteDcl"));
			pstmt.setInt(1, qsNo);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			
			e.printStackTrace();
			
		}finally {
			
			close(pstmt);
			
		}
	
		return result;
		
	}
	
	
	//회원 탈퇴
	public int deleteMember(Connection conn, int member_no) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("deleteMember"));
			pstmt.setInt(1, member_no);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			
			e.printStackTrace();
			
		}finally {
			
			close(pstmt);
			
		}
	
		return result;
		
	}
	
	
	// 멤버 정보 수정
	public int updateMember(Connection conn, Member m) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			
			pstmt=conn.prepareStatement(sql.getProperty("updateMember"));
			pstmt.setString(1, String.valueOf(m.getGender()));
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3,m.getMember_nickname());
			pstmt.setString(4, m.getAddress());
			pstmt.setString(5, m.getPhone());
			pstmt.setInt(6, m.getMember_no());
			
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
		
	}
	
	//비번 바꾸기 하기 위한 멤버 검색
	public Member searchMember(Connection conn, String memberId, String password) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		
		try {
			
			pstmt=conn.prepareStatement(sql.getProperty("searchIdPassword"));
			pstmt.setString(1, memberId);
			pstmt.setString(2, password);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				m = MemberDao.getMember(rs);
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
	
	
//	비밀번호 변경
	public int updatePassword(Connection conn, String memberId, String password) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("updatePassword"));
			pstmt.setString(1, password);
			pstmt.setString(2, memberId);
			
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
		
	}
	
	
//	프로필 변경
	public int changeProfile(Connection conn, Member m, String fileName) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("changeProfile"));
			pstmt.setString(1, fileName);
			pstmt.setInt(2, m.getMember_no());
			
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
		
	}
	
//	내 점수 불러오기
	public int myScore(Connection conn, Member m) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int score = 0;
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("myScore"));
			pstmt.setInt(1, m.getMember_no());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				score = rs.getInt("SUM(REVIEW_SCORE)");
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
			close(pstmt);
			
		}
		
		return score;
		
	}
	
//	다이어리 데이터 가져오기
	public List<Diary> myDiary(Connection conn, Member m) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Diary> list = new ArrayList();
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("myDiary"));
			pstmt.setInt(1, m.getMember_no());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				Diary d = new Diary();
				d.setDiaryId(rs.getInt("DIARY_ID"));
				d.setTitle(rs.getString("DIARY_TITLE"));
				d.setMemberNo(rs.getInt("MEMBER_NO"));
				d.setWdNo(rs.getInt("WD_NO"));
				d.setStart(rs.getDate("DIARY_START"));
				d.setEnd(rs.getDate("DIARY_END"));
				d.setMemo(rs.getString("DIARY_MEMO"));
				d.setBgColor(rs.getString("BACKGROUND_COLOR"));
				
				list.add(d);
			}
			
		} catch(SQLException e) {
			
			e.printStackTrace();
		
		} finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		return list; 
		
	}
	
//	다이어리 추가
	public int addDiary(Connection conn, Diary d, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("addDiary"));

			pstmt.setString(1, d.getTitle());
			pstmt.setInt(2, m.getMember_no());
			pstmt.setDate(3, new java.sql.Date(d.getStart().getTime()));
			pstmt.setDate(4, new java.sql.Date(d.getEnd().getTime()));
			pstmt.setString(5, d.getMemo());
			pstmt.setString(6, d.getBgColor());

			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	}
	
	
//	내가 쓴 동행과 참여한 동행 다이어리에 뿌려 주기
	public List<Diary> myWd(Connection conn, Member m) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Diary> list = new ArrayList();
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("myWd"));
			pstmt.setInt(1, m.getMember_no());
			pstmt.setInt(2, m.getMember_no());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				Diary d = new Diary();
//				d.setDiaryId(rs.getInt("DIARY_ID"));
				d.setTitle(rs.getString("WD_TITLE"));
				d.setMemberNo(rs.getInt("MEMBER_NO"));
				d.setWdNo(rs.getInt("WD_NO"));
				d.setStart(rs.getDate("WD_DATE"));
				d.setEnd(rs.getDate("WD_DATE"));
				d.setMemo(rs.getString("WD_CONTENT"));
//				d.setBgColor(rs.getString("BACKGROUND_COLOR"));
				
				list.add(d);
			}
			
		} catch(SQLException e) {
			
			e.printStackTrace();
		
		} finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		return list; 
		
	}
	
	

}
