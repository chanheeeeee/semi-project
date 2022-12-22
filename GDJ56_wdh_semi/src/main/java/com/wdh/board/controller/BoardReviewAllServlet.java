package com.wdh.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.board.service.BoardService2;
import com.wdh.board.vo.BoardComment;
import com.wdh.board.vo.ReviewBoard;

/**
 * Servlet implementation class BoardReviewAllServlet
 */
@WebServlet("/board/boardViewReviewAll.do")
public class BoardReviewAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReviewAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int BoardWriterNo=Integer.parseInt(request.getParameter("BoardWriterNo"));
		

		
		//List<ReviewBoard> rbAllList = new BoardService2().selectReviewBoardAll(reviewAllMemberNo, cPage, numPerpage);
		List<ReviewBoard> rbAllList = new BoardService2().selectReviewBoardAll(BoardWriterNo);
		

		
		request.setAttribute("BoardWriterNo", BoardWriterNo);
		request.setAttribute("rbAllList", rbAllList);
		
		request.getRequestDispatcher("/views/board/boardViewReviewAll.jsp?Review=all&BoardWriterNo="+BoardWriterNo).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
