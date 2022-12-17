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
		
		int type = Integer.parseInt(request.getParameter("type"));
		
		System.out.println(type);
		
		Member m = new MemberService().memberView(id);
		
		int cPage;
		int numPerpage=10;
		
		int totalData=0;
		
		try {
			
			cPage=Integer.parseInt(request.getParameter("cPage"));
		
		} catch(NumberFormatException e) {
		
			cPage=1;
		
		}		
		
		List<Board> boards = new MypageService().selectBoardList(cPage, numPerpage, m);
		
		List<ReviewBoard> reviews = new MypageService().selectBoardListR(cPage, numPerpage, m);
		
		List<Question> qs = new MypageService().selectQsList(cPage, numPerpage, m);
		
		List<Declaration> dcl = new MypageService().selectDclList(cPage, numPerpage, m);
		
		if(type==1) {
			
			totalData=new MypageService().selectBoardCount(m);
			
		} else if (type==2) {
			
			totalData=new MypageService().selectBoardCountR(m);
			
		} else if (type==3) {
			
			totalData=new MypageService().selectQsCount(m);
			
		} else if (type==4) {
			
			totalData=new MypageService().selectDclCount(m);
			
		} 
		
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		
		String pageBar="";
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<a class=\"page-link\" href=\"#\">&laquo;</a>";
		}else {
			pageBar+="<a class=\"page-link\" href='"+request.getRequestURL()
			+ "?type=" + type + "&cPage=" +(pageNo-1)+"'>&laquo</a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<a class=\"page-link\">"+pageNo+"</a>";
			}else {
				pageBar+="<a class=\"page-link\" href='"+request.getRequestURL()
				+ "?type=" + type + "&cPage=" +pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<a class=\"page-link\" href=\"#\">&raquo;</a>";
		}else {
			pageBar+="<a class=\"page-link\" href='"+request.getRequestURL()
			+ "?type=" + type + "&cPage=" +pageNo+"'>&raquo;</a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("boards", boards);
		

		request.setAttribute("reviews", reviews);
		
		request.setAttribute("qs", qs);
		
		request.setAttribute("dcl", dcl);
		
		request.setAttribute("type", type);
		
		
		RequestDispatcher rd=request.getRequestDispatcher("/views/mypage/mycontent3.jsp");
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
