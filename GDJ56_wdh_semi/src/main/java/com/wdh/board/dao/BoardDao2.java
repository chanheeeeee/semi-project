package com.wdh.board.dao;

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

import com.wdh.board.vo.Board;
import com.wdh.board.vo.BoardComment;
import com.wdh.board.vo.ReviewBoard;
import com.wdh.member.dao.MemberDao;
import com.wdh.member.vo.Member;

public class BoardDao2 {
	
	private Properties sql = new Properties();

	public BoardDao2() {
		String path = BoardDao2.class.getResource("/sql/board/board_sql2.properties").getPath();
		try {
			sql.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Board> selectBoardList(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectBoardList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(getBoard(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int selectBoardCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectBoardCount"));
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
	
	public List<Board> selectBoardList(Connection conn, String where, String searchKeyword, int cPage, int numPerpage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList();
		String query=sql.getProperty("selectBoardListCol");
		query=query.replace("$COL", where);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(getBoard(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	
	public Board selectBoard(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board b = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectBoard"));
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				b = getBoard(rs);
				b.setMember(MemberDao.getMember(rs));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return b;
	}
	
	public List<BoardComment> selectBoardComment(Connection conn, int boardNo){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardComment> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectBoardComment"));
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//list.add(getBoardComment(rs));
				BoardComment bc = getBoardComment(rs);
				bc.setMember(MemberDao.getMember(rs));
				list.add(bc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<ReviewBoard> selectReviewBoard(Connection conn, int boardNo){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReviewBoard> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectReviewBoard"));
			pstmt.setInt(1, boardNo);
			pstmt.setInt(2, 1);
			pstmt.setInt(3, 5);
			rs = pstmt.executeQuery();
			while(rs.next()) list.add(getReviewBoard(rs));
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int insertBoardComment(Connection conn, BoardComment bc) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertComment"));
			
			pstmt.setString(1, bc.getWcContent());
			pstmt.setInt(2, bc.getWcNo());
			pstmt.setInt(3, bc.getMemberNo());
			pstmt.setString(4, bc.getWdCommentRef()==0?null:String.valueOf(bc.getWdCommentRef())); //댓글참조번호
			pstmt.setInt(5, bc.getWdCommentLev());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int deleteBoardComment(Connection conn, BoardComment bc) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("deleteBoardComment"));
			pstmt.setInt(1, bc.getCommentNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	
	
	
	//공통으로 사용 
	public static Board getBoard(ResultSet rs) throws SQLException{
		return Board.builder()
				.wdNo(rs.getInt("WD_NO"))
				.wdTitle(rs.getString("WD_TITLE"))
				.wdLocation(rs.getString("WD_LOCATION"))
				.wdCategory(rs.getString("WD_CATEGORY"))
				.wdGender(rs.getString("WD_GENDER"))
				.wdContent(rs.getString("WD_CONTENT"))
				.wdDate(rs.getDate("WD_DATE"))
				.wdCount(rs.getInt("WD_COUNT"))
				.wdTime(rs.getDate("WD_TIME"))
				.memberNo(rs.getInt("MEMBER_NO"))
				.wdPurpose(rs.getString("WD_PURPOSE"))
				.build();
	}
	
	public static BoardComment getBoardComment(ResultSet rs) throws SQLException{
		return BoardComment.builder()
				.commentNo(rs.getInt("COMMENT_NO"))
				.wcContent(rs.getString("WC_CONTENT"))
				.wcDate(rs.getDate("WC_DATE"))
				.wcNo(rs.getInt("WC_NO"))
				.memberNo(rs.getInt("MEMBER_NO"))
				.wdCommentRef(rs.getInt("WD_COMMENT_REF"))
				.wdCommentLev(rs.getInt("WD_COMMENT_LEV"))
				.build();
	}
	
	public static ReviewBoard getReviewBoard(ResultSet rs) throws SQLException{
		return ReviewBoard.builder()
				.reviewSeq(rs.getInt("REVIEW_SEQ"))
				.memberNo(rs.getInt("MEMBER_NO"))
				.reviewTitle(rs.getString("REVIEW_TITLE"))
				.reviewContent(rs.getString("REVIEW_CONTENT"))
				.reviewDate(rs.getDate("REVIEW_DATE"))
				.wdNo(rs.getInt("WD_NO"))
				.reviewScore(rs.getDouble("REVIEW_SCORE"))
				.img(rs.getString("IMG"))
				.build();
	}

}
