package com.wdh.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.member.service.MemberService;
import com.wdh.member.vo.Member;

/**
 * Servlet implementation class NicknameDuplicate
 */
@WebServlet("/member/nicknameDuplicate.do")
public class NicknameDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NicknameDuplicateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */ 	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickname = request.getParameter("nickname");
		//jsp에서 닉네임 가져옴
		
		Member m = new MemberService().NickNameDuplicate(nickname);
		
		//성공여부확인
//		if(m!=null) {
//			System.out.println("이미 존재하는 닉네임 입니다.");
//		}else {
//			System.out.println("사용 가능한 닉네임 입니다.");
//		}
		
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
