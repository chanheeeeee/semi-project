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
		String purpose = request.getParameter("purpose");
		String[] categoryArr = request.getParameterValues("category");
		String[] dateArr = request.getParameterValues("date");
		
		
		
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
		
		//System.out.println("넘어온값 : "+"젠더:"+gender+" 목적:"+purpose+" 종목:"+category);
		
		//변수타입확인System.out.println(gender.getClass().getName());
		
		String sql = "";
		String where = " WHERE 1=1 #COL"; //$COL
		
		if(searchKeyword!=null) {
			sql += "and WD_CONTENT LIKE '%"+searchKeyword+"%'";
		}
		
		if(gender!=null) {
			if(gender.equals("A")) {
				sql += "ORDER BY DECODE(WD_GENDER, 'A',1)";//무관 우선 정렬+여,남 모두
			}else { 
				sql += "and WD_GENDER LIKE '%"+gender+"%'";
			}
			 
			//System.out.println(sql);
		}
		if(purpose!=null) {
			sql += "and WD_PURPOSE LIKE '%"+purpose+"%'";
		}
		
		if(categoryArr!=null) { 
			String category = "";
			for(String c : categoryArr) {	category += c+"|";	}
			category = category.substring(0, category.length()-1);//System.out.println(category);

			sql += "and REGEXP_LIKE( WD_CATEGORY, '"+category+"')";
		}
		
		if(dateArr!=null) { 
			/*
			 * String date = ""; for(String d : dateArr) { date += d+"|"; }
			 * System.out.println(date);
			 */

			//sql += "and WD_PURPOSE LIKE '%"+값+"%'";
			//SELECT * FROM (SELECT ROWNUM AS RNUM, M.* FROM(SELECT * FROM WRITEBOARD WD_DATE BETWEEN "2020-06-01" AND "2020-06-07")M) WHERE RNUM BETWEEN ? AND ?
		}
		 
		where = where.replace("#COL", sql);
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
			pageBar += "<span>🡸</span>,";
		}else {
			pageBar += "<a href='"+request.getRequestURL()+"?cPage="+(pageNo-1)+"'>🡸</a>,";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar += "<span>"+pageNo+"</span>,";
			}else {
				pageBar += "<a href='"+request.getRequestURL()+"?cPage="+pageNo+"'>"+pageNo+"</a>,";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar += "<span>🡺</span>";
		}else {
			pageBar += "<a href='"+request.getRequestURL()+"?cPage="+pageNo+"'>🡺</a>";
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
