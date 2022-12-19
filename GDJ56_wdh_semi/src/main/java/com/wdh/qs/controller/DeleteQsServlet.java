package com.wdh.qs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.qs.model.service.QsService;

/**
 * Servlet implementation class DeleteQsServlet
 */
@WebServlet("/cs/deleteQs.do")
public class DeleteQsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //1대1문의 삭제하기 서블릿
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteQsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no=Integer.parseInt(request.getParameter("no"));
		int result=new QsService().deleteQs(no);
		String msg="",loc="";
		if(result>0) {
			msg="1대1문의 글 삭제";
			loc="/admin/adminQs.do";
		}else {
			msg="글 삭제 실패";
			loc="/admin/adminQs.do?qsNo="+no;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msgm.jsp").forward(request, response);
		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
