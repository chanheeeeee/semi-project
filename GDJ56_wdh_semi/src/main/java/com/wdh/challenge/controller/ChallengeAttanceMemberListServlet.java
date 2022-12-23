package com.wdh.challenge.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.admin.model.service.AdminService;
import com.wdh.member.vo.Member;

/**
 * Servlet implementation class ChallengeAttanceMemberListServlet
 */
@WebServlet("/admin/challendAttanceMemberList.do")
public class ChallengeAttanceMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallengeAttanceMemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int challengeNo=Integer.parseInt(request.getParameter("challengeNo"));
		
		List<Member> members=new AdminService().challengeAttanceMember(challengeNo);
		request.setAttribute("members", members);
		
		request.getRequestDispatcher("/views/admin/challengeAttanceMember.jsp")
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
