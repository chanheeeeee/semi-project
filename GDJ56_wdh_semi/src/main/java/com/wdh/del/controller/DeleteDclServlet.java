package com.wdh.del.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteDclServlet
 */
@WebServlet("/cs/deleteDcl.do")
public class DeleteDclServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    //신고 게시글 삭제하기 서블릿
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDclServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName=request.getParameter("fileName");
		int no=Integer.parseInt(request.getParameter("no"));
		int result=1;
		String msg="",loc="";
		if(result>0) {
			msg="신고 글 삭제";
			loc="/cs/dcl.do";
			String path=getServletContext().getRealPath("upload/cs/");
			File delFile=new File(path+fileName);
			if(delFile.exists()) delFile.delete();
		}else {
			msg="글 삭제 실패";
			loc="/cs/dcl.do?dclNo="+no;
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
