package com.wdh.board.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.board.service.BoardService1;
import com.wdh.board.vo.Board;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/board/boardupdateend.do")
public class BoardUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String wdDate=request.getParameter("date");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date wdDate1 = null;
		try {
			wdDate1 = sdf.parse(wdDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String wdTitle=request.getParameter("board_title");
		String wdLocation=request.getParameter("roadFullAddr");
		String wdCategory=request.getParameter("type");
		String wdGender=request.getParameter("gender");
		String wdContent=request.getParameter("board_content");
		int wdCount=Integer.parseInt(request.getParameter("count"));
		String wdPurpose=request.getParameter("purpose");
		int wdNo=Integer.parseInt(request.getParameter("wd_no"));
		System.out.println(wdTitle+wdLocation+wdCategory+wdGender+wdContent+wdDate+wdCount+wdPurpose+wdNo);
		Board b=Board.builder()
				.wdTitle(wdTitle).wdLocation(wdLocation).wdCategory(wdCategory)
				.wdGender(wdGender).wdContent(wdContent).wdDate(wdDate1)
				.wdCount(wdCount).wdPurpose(wdPurpose).wdPurpose(wdPurpose).wdNo(wdNo).build();
		System.out.println(b);
		int result=new BoardService1().updateBoard(b);
		String msg="", loc="";
		if(result>0) {
			loc="/views/board/finish.jsp";
		}else {
			msg="수정 실패!";
			loc="/board/boardView.do";
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
