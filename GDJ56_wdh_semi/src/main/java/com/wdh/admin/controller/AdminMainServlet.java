package com.wdh.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.admin.model.service.AdminService;
import com.wdh.del.model.service.DclService;
import com.wdh.del.model.vo.Declaration;
import com.wdh.member.vo.Member;
import com.wdh.notice.model.service.NoticeService;
import com.wdh.notice.model.vo.Notice;
import com.wdh.qs.model.service.QsService;
import com.wdh.qs.model.vo.Question;

/**
 * Servlet implementation class AboutMember
 */
@WebServlet("/admin/adminMain.do")
public class AdminMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// TODO Auto-generated method stub
		List<Notice> notices=new NoticeService().selectNoticeList(1,5);
		
//		List<Member> members=new AdminService().searchMemberList();
		
		// 저는 이걸 왜 하루종일 하고 있는지 모르겠습니다...
		List<Member> members=new AdminService().adminMemberList();
		
		List<Question> questions=new QsService().searchQs(1, 5);
		
		List<Declaration> declarations=new DclService().searchDcl(1, 5);
		
		request.setAttribute("notice", notices);
//		request.setAttribute("members", members);
		
		request.setAttribute("member", members);
		
		request.setAttribute("question", questions);
		request.setAttribute("declaration", declarations);
		
		
		RequestDispatcher rd=request.getRequestDispatcher("/views/admin/adminMain.jsp");rd.forward(request, response);
				
				
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}