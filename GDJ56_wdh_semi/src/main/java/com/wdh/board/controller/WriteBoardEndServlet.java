package com.wdh.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.board.service.BoardService1;
import com.wdh.board.vo.Board;

/**
 * Servlet implementation class WriteBoardEndServlet
 */
@WebServlet("/board/writeboardend.do")
public class WriteBoardEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteBoardEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type=request.getParameter("type");
		String address=request.getParameter("roadFullAddr");
		String count=request.getParameter("count");
		String wdDate=request.getParameter("date");
		String gender=request.getParameter("gender");
		String purpose=request.getParameter("purpose");
		String title=request.getParameter("board_title");
		String content=request.getParameter("board_content");
		
		Board b=Board.builder()
				.wdCategory(type).wdLocation(address).wdCount(Integer.parseInt(wdDate))
				.wdGender(gender).wdPurpose(purpose).wdTitle(title).wdContent(content).build();
		int result=new BoardService1().insertBoard(b);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
