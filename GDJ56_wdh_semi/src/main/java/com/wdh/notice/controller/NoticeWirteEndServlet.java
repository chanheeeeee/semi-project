package com.wdh.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wdh.notice.model.service.NoticeService;
import com.wdh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeWriteEndServlet
 */
@WebServlet("/notice/writeEnd.do")
public class NoticeWirteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeWirteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title=request.getParameter("notice_title");
		System.out.println(title);
		String content=request.getParameter("board_content");
		System.out.println(content);
		Notice n=Notice.builder()
				.noticeTitle(title)
				.noticeContent(content)
				.build();
				
				int result=new NoticeService().insertNotice(n);
				
				//등록성공하면 등록성공 메세지출력 후 리스트화면으로 이동
				//등록실패하면 등록실패 메세지출력 후 등록화면으로 이동
				String msg="";
				String loc="";
				if(result>0) {
					msg="공지사항등록 성공";
					loc="/admin/adminNotice.do";
				}else {
					msg="공지사항등록 실패";
					loc="/notice/write.do";
				}
				request.setAttribute("msg",msg);
				request.setAttribute("loc",loc);
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

