<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.wdh.member.gmail.user.UserDto"%>

<%@ page import="com.wdh.member.gmail.user.UserDao"%>

<%@ page import="com.wdh.member.gmail.util.SHA256"%>

<%@ page import="java.io.PrintWriter"%>

<%
//회원가입을 처리합니다.

	request.setCharacterEncoding("UTF-8");

	String userID = null;

	String userPassword = null;

	String userEmail = null;

	if(request.getParameter("userID") != null) {

		userID = (String) request.getParameter("userID");

	}

	if(request.getParameter("userPassword") != null) {

		userPassword = (String) request.getParameter("userPassword");

	}

	if(request.getParameter("userEmail") != null) {

		userEmail = (String) request.getParameter("userEmail");

	}

	if (userID == null || userPassword == null || userEmail == null) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('입력이 안 된 사항이 있습니다.');");

		script.println("history.back();");

		script.println("</script>");

		script.close();

	} else {

		UserDao userDAO = new UserDao();

		int result = userDao.join(new UserDto(userID, userPassword, userEmail, SHA256.getSHA256(userEmail), false));

		if (result == -1) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('이미 존재하는 아이디입니다.');");

			script.println("history.back();");

			script.println("</script>");

			script.close();

		} else {

			session.setAttribute("userID", userID);

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("location.href = 'emailSendAction.jsp';");

			script.println("</script>");

			script.close();

		}

	}

%>