package com.wdh.qs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class QsAlertViewServlet
 */
@WebServlet("/cs/qsAlert.do")
public class QsAlertViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//1대1문의 글 작성 후 알림 페이지로 이동할 서블릿입니다.
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QsAlertViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/cs/qsAlert.jsp").forward(request, response);
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
