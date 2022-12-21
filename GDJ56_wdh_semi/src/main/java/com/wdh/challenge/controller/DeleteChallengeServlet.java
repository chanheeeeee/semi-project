package com.wdh.challenge.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.challenge.model.service.AdminChallengeService;

/**
 * Servlet implementation class DeleteChallengeServlet
 */
@WebServlet("/challenge/deleteChallenge.do")
public class DeleteChallengeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteChallengeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no=Integer.parseInt(request.getParameter("no"));
		int result=new AdminChallengeService().deleteChallenge(no);
		
		String msg="",loc="";
		if(result>0) {
			msg="등록된 챌린지가 삭제 되었습니다";
			loc="/admin/adminChallenge.do";
		}else {
			msg="삭제 실패 하였습니다";
			loc="/admin/adminChallenge.do?ChallengeNo="+no;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
