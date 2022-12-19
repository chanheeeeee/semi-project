package com.wdh.qs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.qs.model.service.QsService;
import com.wdh.qs.model.vo.QsComment;
import com.wdh.qs.model.vo.Question;

/**
 * Servlet implementation class QsViewEndServlet
 */
@WebServlet("/cs/qsView.do")
public class QsViewEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //1대1문의 페이지 상세페이지 연결할 서블릿입니다    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QsViewEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qsNo=Integer.parseInt(request.getParameter("qsNo"));
		Question qs=new QsService().selectQs(qsNo);
		List<QsComment> list=new QsService().selectQsComment(qsNo);
		
		request.setAttribute("comment", qs);
		request.setAttribute("qs", qs);
		request.getRequestDispatcher("/views/cs/qsView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
