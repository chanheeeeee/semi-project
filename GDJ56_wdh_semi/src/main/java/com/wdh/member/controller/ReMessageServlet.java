package com.wdh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.member.service.MemberService;

/**
 * Servlet implementation class ReMessageServlet
 */
@WebServlet("/member/reMessageServlet.do")
public class ReMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msgNo = request.getParameter("msgNo");
		String nickName = request.getParameter("nickName");
		String content = request.getParameter("content");
		String wdNo = request.getParameter("wdNo");
		String receive_messenger = request.getParameter("receive_messenger");
		
		System.out.println(msgNo);
		System.out.println(nickName);
		System.out.println(content);		
		System.out.println(wdNo);
		System.out.println(receive_messenger);		

		//답장하기
		//읽은 여부 확인
		int readYN = new MemberService().readYN(Integer.parseInt(msgNo));
		request.setAttribute("msgNo", msgNo);
		request.setAttribute("nickName", nickName);
		request.setAttribute("content", content);
		request.setAttribute("wdNo", wdNo);
		request.setAttribute("receive_messenger", receive_messenger);
		
		request.getRequestDispatcher("/views/member/remessage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
