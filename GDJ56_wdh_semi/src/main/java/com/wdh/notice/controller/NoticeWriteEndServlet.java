package com.wdh.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.notice.model.service.NoticeService;
import com.wdh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeWriteEndServlet
 */
@WebServlet("/notice/writeEnd.do")
public class NoticeWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title=request.getParameter("notice_title");
		String writer=request.getParameter("notice_writer");
		String content=request.getParameter("notice_content");
		
		Notice n=Notice.builder()
				.noticeTitle(title)
				.noticeWriter(writer)
				.noticeContent(content)
				.build();
		
		int result=new NoticeService().insertNotice(n);
		String msg="",loc="";
		if(result>0) {
			msg="공지사항 작성 성공 했어요";
			loc="/notice/notice.do";
		}else {
			msg="공지사항 작성 실패 했어요";
			loc="/notice/write.do.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
