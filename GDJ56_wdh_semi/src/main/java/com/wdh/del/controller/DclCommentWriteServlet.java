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
 * Servlet implementation class DclCommentWriteServlet
 */
@WebServlet("/cs/commentWrite.do")
public class DclCommentWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //신고하기 답변 서블릿입니다.
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DclCommentWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//댓글에 입력한 데이터 가져오기
		DclComment dcm=DclComment.builder()
				.dclRef(Integer.parseInt(request.getParameter("dclref")))
				.dclCommentContent(request.getParameter("content"))
				.dclCommentLevel(Integer.parseInt(request.getParameter("level")))
				.dclCommentWriter(request.getParameter("commentWriter"))
				.dclCommentRef(Integer.parseInt(request.getParameter("commentref")))
				.build();
	
		int result=new DclService().insertDclComment(dcm);
		String msg="",loc="";
		if(result>0) {
			msg="답변 등록 성공";
		}else {
			msg="답변 등록 실패";
		}
		loc="/dcl/dclView.do?dclNo="+dcm.getDclRef();
		request.setAttribute(msg, msg);
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
