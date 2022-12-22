package com.wdh.board.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.board.service.BoardService1;
import com.wdh.board.vo.Board;
import com.wdh.member.vo.Member;

/**
 * Servlet implementation class WriteBoardEndServlet
 */
@WebServlet("/board/writeboardend.do")
public class WriteBoardEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteBoardEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String 날짜 형식을 Date로 변환
		String wdDate=request.getParameter("date");
		System.out.println(wdDate);
		SimpleDateFormat sdf = new SimpleDateFormat("mm/dd/yyyy");
		Date wdDate1 = null;
		try {
			wdDate1 = sdf.parse(wdDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String type=request.getParameter("type");
		String address=request.getParameter("roadFullAddr");
		String count=request.getParameter("count");
		String gender=request.getParameter("gender");
		String purpose=request.getParameter("purpose");
		String title=request.getParameter("board_title");
		String content=request.getParameter("board_content");
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		System.out.println(type+address+count+wdDate+wdDate1+gender+purpose+title+content);		
		Board b=Board.builder()
				.wdCategory(type).wdLocation(address).wdCount(Integer.parseInt(count)).wdDate(wdDate1)
				.wdGender(gender).wdPurpose(purpose).wdTitle(title).wdContent(content).memberNo(memberNo).build();
		System.out.println(b);

		int result=new BoardService1().insertBoard(b);
		String msg="", loc="";
		if(result>0) {
			loc="/board/boardfinish.do";
		}else {
			msg="글 작성 실패!";
			loc="/board/writeboard.do";
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
