package com.wdh.qs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.qs.model.service.QsService;
import com.wdh.qs.model.vo.QsComment;

/**
 * Servlet implementation class DeleteQscServlet
 */
@WebServlet("/cs/deleteQsc.do")
public class DeleteQscServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //1대1문의 답변 삭제 서블릿입니다.  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteQscServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qsNo=Integer.parseInt(request.getParameter("qsNo"));
		
		QsComment qsc=QsComment.builder()
				.qsCommentNo(Integer.parseInt(request.getParameter("qscomment")))
				.build();
		
		String qscNo=request.getParameter("qsref");
		int result=new QsService().deleteQsc(qsc);
		
		String msg="",loc="";
		if(result>0) {
			msg="답변 삭제";
		}else {
			msg="답변 삭제 실패";
		}
		loc="/cs/qsView.do?qsNo="+qsNo;
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
