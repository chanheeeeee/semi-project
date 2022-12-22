package com.wdh.mypage.controller;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.wdh.member.service.MemberService;
import com.wdh.member.vo.Member;
import com.wdh.mypage.service.MypageService;
import com.wdh.mypage.vo.Diary;

/**
 * Servlet implementation class DiaryAddServlet
 */
@WebServlet("/mypage/addDiary.do")
public class DiaryAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = ((Member)request.getSession().getAttribute("loginMember")).getMember_id();
		
		Member m = new MemberService().memberView(id);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		
		Date startSql = null;
		Date endSql = null;
		
		try {
			
			startSql = sdf.parse(start);
			endSql = sdf.parse(end);
			
		} catch (ParseException e) {
			
			e.printStackTrace();
			
		}
		
		Diary d = Diary.builder()
				.title(request.getParameter("title"))
				.memo(request.getParameter("memo"))
				.start(startSql)
				.end(endSql)
				.bgColor(request.getParameter("background_color"))
				.build();
		
		System.out.println(d);
		
		int result = new MypageService().addDiary(d, m);

		String msg="", loc="";
		
		if(result>0) {
			
			msg="성공!";
			loc="/mypage/diary.do";
			
		}else {
			
			msg="실패!";
			loc="/mypage/diary.do";
			
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msgm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
