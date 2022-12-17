package com.wdh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.wdh.common.EmailSendModule;
import com.wdh.member.service.MemberService;

/**
 * Servlet implementation class AuthSendCodeServlet
 */
@WebServlet("/member/authSendCode.do")
public class AuthSendCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthSendCodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_id = request.getParameter("member_id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		//성공여부를 알기 위해서 플래그값을 넣음
		String isSuccess = "N";
		String password = new MemberService().authSendPw(member_id, name, email);
		String authNum = null;
		if(password!=null) {
			//인증번호 발송
			authNum = EmailSendModule.gmailSend(email);
			//인증번호 메일 발송이 성공했다면 isSuccess 값을 Y로 변경
			isSuccess = "Y";
		}else {
			System.out.println("계정이 없습니다.");
		}
		
		JSONObject o = new JSONObject();
		o.put("isSuccess", isSuccess);
		o.put("password", password);
		o.put("authNum", authNum);
		
		response.setContentType("application/json;cahrset=utf-8");
		
		response.getWriter().print(o);
		
		
		
		
		
	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
