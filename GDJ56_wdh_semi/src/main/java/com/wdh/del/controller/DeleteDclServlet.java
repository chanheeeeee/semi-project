package com.wdh.del.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wdh.del.model.service.DclService;
import com.wdh.del.model.vo.Declaration;

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
		//parameter는 jsp에서 넘어온 name 값을 적는다...
		
		int no=Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		
		
//		Declaration dcl=Declaration.builder().dclNo(Integer.parseInt(request.getParameter("dcl_no"))).build();
//		System.out.println(dcl);
		int result=new DclService().deleteDcl(no);
		
		
		String msg="",loc="";
		if(result>0) {
			msg="신고 글 삭제";
			loc="/admin/adminDcl.do";
			String path=getServletContext().getRealPath("/upload/cs/");
			File delFile=new File(path+fileName);
			if(delFile.exists()) delFile.delete();
		}else {
			msg="글 삭제 실패";
			loc="/cs/dcl.do?dclNo="+no;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msgm.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
