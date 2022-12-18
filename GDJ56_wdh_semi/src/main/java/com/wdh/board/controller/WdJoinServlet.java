package com.wdh.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.board.service.BoardService1;
import com.wdh.board.vo.WdJoin;
import com.wdh.member.service.MemberService;
import com.wdh.member.vo.Member;

/**
 * Servlet implementation class WdJoinServlet
 */
@WebServlet("/board/wdjoin.do")
public class WdJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WdJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		int wdNo=Integer.parseInt(request.getParameter("wdNo"));
		System.out.println(memberNo+wdNo);
		WdJoin wj=WdJoin.builder().memberNo(memberNo).wdNo(wdNo).build();
		System.out.println(wj);
		int result=new BoardService1().wdJoin(wj);
		String msg="", loc="";
		if(result>0) {
			msg="참가신청 완료! 동행해주셔서 감사합니다~!";
			loc="/board/wdjoinlist.do?memberNo="+memberNo+"&boardNo="+wdNo;
		}else {
			msg="참가취소 실패! 다시 시도해주세요!";
			loc="/board/wdjoinlist.do?memberNo="+memberNo+"&boardNo="+wdNo;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msgch.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
