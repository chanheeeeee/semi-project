package com.wdh.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.mypage.service.MypageService;

/**
 * Servlet implementation class ReviewDeleteServlet
 */
@WebServlet("/board/reviewdelete.do")
public class ReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String img=request.getParameter("img"); //view에서 보내줄때 이미지이름 넣어주기
		int reviewboardNo = Integer.parseInt(request.getParameter("reviewboardNo"));
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		int wdNo=Integer.parseInt(request.getParameter("boardNo"));
		int result = new MypageService().deleteReview(reviewboardNo);
		String msg="", loc="/board/wdjoinlist.do?memberNo="+memberNo+"&boardNo="+wdNo;
		if(result>0) {
			msg="삭제 성공!";
			String path=getServletContext().getRealPath("/reviewImg"); //삭제안되면 / 넣어주기
			File delFile=new File(path+img);
			if(delFile.exists()) delFile.delete();
		}else {
			msg="삭제 실패!";
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
