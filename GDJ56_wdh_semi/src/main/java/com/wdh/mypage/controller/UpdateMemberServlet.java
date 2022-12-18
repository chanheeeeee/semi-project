package com.wdh.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.member.service.MemberService;
import com.wdh.member.vo.Member;

@WebServlet(name = "mypageUpdatePassword", urlPatterns = "/mypage/updateMember.do")
public class UpdateMemberServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public UpdateMemberServlet() {
		// TODO Auto-generated constructor stub
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
	
		String id = ((Member)request.getSession().getAttribute("loginMember")).getMember_id();
		
		String pass = request.getParameter("pass");
		
		Member m = new MemberService().memberView(id);

		
		String msg = "", loc="";
		
		
		if(pass.equals(m.getPassword())) {
			
			request.getRequestDispatcher("/views/mypage/profile.jsp")
					.forward(request, response);
			
		} else {
			
			msg = "비밀번호가 맞지 않습니다. 다시 입력해 주세요.";
			loc = "/mypage/lockscreen.do";
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			
			request.getRequestDispatcher("/views/common/msgm.jsp")
			.forward(request, response);
			
		}
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


}
