<%@page import="com.wdh.qs.model.vo.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.wdh.del.model.vo.Declaration" %>
<%
	List<Question> qs=(List<Question>)request.getAttribute("qs");
%>
<!DOCTYPE html>
<head>
    <title>고객센터 - 1대1 문의</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="<%=request.getContextPath()%>/images/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico">
  
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/templatemo.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fontawesome.min.css">
    <!-- Load fonts style after rendering the layout styles -->

	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>

<body>
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="<%=request.getContextPath() %>/index.jsp">
                <img class="logo" src="<%=request.getContextPath() %>/images/logo3.png" alt="" style="width: 150px;" >
            </a>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/index.jsp">메인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/cs/spon.do">광고문의</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/cs/dcl.do">신고하기</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/cs/qs.do">1대1 문의</a>
                        </li>
                    </ul>
                </div>
               
            </div>

        </div>
    </nav>
    <!-- Close Header -->
    <br>
<div font-family:jua;>
    <div style="text-align:center" id="tbl-board">
        <h2><strong>1 대 1 문의 게시판</strong></h2>
        <section id="board-container">
            <table id="tbl-board">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>분류</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    
                </tr>
                <%if(qs.isEmpty()){ %>
                <tr>
                    <td colspan="5">조회된 게시판이 없습니다.</td>
                </tr>
                <%}else{
                	for(Question q : qs){
                	%>
                <tr>
                	<td><%=q.getQsNo() %></td>
                	<td><a href="<%=request.getContextPath()%>/cs/qsView.do?qsNo=<%=q.getQsNo()%>"><%=q.getQsTitle() %></a></td>
                	<td><%=q.getQsHeadTitle() %></td>
                	<td><%=q.getMember().getMember_id() %></td>
                	<td><%=q.getQsDate() %></td>
                </tr>
                <%}
               	}%>
                </table>
                <br>
                	<button onclick="location.href='<%=request.getContextPath()%>/views/cs/subQs.jsp'">글쓰기</button>
                <br>
                <div id="pageBar">
        			<%=request.getAttribute("pageBar") %>
        		</div>
            </section>
            <br>
        </div>
</div>

<%@ include file="/views/common/footer.jsp" %>