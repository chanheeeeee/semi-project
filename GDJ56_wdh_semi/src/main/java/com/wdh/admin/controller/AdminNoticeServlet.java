package com.wdh.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.notice.model.service.NoticeService;
import com.wdh.notice.model.vo.Notice;
import com.wdh.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminNoticeServlet
 */
@WebServlet("/views/admin/adminNotice.do")
public class AdminNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//DB notice 테이블에 있는 전체디이터를 가져와 화면에 전송
		
		int cPage;
		int numPerpage=10;
		
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		List<Notice> notices=new NoticeService().selectNoticeList(cPage,numPerpage);
		
		int totalData=new NoticeService().selectNoticeCount();
		
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
		request.setAttribute("notice", notices);
		RequestDispatcher rd=request.getRequestDispatcher("/views/admin/adminNotice.jsp");
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
