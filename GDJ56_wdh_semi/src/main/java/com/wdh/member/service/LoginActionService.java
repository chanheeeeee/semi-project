package com.wdh.member.service;

import static com.wdh.common.JDBCTemplate.close;
import static com.wdh.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.wdh.member.dao.LoginActionDao;
import com.wdh.member.vo.Member;

public class LoginActionService {
	
	/**
	 * 로그인 액션
	 * @param loginId
	 * @param password
	 */
	public Member loginAction(String loginId, String password) {
		Connection conn = getConnection();
		LoginActionDao dao = new LoginActionDao();
		Member m = dao.loginAction(conn, loginId, password);
		close(conn);
		
		return m;
	}

}
