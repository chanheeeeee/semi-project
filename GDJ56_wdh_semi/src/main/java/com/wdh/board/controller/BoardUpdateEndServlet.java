package com.wdh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String wdTitle=request.getParameter("board_title");
		String wdLocation=request.getParameter("roadFullAddr");
		String wdCategory=request.getParameter("type");
		String wdGender=request.getParameter("gender");
		String wdContent=request.getParameter("board_content");
		String wdDate=request.getParameter("date");
		int wdCount=Integer.parseInt(request.getParameter("count"));
		String wdPurpose=request.getParameter("purpose");
		int wdNo=Integer.parseInt(request.getParameter("wd_no"));
		System.out.println(wdTitle+wdLocation+wdCategory+wdGender+wdContent+wdDate+wdCount+wdPurpose+wdNo);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
