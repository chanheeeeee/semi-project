package com.wdh.challenge.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.challenge.model.service.AdminChallengeService;
import com.wdh.member.vo.Member;

/**
 * Servlet implementation class MyChallengeServlet
 */
@WebServlet("/challenge/mychallenge.do")
public class MyChallengeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//나의 챌린지 서블릿
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyChallengeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member loingMember=(Member)request.getSession().getAttribute("loginMember");
		
		List<Map<String,String>> challengeList = new AdminChallengeService().selectMyChallenge(loingMember.getMember_no());
		
		
		if(challengeList.size()>0) {
			request.setAttribute("challengeList", challengeList);
			request.getRequestDispatcher("/views/challenge/startchallenge.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "등록된 챌린지가 없습니다.");
			request.setAttribute("loc", "/challenge/challenge.do");
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
