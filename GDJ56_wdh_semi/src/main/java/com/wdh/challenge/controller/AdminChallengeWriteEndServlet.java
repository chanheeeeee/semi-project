package com.wdh.challenge.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wdh.challenge.model.service.AdminChallengeService;
import com.wdh.challenge.model.vo.Challenge;
import com.wdh.del.model.service.DclService;
import com.wdh.member.service.MemberService;
import com.wdh.member.vo.Member;

/**
 * Servlet implementation class AdminChallengeWriteEndServlet
 */
@WebServlet("/admin/challengeWriteEnd.do")
public class AdminChallengeWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminChallengeWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request) ) {
			
			
			response.sendRedirect(request.getContextPath());
			
		}else {
			String path=request.getServletContext().getRealPath("/upload/challenge");
					
		int maxSize=1024*1024*10;
		
		String encoding="UTF-8";
		DefaultFileRenamePolicy dfr=new DefaultFileRenamePolicy(); 
		
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,encoding,dfr);
		
		String name=mr.getParameter("name");
		String date=mr.getParameter("date");
		Date dateForm=null;
		try {
			dateForm=new SimpleDateFormat("yyyy-MM-dd").parse(date);
		}catch(ParseException e) {
			e.printStackTrace();
		}
		String fileName=mr.getFilesystemName("upfile");
		
		Challenge ch=Challenge.builder()
				.challenge_name(name)
				.challenge_date(dateForm)
				.challenge_img(fileName)
				.build();
		System.out.println(ch);
		
		
		int result=new AdminChallengeService().insertChallenge(ch);
		
		String msg="",loc="";
		if(result>0) {
			msg="챌린지 등록 성공!";
			loc="/admin/adminChallenge.do";
		}else {
			msg="챌린지 등록 실패!";
			loc="/challenge/adminChallengeWrite.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		RequestDispatcher rd=request.getRequestDispatcher("/views/common/msg.jsp");
		rd.forward(request, response);
		
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
