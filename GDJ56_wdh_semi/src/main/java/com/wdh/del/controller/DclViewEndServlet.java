package com.wdh.del.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.del.model.service.DclService;
import com.wdh.del.model.vo.DclComment;
import com.wdh.del.model.vo.Declaration;

/**
 * Servlet implementation class DclViewEndServlet
 */
@WebServlet("/cs/dclView.do")
public class DclViewEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //신고하기 상세페이지 연결할 서블릿입니다
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DclViewEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dclNo=Integer.parseInt(request.getParameter("dclNo"));
		System.out.println(dclNo);
		
		Declaration dcl=new DclService().selectDcl(dclNo);
		List<DclComment> list=new DclService().selectDclComment(dclNo);
		System.out.println(list);
		
		request.setAttribute("comment", list);
		request.setAttribute("dcl",dcl);
		request.getRequestDispatcher("/views/cs/dclView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
