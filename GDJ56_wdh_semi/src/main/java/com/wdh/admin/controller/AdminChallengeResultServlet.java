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
import com.wdh.challenge.model.service.AdminChallengeService;
import com.wdh.challenge.model.vo.Challenge;
import com.wdh.challenge.model.vo.Challenge2;
import com.wdh.member.vo.Member;


/**
 * Servlet implementation class AdminChallengeResultServlet
 */
@WebServlet("/admin/adminChallengeResult.do")
public class AdminChallengeResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminChallengeResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage;
		int numPerpage=10;
		
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		List<Challenge> challenger=new AdminChallengeService().searchChallenge(cPage,numPerpage);
		
		int totalData=new AdminChallengeService().selectChallengeCount();
		
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		
		String pageBar="";
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getRequestURL()
			+"?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getRequestURL()
				+"?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getRequestURL()
			+"?cPage="+pageNo+"'>[다음]</a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("challenger", challenger);
		
		RequestDispatcher rd=request.getRequestDispatcher("/views/admin/adminChallengeResult.jsp");
		rd.forward(request, response);
	
	}
	 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
