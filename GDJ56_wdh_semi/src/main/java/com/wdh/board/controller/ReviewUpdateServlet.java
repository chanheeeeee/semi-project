package com.wdh.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.board.service.BoardService1;
import com.wdh.board.service.BoardService2;
import com.wdh.board.vo.Board;
import com.wdh.board.vo.ReviewBoard;

/**
 * Servlet implementation class ReviewUpdateServlet
 */
@WebServlet("/board/reviewupdate.do")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int wdNo=Integer.parseInt(request.getParameter("wdNo"));
		int reviewNo=Integer.parseInt(request.getParameter("reviewNo"));
		Board b=new BoardService2().selectBoard(wdNo);
		ReviewBoard rb=new BoardService1().selectReview(reviewNo);
		request.setAttribute("board", b);
		request.setAttribute("reviewBoard", rb);
		request.getRequestDispatcher("/views/board/updateReview.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
