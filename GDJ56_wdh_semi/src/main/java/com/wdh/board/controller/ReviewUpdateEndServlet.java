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
import com.wdh.board.vo.ReviewBoard;

/**
 * Servlet implementation class ReviewUpdateEndServlet
 */
@WebServlet("/board/reviewupdateend.do")
public class ReviewUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파일업로드
		if(!ServletFileUpload.isMultipartContent(request)) {
			response.sendRedirect(request.getContextPath());
		}else {
			String path=request.getServletContext().getRealPath("/reviewImg");
			MultipartRequest mr=new MultipartRequest(request,path,1024*1024*10,"UTF-8",new DefaultFileRenamePolicy());
			String img=mr.getFilesystemName("reviewImg");

			int memberNo=Integer.parseInt(request.getParameter("memberNo"));
			int boardNo=Integer.parseInt(request.getParameter("boardNo"));
			int reviewNo=Integer.parseInt(request.getParameter("reviewNo"));
			double score=(Integer.parseInt(mr.getParameter("score")))/6.0;
			String title=mr.getParameter("review_title");
			String content=mr.getParameter("review_content");
			System.out.println(reviewNo+title+content+memberNo+boardNo);
			ReviewBoard rb=ReviewBoard.builder().reviewTitle(title).reviewContent(content).reviewScore(score).reviewSeq(reviewNo).build();
			System.out.println(rb);
			int result=new BoardService1().updateReview(rb);
			System.out.println(result);
			String msg="", loc="/board/wdjoinlist.do?memberNo="+memberNo+"&boardNo="+boardNo;
			if(result>0) {
				msg="수정성공!";
			}else {
				msg="수정 실패!";
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
