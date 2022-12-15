package com.wdh.del.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.del.model.service.DclService;
import com.wdh.del.model.vo.Declaration;

/**
 * Servlet implementation class DclViewServlet
 */
@WebServlet("/cs/dcl.do")
public class DclViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //고객센터 - 신고하기 페이지로 넘어갈 서블릿
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DclViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//페이징 처리
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		//한 페이지에 5개씩 출력
		int numPerpage=5;
		List<Declaration> dcl=new DclService().searchDcl(cPage,numPerpage);
		int totalData=new DclService().selectDclCount();
		
		String pageBar="";
		//pageBar의 번호 갯수
		int pageBarSize=5;
		//총 페이지의 수(총 데이터/페이지당 출력갯수)
		//double->Math.ceil->int
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		
		//출력할 번호 세팅
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		//html 코드 생성
		if(pageNo==1) {
			//pageNo가 1번 페이지라면
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
				+"/cs/dcl.do?cPage="+pageNo+"'>"+pageNo+"</a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				//현재 보고있는 페이지
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()
					+"/cs/dcl.do?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
				+"/cs/dcl.do?cPage="+pageNo+"'>[다음]</a>";
		}
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("dcl", dcl);
		
		
		
		request.getRequestDispatcher("/views/cs/dcl.jsp").forward(request, response);
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
