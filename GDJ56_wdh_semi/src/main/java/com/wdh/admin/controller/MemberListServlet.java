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
import com.wdh.member.vo.Member;



/**
 * Servlet implementation class MemberListServlet
 */
@WebServlet("/admin/adminMemberList.do")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//DB에서 member테이블에 있는 전체 데이터를 가져와서 화면의 전송
		
		//현재 페이지
				int cPage;
				try {
					cPage=Integer.parseInt(request.getParameter("cPage"));
				}catch(NumberFormatException e) {
					cPage=1;
				}
			
			
				int numPerpage=5;
			
				List<Member> members=new AdminService().searchMemberList();
				
				int totalData=new AdminService().selectMemberCount();
				
				String pageBar="";
				
				//pageBar의 번호 갯수
				int pageBarSize=5;
				
				//총 페이지의 수
				int totalPage=(int)Math.ceil((double)totalData/numPerpage);
				
				//출력할 번호 세팅
				int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
				int pageEnd=pageNo+pageBarSize-1;
				
				//html코드 생성
				if(pageNo==1) {
					//pageNo가 1page라면
					pageBar+="<span>[이전]</span>";
				}else {
					pageBar+="<a href='"+request.getContextPath()+"/admin/adminMemberList.do?cPage="+pageNo+"'>"+pageNo+"</a>";
				}
				while(!(pageNo>pageEnd||pageNo>totalPage)) {
					if(cPage==pageNo) {
						//현재 보고 있는 페이지와 같다면
						pageBar+="<span>"+pageNo+"</span>";
					}else {
						pageBar+="<a href='"+request.getContextPath()+"/admin/adminMemberList.do?cPage="+pageNo+"'>"+pageNo+"</a>";
					}
					pageNo++;
				}
				if(pageNo>totalPage) {
					pageBar+="<span>[다음]</span>";
				}else {
					pageBar+="<a href='"+request.getContextPath()+"/admin/adminMemberList.do?cPage="+pageNo+"'[다음]</a>";
				}
				
				request.setAttribute("pageBar", pageBar);
				request.setAttribute("member", members);
				
				RequestDispatcher rd=request.getRequestDispatcher("/views/admin/adminMemberList.jsp");
				rd.forward(request,response);
			
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}