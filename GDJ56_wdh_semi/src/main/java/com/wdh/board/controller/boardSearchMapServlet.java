package com.wdh.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.board.service.BoardService2;
import com.wdh.board.vo.Board;


/**
 * Servlet implementation class boardSearchMap
 */
@WebServlet("/board/boardSearchMapServlet.do")
public class boardSearchMapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public boardSearchMapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//addressSearch
		//주소를 좌표로 변환해줄 디비 가져오기 wdLocation
		List<Board> list = new BoardService2().selectBoardList(); //주소 가져오는 것도 마감된 건 걸러줘야 한다 WHERE절 추가해야함
		
		request.setAttribute("locList", list);
		
		request.getRequestDispatcher("/views/board/map3.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
