package com.wdh.member.dao;

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

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import com.wdh.member.vo.Member;
import com.wdh.member.vo.Message;

public class MemberDao {

	private Properties sql = new Properties();
	
	public MemberDao() {
		try {
			String path=MemberDao.class.getResource("/sql/member/member_sql.properties").getPath();
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public Member loginAction(Connection conn, String loginId, String password) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("login"));
			pstmt.setString(1, loginId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = getMember(rs);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return m;
	}

	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertMember"));

			pstmt.setString(1, m.getMember_id());
			pstmt.setString(2, m.getMember_nickname());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getPassword());
			pstmt.setString(5, String.valueOf(m.getGender()));
			pstmt.setDate(6, new java.sql.Date(m.getBirth().getTime()));
			pstmt.setString(7, m.getEmail());
			pstmt.setString(8, m.getPhone());
			pstmt.setString(9, m.getAddress());
			pstmt.setInt(10, m.getGrade());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Member searchMemberId(Connection conn, String name, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;

		try {
			pstmt = conn.prepareStatement(sql.getProperty("searchId"));
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = new Member();
				m.setMember_id(rs.getString("MEMBER_ID"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	

	//멤버 정보 - 아이디 중복, 뷰
	public Member memberView(Connection conn, String member_id) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("memberView"));
			pstmt.setString(1, member_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = getMember(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	
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


	
	//닉네임 중복
	public Member NicknameDuplicate(Connection conn, String nickname) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("nickDuplicate"));
			pstmt.setString(1, nickname);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = getMember(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

	
	//비밀번호 찾기-db값 일치 확인
	public String authSendPw(Connection conn, String member_id, String name, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String password = null;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("authSendPW"));
			pstmt.setString(1, member_id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				password = rs.getString("MEMBER_PASSWORD");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return password;
		
	}
	
		

	public static Member getMember(ResultSet rs) throws SQLException {

		Member m = new Member();
		
		m.setMember_no(rs.getInt("MEMBER_NO"));
		m.setMember_id(rs.getString("MEMBER_ID")); 
		m.setMember_nickname(rs.getString("MEMBER_NICKNAME"));
		m.setName(rs.getString("MEMBER_NAME"));
		m.setPassword(rs.getString("MEMBER_PASSWORD"));
		m.setGender(rs.getString("GENDER").charAt(0));
		m.setBirth(rs.getDate("BIRTH"));
		m.setEmail(rs.getString("EMAIL"));
		m.setPhone(rs.getString("PHONE"));
		m.setAddress(rs.getString("ADDRESS"));
		m.setGrade(rs.getInt("GRADE"));
		m.setProfile(rs.getString("PROFILE"));
		return m;
	}


	public Member searchMember(Connection conn, int memberNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchMember"));
			pstmt.setInt(1, memberNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=getMember(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}

	//비밀번호 재설정
	public int rePassword(Connection conn, String member_id, String newpw) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("newPw"));
			pstmt.setString(1, newpw);
			pstmt.setString(2, member_id);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	//쪽지보내기
	public int sendMessage(Connection conn, String wdNo, String receiveMemberNo, String content, int msg_writer) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("sendMessage"));
			pstmt.setInt(1, Integer.parseInt(wdNo));
			pstmt.setInt(2, Integer.parseInt(receiveMemberNo));
			pstmt.setString(3, content);
			pstmt.setInt(4, msg_writer);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	//쪽지확인리스트
	public List<Message> messageList(Connection conn, int msg_writer) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Message> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("messageList"));
			pstmt.setInt(1, msg_writer);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Message m = Message.builder()
				.msg_no(rs.getInt("MSG_NO"))
				.writer_nickname(rs.getString("MEMBER_NICKNAME"))
				.msg_content(rs.getString("MSG_CONTENT"))
				.msg_date(rs.getString("MSG_DT"))
				.read_yn(rs.getString("READ_YN").charAt(0))
				.wdNo(rs.getInt("WD_NO"))
				.msg_writer(rs.getInt("MSG_WRITER"))
				.build();
				
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	//쪽지삭제
	public int deleteMessage(Connection conn, int msg_no) {
		PreparedStatement pstmt = null;
		int result=0;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("deleteMessage"));
			pstmt.setInt(1, msg_no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public int readYn(Connection conn, int msgNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("reSendMessage"));
			pstmt.setInt(1, msgNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public int readCount(Connection conn, int mem_no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0; 
			
		try {
			pstmt = conn.prepareStatement(sql.getProperty("readCount"));
			pstmt.setInt(1, mem_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt("CNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
