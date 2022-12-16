package com.wdh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.board.service.BoardService2;
import com.wdh.board.vo.BoardComment;


/**
 * Servlet implementation class BoardCommentDeleteServlet
 */
@WebServlet("/board/commentDelete.do")
public class BoardCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardComment bc = BoardComment.builder()
				.commentNo(Integer.parseInt(request.getParameter("boardcomment")))
				.build();
		
		String wdNo = request.getParameter("boardref");
		
		int result = new BoardService2().deleteBoardComment(bc);
		
		String msg="",loc="";
		if(result>0) {
			msg="삭제 완료";
		}else {
			msg="삭제 실패";
		}
		
		loc="/board/boardView.do?boardNo="+wdNo; //보고 있는 게시글위치
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
