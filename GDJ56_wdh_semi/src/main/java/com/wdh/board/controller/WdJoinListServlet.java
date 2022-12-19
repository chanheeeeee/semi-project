package com.wdh.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.board.service.BoardService1;
import com.wdh.board.vo.WdJoin;

/**
 * Servlet implementation class WdJoinMListServlet
 */
@WebServlet("/board/wdjoinlist.do")
public class WdJoinListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WdJoinListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		int wdNo=Integer.parseInt(request.getParameter("boardNo"));
		List<WdJoin> wj=new BoardService1().selectWdJoinM(memberNo);
		List<WdJoin> wjW=new BoardService1().selectWdJoinW(wdNo);
		request.setAttribute("wdJoins", wj);
		request.setAttribute("boardsW", wjW);
		request.getRequestDispatcher("/board/boardView.do?memberNo="+memberNo+"&boardNo="+wdNo).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
