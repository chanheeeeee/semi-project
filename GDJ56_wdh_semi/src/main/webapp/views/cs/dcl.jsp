<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.wdh.del.model.vo.Declaration" %>
<%
	List<Declaration> dcl=(List<Declaration>)request.getAttribute("dcl");
%>
<%@ page import="com.wdh.member.vo.Member" %>
<%
	Member loginMember=(Member)session.getAttribute("loginMember");
%>
<!DOCTYhPE tml>
<html>
<head>
    <title>고객센터 - 신고하기</title>
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
                            <a class="nav-link" href="<%=request.getContextPath()%>/views/cs/qs.jsp">1대1 문의</a>
                        </li>
                    </ul>
                </div>
               
            </div>

        </div>
    </nav>
    <!-- Close Header -->
    
        <br>
  <div font-family:Jua;>
    <div style="text-align:center" id="tbl-board">
        <h2><strong>신고하기 게시판</strong></h2>
        <section id="board-container">
            <table id="tbl-board" style="text-align:center;">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>첨부파일</th>
                    <th>작성일</th>
                </tr>
                <%if(dcl.isEmpty()){ %>
                <tr>
                    <td colspan="5">조회된 게시판이 없습니다.</td>
                </tr>
                <%}else{
                	for(Declaration d : dcl){
                	%>
                <tr>
                	<td><%=d.getDclNo() %></td>
                	<td><a href="<%=request.getContextPath() %>/dcl/dclView.do?dclNo=<%=d.getDclNo()%>"><%=d.getDclTitle() %></a></td>
                	<td><%=d.getMemberNo() %></td>
                	<td>
                		<%if(d.getFilePath()!=null){ %>
                			<img src="<%=request.getContextPath() %>/images/file.png" width="20" height="20">
                			<%}else{ %>
                			첨부파일 없음
                			<%} %>
                	</td>
                	<td><%=d.getDclDate() %>
                </tr>
                <%} 
                }%>
           </table>
      <button onclick="location.href='<%=request.getContextPath()%>/views/cs/subDcl.jsp'">글쓰기</button>
      <br>
        <div id="pageBar">
        	<%=request.getAttribute("pageBar") %>
        </div>
            </section>
            <br>
        </div>
    </div>
        
<%@ include file="/views/common/footer.jsp" %>