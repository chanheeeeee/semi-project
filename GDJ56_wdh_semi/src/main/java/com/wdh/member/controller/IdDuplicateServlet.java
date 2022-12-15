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
		//join.jsp에서 받아온 키값 memberId이고
		//value값은 유저가 실제로 적은 값, String memberId에는 value값이 들어간다
		
		
		PrintWriter out = response.getWriter();//반환값을 출력하기 위한 구문
		
		Member m = new MemberService().memberView(memberId);
		
		
		//성공여부 확인
		if(m!=null) {
			System.out.println("이미 존재하는 아이디입니다.");
		}else {
			System.out.println("사용 가능한 아이디입니다.");
		}
		out.write(m + "");//ajax결과값인 result가 됨!
		//String 으로 값을 내보낼수 있도로 +""를 해주어야 한다!
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
