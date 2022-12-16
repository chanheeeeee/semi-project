package com.wdh.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.board.vo.Board;
import com.wdh.board.vo.ReviewBoard;
import com.wdh.member.service.MemberService;
import com.wdh.member.vo.Member;
import com.wdh.mypage.dao.MypageDao;
import com.wdh.mypage.service.MypageService;
import com.wdh.mypage.vo.Page;

/**
 * Servlet implementation class MycontentServlet
 */
@WebServlet("/mypage/mycontent2.do")
public class MycontentServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MycontentServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = ((Member)request.getSession().getAttribute("loginMember")).getMember_id();
		
		Member m = new MemberService().memberView(id);
		
		// 1. 화면전환 시에 조회하는 페이지번호 and 화면에 그려질 데이터개수 2개를 전달받음
				// 첫 페이지 경우
				int pageNum = 1;
				int numPerpage = 10;
				
				// 페이지번호를 클릭하는 경우
				if(request.getParameter("pageNum") != null && request.getParameter("numPerpage") != null) {
					pageNum = Integer.parseInt(request.getParameter("pageNum"));
					numPerpage = Integer.parseInt(request.getParameter("numPerpage"));
				}
				
				
				// DAO생성
//				MypageDao dao = MypageDao.getInstance();
				
				// 2. pageVO생성
				List<Board> boards = new MypageService().selectBoardList(pageNum, numPerpage, m);
				int total = new MypageService().selectBoardCount(m); // 전체게시글수
				Page page = new Page(pageNum, numPerpage, total);
				
				// 3. 페이지네이션을 화면에 전달
				request.setAttribute("page", page);
				
				// 화면에 가지고 나갈 list를 request에 저장 !!
				request.setAttribute("boards", boards);
		
		
		
		
		RequestDispatcher rd=request.getRequestDispatcher("/views/mypage/mycontent.jsp");
		rd.forward(request, response);
			

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
