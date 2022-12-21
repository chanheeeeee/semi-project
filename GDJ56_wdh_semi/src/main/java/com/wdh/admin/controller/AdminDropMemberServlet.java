package com.wdh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminDropMemberServlet
 */
@WebServlet("/admin/dropMember.do")
public class AdminDropMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //y멤버를 탈퇴할 서블릿입니다.
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDropMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		System.out.println(memberNo);
		
		int result=new AdminService().deleteMember(memberNo);
		String msg="",loc="";
		if(result>0) {
			msg="회원 탈퇴 성공";
			loc="/admin/adminMemberList.do";
		}else {
			msg="회원 탈퇴 실패";
			loc="/admin/adminMemberList.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msgm.jsp").forward(request, response);
		
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
