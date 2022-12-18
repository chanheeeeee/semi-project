package com.wdh.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.wdh.member.service.MemberService;
import com.wdh.member.vo.Member;
import com.wdh.mypage.service.MypageService;

/**
 * Servlet implementation class UpdateMemberEndServlet
 */
@WebServlet("/mypage/updateMemberEnd.do")
public class UpdateMemberEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Member m = Member.builder()
				.gender(request.getParameter("gender").charAt(0))
				.email(request.getParameter("email"))
				.member_nickname(request.getParameter("nickname"))
				.phone(request.getParameter("phone1") + "-" + request.getParameter("phone") + "-" + request.getParameter("phone"))
				.address(request.getParameter("address") + " " + request.getParameter("address2"))
				.build();
		
		
		
		int result = new MypageService().updateMember(m);
		

		String msg="", loc="";
		
		if(result>0) {
			
			msg="내 정보 업데이트 완료";
			loc="/mypage/about.do";
			
		}else {
			
			msg="실패했습니다. 다시 시도해 주세요.";
			loc="/mypage/profile.do";
			
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msgm.jsp").forward(request, response);
		
		
		
		Gson js = new Gson();
		js.toJson(result, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
