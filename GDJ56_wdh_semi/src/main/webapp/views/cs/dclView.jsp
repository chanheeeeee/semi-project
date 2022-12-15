<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.wdh.del.model.vo.Declaration" %>
<%
	Declaration dcl=(Declaration)request.getAttribute("dcl");
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
    
<div font-family:Jua;>
    <div id="dcl-container">
    	<h2><strong>신고하기 상세페이지</strong></h2>
    		<table id="tbl-dcl">
    			<tr>
    				<th>제 목</th>
    				<td><%=dcl.getDclTitle() %></td>
    			</tr>
    			<tr>
    				<th>작 성 자</th>
    				<!-- 작성자 번호 말고 아이디로 받아와야함 -->
    				<td><%=dcl.getMemberNo() %></td>
    			</tr>
    			<tr>
    				<th>첨부 파일</th>
    				<td><%if(dcl.getFilePath()!=null){ %>
    					<img src="<%=request.getContextPath() %>/images/file.png" width="20" onclick="fn_fileDown('<%=dcl.getFilePath() %>');">
    					<%=dcl.getFilePath() %>
    					<%}else{ %>
    						첨부파일없음
    					<%
    					}%>
    					</td>
    			</tr>
    			<tr>
    				<th>내 용</th>
    				<td><%=dcl.getDclContent() %></td>
    			</tr>
    			<!-- 관리자만 삭제할 수 있고 답변 할 수 있게 분기처리 -->
    			<%if(loginMember!=null&&loginMember.getMember_id().equals("admin")){ %>
    			<tr>
    				<th colspan="2">
    					<input type="button" value="답변" onclick="">
    					<input type="button" value="삭제" onclick="fn_deleteDcl(<%=dcl.getDclNo() %>,'<%=dcl.getFilePath() %>');"> 
    				</th>
    			</tr>
    			<%} %>
    		</table>
    <script>
    	const fn_fileDown=(fileName)=>{
    		//다운로드 스크립트
    		location.assign("<%=request.getContextPath()%>/cs/fileDown.do?filename="+fileName);
    	}
    	const fn_deleteDcl=(dclNo,fileName)=>{
    		//삭제하기 스크립트
    		location.replace("<%=request.getContextPath()%>/cs/deleteDcl.do?no="+dclNo+"&fileName="+fileName);
    	}
    </script>
    
    
    </div>
</div>



<%@ include file="/views/common/footer.jsp" %>