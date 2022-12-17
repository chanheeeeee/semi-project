package com.wdh.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.qs.model.service.QsService;
import com.wdh.qs.model.vo.Question;

/**
 * Servlet implementation class AdminQsServlet
 */
@WebServlet("/admin/adminQs.do")
public class AdminQsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//DB SERVICE_question 테이블에 있는 전체 디이터를 가져와 화면에 전송
		
				int cPage;
				int numPerpage=10;
				
				try {
					cPage=Integer.parseInt(request.getParameter("cPage"));
				}catch(NumberFormatException e) {
					cPage=1;
				}
				List<Question> questions=new QsService().searchQs(cPage,numPerpage);
				
				int totalData=new QsService().selectQsCount();
				
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
				request.setAttribute("question", questions);
				RequestDispatcher rd=request.getRequestDispatcher("/views/admin/adminQs.jsp");
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
