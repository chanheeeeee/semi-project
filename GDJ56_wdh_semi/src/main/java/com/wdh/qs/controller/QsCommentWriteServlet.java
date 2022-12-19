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
 * Servlet implementation class QsCommentWriteServlet
 */
@WebServlet("/cs/qscommentWrite.do")
public class QsCommentWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //1대1문의 답변 서블릿입니다.
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QsCommentWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//답변에 입력한 데이터를 가져오기
		QsComment qsc=QsComment.builder()
				.qsRef(Integer.parseInt(request.getParameter("qsref")))
				.qsCommentContent(request.getParameter("content"))
				.qsCommentLevel(Integer.parseInt(request.getParameter("level")))
				.qsCommentWriter(request.getParameter("commentWriter"))
				.qsCommentRef(Integer.parseInt(request.getParameter("commentref")))
				.build();
		
		int result=new QsService().insertQsComment(qsc);
		String msg="",loc="";
		if(result>0) {
			msg="문의 답변 성공";
		}else {
			msg="문의 답변 실패";
		}
		loc="/cs/qsView.do?qsNo="+qsc.getQsRef();
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
