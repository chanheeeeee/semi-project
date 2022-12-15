package com.wdh.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.board.service.BoardService2;
import com.wdh.board.vo.Board;

/**
 * Servlet implementation class SearchBoard
 */
@WebServlet("/board/boardSearch.do")
public class BoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchKeyword = request.getParameter("searchKeyword");
		String gender = request.getParameter("gender");
		String goal = request.getParameter("goal");
		String event = request.getParameter("event");
		
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1; //pageNo
		}

		int numPerpage;
		try {
			numPerpage=Integer.parseInt(request.getParameter("numPerpage"));
		}catch(NumberFormatException e) {
			numPerpage=12;
		}
		
		String sql = "";
		String where = " 1=1 $COL"; //where 1=1 $COL
		
		if(searchKeyword!=null) {
			sql += "and WD_CONTENT LIKE '%"+searchKeyword+"%'";
		}
		if(gender!=null) {
			sql += "and WD_GENDER LIKE '%"+gender+"%'";
		}
		if(goal!=null) {
			sql += "and WD_PURPOSE LIKE '%"+goal+"%'";
		}
		
		if(event!=null) { 
			sql += "and WD_CATEGORY LIKE '%"+event+"%'";
		}
		 
		where = where.replace("$COL", sql);
		System.out.println(where);
		
		
		
		
		
		
		
		List<Board> list = new BoardService2().selectBoardList(where, searchKeyword, cPage, numPerpage);
		//지도, 날짜도
		
		int totalData = new BoardService2().selectBoardCount();
		
		int pageBarSize = 5;
		String pageBar = "";
		
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
				
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1){
			pageBar += "<span>[이전]</span>";
		}else {
			pageBar += "<a href='"+request.getRequestURL()+"?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar += "<span>"+pageNo+"</span>";
			}else {
				pageBar += "<a href='"+request.getRequestURL()+"?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar += "<span>[다음]</span>";
		}else {
			pageBar += "<a href='"+request.getRequestURL()+"?cPage="+pageNo+"'>[다음]</a>";
		}
		
		request.setAttribute("boards", list);
		request.setAttribute("pageBar", pageBar);
		
		
		request.getRequestDispatcher("/views/board/boardList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
