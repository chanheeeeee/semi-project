package com.wdh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.wdh.common.EmailSendModule;

/**
 * Servlet implementation class JoinEmailServlet
 */
@WebServlet("/member/joinEmailservlet.do")
public class JoinEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String authNum = null;
		String isSuccess = "N";
		System.out.println(email);
		
		if(email!=null) {
			//인증번호 발송
			authNum = EmailSendModule.gmailSend(email);
			//인증번호 메일 발송이 성공했다면 isSuccess 값을 Y로 변경
			isSuccess = "Y";
		}else {
			System.out.println("계정이 없습니다.");
		}
		
		JSONObject o = new JSONObject();
		o.put("isSuccess", isSuccess);
		o.put("authNum", authNum);
		
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
