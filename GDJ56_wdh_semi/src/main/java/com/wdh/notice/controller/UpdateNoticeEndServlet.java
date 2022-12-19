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
 * Servlet implementation class UpdateNoticeEndServlet
 */
@WebServlet("/notice/updateNoticeEnd.do")
public class UpdateNoticeEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNoticeEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Notice n = Notice.builder()
						.noticeNo(Integer.parseInt(request.getParameter("noticeNo")))
						.noticeTitle(request.getParameter("noticeTitle"))
						.noticeWriter(request.getParameter("noticeWriter"))
						.noticeContent(request.getParameter("noticeContent"))
						.build();
		int result = new NoticeService().updateNotice(n);
		
		String msg="",loc="";
		if(result>0) {
			msg = "공지사항 수정이 완료되었습니다.";
			loc = "/notice/notice.do";
		} else {
			msg = "공지사항 수정 실패하였습니다.";
			loc = "/notice/updateNotice.do?noticeNo="+n.getNoticeNo();
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