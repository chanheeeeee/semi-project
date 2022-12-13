package com.wdh.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.notice.model.service.NoticeService;
import com.wdh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/notice/noticeList.do")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//메인에서 공지사항을 클릭시 연결되게 할 서블릿입니다.
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//notice 테이블에 있는 전체 데이터를 가져와서 화면에 전달 및 페이징 처리하는 서블릿입니다.
		
		//현재 페이지
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
	
		//한 페이지에 출력될 notice 5개
		int numPerpage=5;
	
		List<Notice> notice=new NoticeService().selectNoticeList(cPage,numPerpage);
		
		int totalData=new NoticeService().selectNoticeCount();
		
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
			pageBar+="<a href='"+request.getContextPath()+"/notice/noticeList.do?cPage="+pageNo+"'>"+pageNo+"</a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				//현재 보고 있는 페이지와 같다면
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/notice/noticeList.do?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/notice/noticeList.do?cPage="+pageNo+"'[다음]</a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("notice", notice);
		
		request.getRequestDispatcher("/views/notice/notice.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
