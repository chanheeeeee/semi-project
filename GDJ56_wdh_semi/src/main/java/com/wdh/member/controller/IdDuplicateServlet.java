package com.wdh.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.member.dao.MemberDao;
import com.wdh.member.service.MemberService;
import com.wdh.member.vo.Member;

/**
 * Servlet implementation class IdDuplicateServlet
 */
@WebServlet("/member/idduplicate.do")
public class IdDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdDuplicateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 //Servlet에서는 JS를 통해 받은 값을 처리 받아온 값은 ajax 기본 인코딩 값인 
		//UTF-8로 처리 DAO를 통해 값이 중복하는지 확인한 후, 결과 값을 JSP로 보내줌
			
		String memberId = request.getParameter("memberId");
		
		Member m = new MemberService().memberView(memberId);
		
		
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().append(m==null?"가능":"불가능");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
