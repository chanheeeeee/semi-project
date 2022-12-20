package com.wdh.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wdh.board.service.BoardService1;
import com.wdh.board.service.BoardService2;
import com.wdh.board.vo.Board;
import com.wdh.board.vo.ReviewBoard;

/**
 * Servlet implementation class AfterWriteBoardEndServlet
 */
@WebServlet("/board/reviewboardend.do")
public class ReviewBoardEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewBoardEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파일 업로드
		if(!ServletFileUpload.isMultipartContent(request)) {
			response.sendRedirect(request.getContextPath());
		}else {
			String path=request.getServletContext().getRealPath("/reviewImg");
			MultipartRequest mr=new MultipartRequest(request,path,1024*1024*10,"UTF-8",new DefaultFileRenamePolicy());
			String img=mr.getFilesystemName("reviewImg");

			int memberNo=Integer.parseInt(mr.getParameter("memberNo"));
			String reviewTitle=mr.getParameter("review_title");
			String reviewContent=mr.getParameter("review_content");
			int wdNo=Integer.parseInt(mr.getParameter("wdNo"));
			double score=(Integer.parseInt(mr.getParameter("score")))/6.0;
			System.out.println(score);
			ReviewBoard rb=ReviewBoard.builder()
					.memberNo(memberNo).reviewTitle(reviewTitle).reviewContent(reviewContent)
					.wdNo(wdNo).reviewScore(score).img(img).build();
			System.out.println(rb);
			int result=new BoardService1().insertAfterBoard(rb);
			Board b=new BoardService2().selectBoard(wdNo);
			new BoardService1().updateGrade(b);
			String msg="", loc="";
			if(result>0) {
				loc="/views/board/reviewboardfinish.jsp";
			}else {
				msg="글 작성 실패!";
				loc="/board/grade.do?boardNo="+wdNo;
			}
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msgch.jsp").forward(request, response);
			}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
