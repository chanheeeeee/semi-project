package com.wdh.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.board.service.BoardService1;
import com.wdh.board.service.BoardService2;
import com.wdh.board.vo.Board;
import com.wdh.board.vo.WdJoin;
import com.wdh.member.vo.Member;

/**
 * Servlet implementation class WdJoinListOpenServlet
 */
@WebServlet("/board/wdjoinlistopen.do")
public class WdJoinListOpenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WdJoinListOpenServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		int wdNo=Integer.parseInt(request.getParameter("wdNo"));
		List<Member> m=new BoardService1().JoinMember(wdNo);
		List<WdJoin> wjW=new BoardService1().selectWdJoinW(wdNo);
		Board b=new BoardService2().selectBoard(wdNo);
		System.out.println(m);
		String msg="", loc="";
		if(m==null) {
			msg="참가인원이 없습니다";
			loc="/board/wdjoinlist.do?memberNo="+memberNo+"&boardNo="+wdNo;
		}else {
			request.setAttribute("joinMember", m);
			request.setAttribute("WdJoin", wjW);
			request.setAttribute("board", b);
			request.getRequestDispatcher("/views/board/wdJoinList.jsp?loginMember="+memberNo).forward(request, response);		
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
