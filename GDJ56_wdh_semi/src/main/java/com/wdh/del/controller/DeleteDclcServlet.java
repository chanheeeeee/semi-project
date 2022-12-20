package com.wdh.del.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.del.model.service.DclService;
import com.wdh.del.model.vo.DclComment;

/**
 * Servlet implementation class DeleteDclcServlet
 */
@WebServlet("/cs/deleteDclc.do")
public class DeleteDclcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //신고하기 답변 삭제하기 서블릿입니다.
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDclcServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int dclNo=Integer.parseInt(request.getParameter("dclNo"));
		//
		
		
		DclComment dc= DclComment.builder()
				.dclCommentNo(Integer.parseInt(request.getParameter("dclcomment")))
				.build();
		
		String dclcNo=request.getParameter("dclref");
		int result=new DclService().deleteDclc(dc);
		
		String msg="",loc="";
		if(result>0) {
			msg="답변 삭제";
		}else {
			msg="답변 삭제 실패";
		}
		loc="/cs/dclView.do?dclNo="+dclNo;
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
