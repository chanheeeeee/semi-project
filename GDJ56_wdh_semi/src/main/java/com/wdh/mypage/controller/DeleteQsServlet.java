package com.wdh.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.mypage.service.MypageService;

/**
 * Servlet implementation class DeleteQsServlet
 */
@WebServlet(name = "DeleteMyQsServlet", urlPatterns = { "/mypage/deleteQs.do" })
public class DeleteQsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		int qsNo = Integer.parseInt(request.getParameter("qsNo"));
				
		int result = new MypageService().deleteQs(qsNo);
		
		String msg="", loc="";
		
		if(result>0) {
			
			msg="삭제 성공!";
			loc="/mypage/mycontent.do";
			
		}else {
			
			msg="삭제 실패!";
			loc="/mypage/mycontent.do";
			
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
