package com.wdh.del.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wdh.del.model.service.DclService;
import com.wdh.del.model.vo.Declaration;
import com.wdh.member.service.MemberService;
import com.wdh.member.vo.Member;

/**
 * Servlet implementation class DclWriteEndServlet
 */
@WebServlet("/cs/writeEnd.do")
public class DclWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //신고하기 글 작성하고 넘어갈 페이지 ->/common/msg.jsp로 연결
	// + 파일 업로드 처리
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DclWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			response.sendRedirect(request.getContextPath());
		}else {
			String path=request.getServletContext().getRealPath("/upload/cs");
			
			//저장 파일 크기설정
			int maxSize=1024*1024*10; //10MB가 최대
			//인코딩 설정
			String encoding="UTF-8";
			DefaultFileRenamePolicy dfr=new DefaultFileRenamePolicy();
			
			MultipartRequest mr=new MultipartRequest(request,path,maxSize,encoding,dfr);
			//클라이언트가 보낸 데이터를 DB에 저장하는 기능
			//파일을 저장하면서 재정의된 파일명을 저장해야한다.
			
			String title=mr.getParameter("dcl_title");
			
			String content=mr.getParameter("dcl_content");
			//작성일은 default sysdate처리
			String headTitle=mr.getParameter("dcl_headtitle");
			String fileName=mr.getFilesystemName("upfile");
			String oriName=mr.getOriginalFileName("upfile");
			
			Declaration dcl=Declaration.builder()
					.dclTitle(title)
					.dclContent(content)
					.dclHeadTitle(headTitle)
					.filePath(fileName)
					.build();
			System.out.println(dcl);
			
			String id = ((Member)request.getSession().getAttribute("loginMember")).getMember_id();
			Member m=new MemberService().memberView(id);
			//세션 값을 로그인 된 맴버의 아이디를 갖고 있어야 해당되는 맴버 되는 맴버를 검색한다
			//작성자 아이디를 제외한 나머지 제목,내용,헤더타이틀,파일 전부 null로 나옴..
			int result=new DclService().insertDcl(dcl, m);
			String msg="",loc="";
			if(result>0) {
				msg="신고 글작성 성공";
				loc="/cs/dclAlert.do";
			}else {
				msg="신고 글작성 실패";
				loc="/cs/writeEnd.do";
			}
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msgm.jsp").forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
