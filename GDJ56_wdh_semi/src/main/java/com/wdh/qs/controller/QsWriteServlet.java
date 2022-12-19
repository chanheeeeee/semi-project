package com.wdh.qs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class QsWriteServlet
 */
@WebServlet("/cs/writeQs.do")
public class QsWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //메인 1대1문의 헤더 클릭시 작성하기로 바로 넘어갈 페이지 입니다.
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QsWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/cs/subQs.jsp").forward(request, response);
	
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
