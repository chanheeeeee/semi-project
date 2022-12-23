package com.wdh.challenge.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.challenge.model.service.AdminChallengeService;
import com.wdh.challenge.model.vo.Challenge2;

/**
 * Servlet implementation class AdminCallengeMemberResultServler
 */
@WebServlet("/admin/callengeMemberResult.do")
public class AdminCallengeMemberResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCallengeMemberResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int challengeNo=Integer.parseInt(request.getParameter("challengeNo"));
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		
		List<Challenge2> challenger=new AdminChallengeService().callengeMemberResult(challengeNo);
		request.setAttribute("challenge", challenger);
		
		request.getRequestDispatcher("/views/challenge/callengeMemberResult.jsp")
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
