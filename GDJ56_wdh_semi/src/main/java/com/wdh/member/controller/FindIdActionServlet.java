package com.wdh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.wdh.member.service.MemberService;
import com.wdh.member.vo.Member;

/**
 * Servlet implementation class FindIdActionServlet
 */
@WebServlet("/member/findIdActionServlet.do")
public class FindIdActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		Member m = new MemberService().searchMemberId(name,email);

		JSONObject jObj = new JSONObject();
		//m 값이 없을 경우에는 null로 들어오기 때문에, m.getMember_id()를 했을 경우 NullPointerException이 발생함
		if(m != null) {
			jObj.put("memberId", m.getMember_id());
		}else {
			jObj.put("memberId", "");
		}
		
		Gson js = new Gson();
		js.toJson(jObj , response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
