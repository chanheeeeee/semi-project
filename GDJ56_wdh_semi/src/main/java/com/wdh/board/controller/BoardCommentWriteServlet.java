package com.wdh.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.board.service.BoardService2;
import com.wdh.board.vo.BoardComment;

/**
 * Servlet implementation class BoardCommentWriteServlet
 */
@WebServlet("/board/commentWrite.do")
public class BoardCommentWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardComment bcm=BoardComment.builder()
				.wcNo(Integer.parseInt(request.getParameter("boardref")))
				.wcContent(request.getParameter("content"))
				.wdCommentLev(Integer.parseInt(request.getParameter("level")))
				.memberNo(Integer.parseInt(request.getParameter("commentWriter")))
				.wdCommentRef(Integer.parseInt(request.getParameter("commentref")))
				.build();
		
		int result=new BoardService2().insertBoardComment(bcm);
		
		String msg="",loc="";
		if(result>0) {
			msg="댓글등록 성공";
		}else {
			msg="댓글등록 실패";
		}
		
		loc="/board/boardView.do?boardNo="+bcm.getWcNo(); //getBoardRef값이 곧 boardNo값 이니까
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		RequestDispatcher rd=request.getRequestDispatcher("/views/common/msg.jsp");
		rd.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
