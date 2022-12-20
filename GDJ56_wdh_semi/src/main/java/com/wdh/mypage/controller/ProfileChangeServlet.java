package com.wdh.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wdh.member.service.MemberService;
import com.wdh.member.vo.Member;
import com.wdh.mypage.service.MypageService;

/**
 * Servlet implementation class ProfileChangeServlet
 */
@WebServlet("/mypage/changeProfile.do")
public class ProfileChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = ((Member)request.getSession().getAttribute("loginMember")).getMember_id();
		
		Member m = new MemberService().memberView(id);
		
		
		//1. 요청방식 multipart/form-data 방식으로 왔는지 확인
		if(!ServletFileUpload.isMultipartContent(request)) {
					
			response.sendRedirect(request.getContextPath());
					
		} else {
					
			String path = request.getServletContext().getRealPath("/upload/profile");
					
					//저장 파일 크기 설정
					//byte -> mb -> GB -> TB : 1024
			int maxSize=1024*1024*10;//10MB
					//인코딩설정
			String encoding="UTF-8";
					//rename클래스
			DefaultFileRenamePolicy dfr=new DefaultFileRenamePolicy();
					
					//매개변수있는 생성자로 MultipartRequest클래스를 생성
			MultipartRequest mr=new MultipartRequest(request, 
						path,maxSize,encoding,dfr);
				
				
					//클라이언트가 보낸 데이터를 DB에 저장하는 기능
					//파일을 저장하면서 재정의된 파일명을 저장해야 한다.
					//리네임된 파일 이름
			String fileName = mr.getFilesystemName("upFile");
			String oriName = mr.getOriginalFileName("upFile");

			int result = new MypageService().changeProfile(m, fileName);
					
			String msg = "", loc = "";
					
			if(result > 0) {
						
				msg = "프로필이 변경되었습니다.";
				loc = "/loginAction.do";
				
				HttpSession session=request.getSession(false);
				session.invalidate();	
				
				String loginId = request.getParameter("loginId");
				String password = request.getParameter("password");
				session.setAttribute("loginId", loginId);
				session.setAttribute("password", password);
				
			} else {
						
				msg = "프로필 등록을 실패했습니다. 다시 시도해 주세요.";
				loc = "/mypage/about.do";
						
			}
			
					
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			
					
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
