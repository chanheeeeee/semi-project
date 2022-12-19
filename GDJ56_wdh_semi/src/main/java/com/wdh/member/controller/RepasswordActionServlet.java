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
 * Servlet implementation class RepasswordActionServlet
 */
@WebServlet(name="rePassword", urlPatterns = "/member/repasswordAction.do")
public class RepasswordActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RepasswordActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_id = request.getParameter("saveId");
		String newpw = request.getParameter("newPw");
		System.out.println(member_id);
		System.out.println(newpw);
		
		
		int result = new MemberService().rePassword(member_id,newpw);
		
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
