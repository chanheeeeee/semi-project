package com.wdh.challenge.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wdh.admin.model.service.AdminService;
import com.wdh.member.vo.Member;

/**
 * Servlet implementation class EnrollChallengeServlet
 */
@WebServlet("/challenge/enrollChallenge.do")
public class EnrollChallengeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollChallengeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setContentType("text/csv;charset=utf-8;");
		if(!ServletFileUpload.isMultipartContent(request)) {
			response.getWriter().print(0);
		}else {
			String path=getServletContext().getRealPath("/upload/challenge_user/");
			MultipartRequest mr=new MultipartRequest(request, path, 1024*1024*100,"UTF-8",new DefaultFileRenamePolicy());
			
			int challengeNo=Integer.parseInt(mr.getParameter("challengeNo"));
			int day=Integer.parseInt(mr.getParameter("day"));
			String fileName=mr.getFilesystemName("file");
			Map<String,Object> param=Map.of("challengeNo",challengeNo,"fileName",fileName,"day",day);
			
			int result=new AdminService().insertChallenge(param);
			
			response.getWriter().print(result);
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
