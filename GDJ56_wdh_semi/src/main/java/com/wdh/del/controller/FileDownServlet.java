package com.wdh.del.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownServlet
 */
@WebServlet("/cs/fileDown.do")
public class FileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       //신고하기 사진 다운로드 서블릿
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fileName=request.getParameter("filename");
		
		String path=getServletContext().getRealPath("/upload/notice/");
		FileInputStream fis=new FileInputStream(path+fileName);
		BufferedInputStream bif=new BufferedInputStream(fis);
		
		
		String fileReName="";
		String header=request.getHeader("user-agent");
		boolean isMSIE=header.indexOf("MSIE")!=-1||header.indexOf("Trident")!=-1;
		if(isMSIE) {
			fileReName=URLEncoder.encode(fileName, "utf-8").replaceAll("\\+","%20");
		}else {
			fileReName=new String(fileName.getBytes("utf-8"),"ISO-8859-1");
		}
		
	
		response.setContentType("application/octet-stream");
		response.setHeader("Content-disposition", "attachment;filename="+fileReName);
		
		
		ServletOutputStream sos=response.getOutputStream();
		BufferedOutputStream bos=new BufferedOutputStream(sos);
		
	
		int read=-1;
		while((read=bif.read())!=-1) {
			bos.write(read);
		}
		bif.close();
		bos.close();
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
