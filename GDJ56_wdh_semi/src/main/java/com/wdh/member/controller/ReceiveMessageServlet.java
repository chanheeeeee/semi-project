package com.wdh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wdh.member.service.MemberService;
import com.wdh.member.vo.Member;

/**
 * Servlet implementation class ReceiveMessageServlet
 */
@WebServlet("/recievemessage.do")
public class ReceiveMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceiveMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//message테이블의 readYn중에서 N일때의 갯수만 가져오면! 메세지 갯수 파악 가능!
		
		HttpSession session = request.getSession();//로그인한사람=receive_member_no
		Member m = (Member)session.getAttribute("loginMember");//세션에서 로그인한 정보 가져오기!
		int mem_no = m.getMember_no();
		
		int readYn = new MemberService().readCount(mem_no);
		
		response.setContentType("text/csv;charset=utf-8");
		
		response.getWriter().print(readYn);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
