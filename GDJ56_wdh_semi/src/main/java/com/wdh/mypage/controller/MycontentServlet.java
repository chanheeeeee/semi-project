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
import com.wdh.del.model.vo.Declaration;
import com.wdh.member.service.MemberService;
import com.wdh.member.vo.Member;
import com.wdh.mypage.service.MypageService;
import com.wdh.qs.model.vo.Question;

/**
 * Servlet implementation class MycontentServlet
 */
@WebServlet("/mypage/mycontent.do")
public class MycontentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MycontentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = ((Member)request.getSession().getAttribute("loginMember")).getMember_id();
		
		Member m = new MemberService().memberView(id);
		
		int cPage;
		int numPerpage=10;
		
		try {
			
			cPage=Integer.parseInt(request.getParameter("cPage"));
		
		} catch(NumberFormatException e) {
		
			cPage=1;
		
		}
		
		
		List<Board> boards = new MypageService().selectBoardList(cPage, numPerpage, m);
		
		List<Board> boardsWd = new MypageService().selectBoardWdList(cPage, numPerpage, m);
		
		List<ReviewBoard> reviews = new MypageService().selectBoardListR(cPage, numPerpage, m);
		
		List<Question> qs = new MypageService().selectQsList(cPage, numPerpage, m);
		
		List<Declaration> dcl = new MypageService().selectDclList(cPage, numPerpage, m);
//		
//
//		int totalData=new MypageService().selectBoardCount(m);
//		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
//		
//		
//		String pageBar="";
//		int pageBarSize=5;
//		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
//		int pageEnd=pageNo+pageBarSize-1;
//		
//		if(pageNo==1) {
//			pageBar+="<span>[이전]</span>";
//		}else {
//			pageBar+="<a href='"+request.getRequestURL()
//			+ "?cPage="+(pageNo-1)+"'>[이전]</a>";
//		}
//		while(!(pageNo>pageEnd||pageNo>totalPage)) {
//			if(cPage==pageNo) {
//				pageBar+="<span>"+pageNo+"</span>";
//			}else {
//				pageBar+="<a href='"+request.getRequestURL()
//				+ "?cPage="+pageNo+"'>"+pageNo+"</a>";
//			}
//			pageNo++;
//		}
//		if(pageNo>totalPage) {
//			pageBar+="<span>[다음]</span>";
//		}else {
//			pageBar+="<a href='"+request.getRequestURL()
//			+"?cPage="+pageNo+"'>[다음]</a>";
//		}
//		
//		request.setAttribute("pageBar", pageBar);
		request.setAttribute("boards", boards);
		
		request.setAttribute("boardsWd", boardsWd);
		

		request.setAttribute("reviews", reviews);
		
		request.setAttribute("qs", qs);
		
		request.setAttribute("dcl", dcl);
		
		
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
