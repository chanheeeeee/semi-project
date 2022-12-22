package com.wdh.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.board.service.BoardService1;
import com.wdh.board.service.BoardService2;
import com.wdh.board.vo.Board;
import com.wdh.board.vo.ReviewBoard;
import com.wdh.mypage.service.MypageService;

/**
 * Servlet implementation class DeleteReviewServlet
 */
@WebServlet("/mypage/deleteReview.do")
public class DeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reviewboardNo = Integer.parseInt(request.getParameter("reviewboardNo"));
		
		int result = new MypageService().deleteReview(reviewboardNo);
		
		Board b=new BoardService2().selectBoard(reviewboardNo);
        new BoardService1().updateGrade(b);
		
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
