package com.wdh.challenge.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.challenge.model.service.AdminChallengeService;
import com.wdh.member.vo.Member;

/**
 * Servlet implementation class AttendanceChallengeServlet
 */
@WebServlet("/challenge/attanceChallenge.do")
public class AttendanceChallengeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendanceChallengeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int challengeNo=Integer.parseInt(request.getParameter("challenge_no"));
		int memberNo=((Member)request.getSession().getAttribute("loginMember")).getMember_no();
		int result=new AdminChallengeService().attenceChallenge(challengeNo,memberNo);
		if(result>0) {
			request.getRequestDispatcher("/challenge/mychallenge.do").forward(request, response);
		}else {
			request.setAttribute("msg", "신청에 실패했습니다. 다시 시도하세요");
			request.setAttribute("loc", "/challenge/startChallenge.do");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
