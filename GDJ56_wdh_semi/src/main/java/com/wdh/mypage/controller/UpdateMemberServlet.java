package com.wdh.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.member.model.vo.Member;
import com.wdh.member.service.MemberService;

@WebServlet("/mypage/updateMember.do")
public class UpdateMemberServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public UpdateMemberServlet() {
		// TODO Auto-generated constructor stub
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트가 전달한 데이터로 해당 회원 정보를 수정한다.
//		Member m = Member.builder()
//				.userId(request.getParameter("userId"))
//				.userName(request.getParameter("userName"))
//				.age(Integer.parseInt(request.getParameter("age")))
//				.gender(request.getParameter("gender").charAt(0))
//				.email(request.getParameter("email"))
//				.phone(request.getParameter("phone"))
//				.address(request.getParameter("address"))
//				.hobby(request.getParameterValues("hobby"))
//				.build();
//		
//		int result = new MemberService().updateMember(m);
//		
//		String msg = "", loc="";
//		
//		if(result > 0) {
//			
//			msg = "회원정보 수정 완료";
//			loc = "/";
//			//session에 저장된 데이터를 변경해 줘야 한다
//			request.getSession().setAttribute("loginMember", m);
//			
//		} else {
//			
//			msg = "회원정보 수정 실패";
//			loc = "/member/memberView.do?id=" + m.getUserId();
//			
//		}
//		
//		request.setAttribute("msg", msg);
//		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp")
		.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


}
