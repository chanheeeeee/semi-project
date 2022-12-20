package com.wdh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wdh.member.vo.Member;

/**
 * Servlet implementation class MessageServlet
 */
@WebServlet("/member/messageServlet.do")
public class MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String wdNo = request.getParameter("wdNo");//게시글번호
		String recvMemberNo = request.getParameter("recvMemberNo");//받는사람멤버번호
		String recvMemberNick = request.getParameter("recvMemberNick");//받는사람 닉네임
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginMember");//세션에서 로그인한 정보 가져오기!
		String nickname = m.getMember_nickname();
		request.setAttribute("nickName", nickname);
		request.setAttribute("recvMemberNo", recvMemberNo);
		request.setAttribute("recvMemberNick", recvMemberNick);
		request.setAttribute("wdNo", wdNo);
		
		System.out.println(wdNo);
		System.out.println(recvMemberNo);
		System.out.println(recvMemberNick);
		
		request.getRequestDispatcher("/views/member/message.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
