package com.wdh.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.member.vo.Member;
import com.wdh.mypage.service.MypageService;

/**
 * Servlet implementation class UpdatePasswordEnd
 */
@WebServlet("/mypage/updatePasswordEnd.do")
public class UpdatePasswordEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePasswordEnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String memberId = request.getParameter("memberId");
		String oriPass = request.getParameter("password");
		String newPass = request.getParameter("password_new");
		
		//현재 비밀번호 맞는지 확인
		Member m = new MypageService().searchMember(memberId, oriPass);
		
		//m이 null이면 비밀번호가 틀림, m이 null이 아니면 맞다
		String msg="",loc="";
		
		if(m != null) {
			//비밀번호 변경 로직진행
			
			int result=new MypageService().updatePassword(memberId, newPass);
			
			if(result>0) {
				
				msg="비밀번호 변경완료. 다시 로그인해 주세요.";
				loc="/mypage/logout.do";
				String script="opener.location.replace('"+request.getContextPath()+"/mypage/logout.do');close();";
				request.setAttribute("script", script);
				
			} else {
				
				msg="비밀번호 변경실패";
				loc="/mypage/updatePassword.do?memberId="+memberId;
				
			}
			
		} else {
			
			//현재비밀번호가 다릅니다. 다시 시도하세요!
			msg="현재 비밀번호가 일치하지않습니다! 다시 시도하세요!";
			loc="/mypage/updatePassword.do?memberId="+memberId;
			
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc",loc);
		
		request.getRequestDispatcher("/views/common/msgm.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
