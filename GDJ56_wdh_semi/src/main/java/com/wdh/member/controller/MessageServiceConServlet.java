package com.wdh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.wdh.member.service.MemberService;
import com.wdh.member.vo.Member;

/**
 * Servlet implementation class MessageServiceConServlet
 */
@WebServlet("/member/MessageServiceConServlet.do")
public class MessageServiceConServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageServiceConServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String wdNo = request.getParameter("wdNo"); //게시글 번호
		String receiveMemberNo = request.getParameter("receive_messenger"); // 받는사람
		String content = request.getParameter("message");	//메시지 내용
		
		System.out.println(wdNo);
		System.out.println(receiveMemberNo);
		System.out.println(content);
		
		Member m = (Member) request.getSession().getAttribute("loginMember");	//로그인한 멤버의 고유값 (보내는사람)
		int msg_writer = m.getMember_no();
		
		//서비스 통해서 DAO로 INSERT
		//service
		int result = new MemberService().sendMessage(wdNo,receiveMemberNo,content,msg_writer);
		
		JSONObject ob = new JSONObject();
		
		ob.put("result", result);
		
		response.getWriter().print(ob);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
