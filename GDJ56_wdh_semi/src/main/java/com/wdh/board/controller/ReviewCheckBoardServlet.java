package com.wdh.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.board.service.BoardService1;
import com.wdh.board.service.BoardService2;
import com.wdh.board.vo.Board;
import com.wdh.member.vo.Member;
import com.wdh.mypage.service.MypageService;

/**
 * Servlet implementation class ReviewCheckBoardServlet
 */
@WebServlet("/board/reviewcheckboard.do")
public class ReviewCheckBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewCheckBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int wdNo=Integer.parseInt(request.getParameter("boardNo"));
		Board b=new BoardService2().selectBoard(wdNo);
		Member m=new BoardService1().selectMember(wdNo);
		
		System.out.println(m);
		request.setAttribute("board", b);
		request.setAttribute("member", m);
		request.getRequestDispatcher("/views/board/reviewboardck.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
