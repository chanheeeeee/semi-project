package com.wdh.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.board.service.BoardService1;

/**
 * Servlet implementation class WdJoinOutServlet
 */
@WebServlet("/board/wdjoinout.do")
public class WdJoinOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WdJoinOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		int wdNo=Integer.parseInt(request.getParameter("wdNo"));
		int result=new BoardService1().outMember(memberNo, wdNo);
		String msg="", loc="/board/wdjoinlistopen.do?memberNo="+memberNo+"&wdNo="+wdNo;
		if(result>0) {
			msg="거절완료";
		}else {
			msg="거절실패";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msgch.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
