package com.wdh.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.wdh.board.controller.GradeServlet;
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
		
		String id = ((Member)request.getSession().getAttribute("loginMember")).getMember_id();
		
		Member m = new MemberService().memberView(id);

//		String nickname = request.getParameter("nickname");
//		char gender = request.getParameter("gender").charAt(0);
//		String email = request.getParameter("email");
		String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");
		String address = "";
		
		
//		if(!phone.equals(m.getPhone())) {
//			
//			m = Member.builder().phone(phone).build();
//			
//		} else {
//			
//			m = Member.builder().phone(m.getPhone()).build();
//			
//		}
//
		if(!address.equals(m.getAddress())) {
			
			address = request.getParameter("address") + " " + request.getParameter("address2");
			
			
		} else {
			
			address = m.getAddress();
			
		}
		
		m = Member.builder()
				.gender(request.getParameter("gender").charAt(0))
				.email(request.getParameter("email"))
				.member_nickname(request.getParameter("nickname"))
				.phone(phone)
				.address(address)
				.member_id(m.getMember_id())
				.grade(m.getGrade())
				.birth(m.getBirth())
				.password(m.getPassword())
				.member_no(m.getMember_no())
				.name(m.getName())
				.build();
		
		int result = new MypageService().updateMember(m);
		System.out.println(result);


		String msg="", loc="";
		
		if(result>0) {
			
			msg="내 정보 업데이트 완료";
			loc="/mypage/about.do";
			
		}else {
			
			msg="실패했습니다. 다시 시도해 주세요.";
			loc="/mypage/about.do";
			
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
