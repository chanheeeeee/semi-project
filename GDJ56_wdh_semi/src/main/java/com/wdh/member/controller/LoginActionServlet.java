package com.wdh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.wdh.member.service.MemberService;
import com.wdh.member.vo.Member;

/**
 * Servlet implementation class LoginActionServlet
 */
@WebServlet(name = "login", urlPatterns = "/loginAction.do")
public class LoginActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginId = request.getParameter("loginId");
		String password = request.getParameter("password");
		
		Member m = new MemberService().loginAction(loginId, password);
		
		/**
		 * 로그인이 되는 조건
		 * 1. ID가 같아야함
		 * 2. PASSWORD가 같아야함
		 */
		//일치하지 않는 아이디가 없는 경우
		String loginYn = "N";
		if(m == null) {
			System.out.println("아이디 없음");
		} else {	// 아이디 일치
			if(!m.getPassword().equals(password)) {
				System.out.println("비밀번호 불일치");
			} else {
				//로그인 성공하면 세션 값 적용
				HttpSession session = request.getSession();
				session.setAttribute("loginMember", m);
				//로그인 성공하면 loginYn 값을 "Y" 변경
				loginYn = "Y";
			}
		}
		
		//Ajax 통신 결과를 전송
		JSONObject jObj = new JSONObject();
		jObj.put("loginYn", loginYn);

		response.setContentType("application/json;charset=utf-8");//제이슨파일 방식으로 보낸다!
		//Gson 라이브러리 이용해서 데이터 전송하기
		Gson g = new Gson();
		//지슨 라이브러리에서 제공하는 toJson() 메소드 이용->지슨을 제이슨으로 변경해주는것!
		g.toJson(jObj, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
