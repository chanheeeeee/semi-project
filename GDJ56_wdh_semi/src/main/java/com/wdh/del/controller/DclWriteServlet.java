package com.wdh.del.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DclWriteServlet
 */
@WebServlet("/cs/dclWrite.do")
public class DclWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //고객센터 - 신고하기를 눌렀을때 연결할 페이지 입니다.
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DclWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/cs/subDcl.jsp").forward(request, response);
	
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
