<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.wdh.qs.model.vo.Question,com.wdh.qs.model.vo.QsComment" %>
<%
	Question qs=(Question)request.getAttribute("qs");
	List<QsComment> comments=(List<QsComment>)request.getAttribute("comment");
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
                            <a class="nav-link" href="<%=request.getContextPath()%>/cs/dclWrite.do">신고하기</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/cs/writeQs.do">1대1 문의</a>
                        </li>
                    </ul>
                </div>
               
            </div>

        </div>
    </nav>
    <!-- Close Header -->
    <br>
<section id="qs-container">
    <div font-family:jua;>
    	<div id="tbl-board">
			<h2><strong>1대1문의 상세페이지</strong></h2>    
<!-- 				<form id="qsFrm" method="post">	 -->
    			<table id="tbl-dcl">
					<tr>
						<th>제 목</th>
						<td><%=qs.getQsTitle() %></td>
					</tr>
					<tr>
						<th>분 류</th>
						<td><%=qs.getQsHeadTitle() %></td>
					</tr>
					<tr>
						<th>작 성 자</th>
						<td><%=qs.getMember().getMember_id() %></td>
					</tr>
    				<tr>
    					<th>내 용</th>
    					<td><%=qs.getQsContent() %></td>
    				</tr>
    			</table>
    			<br>
<%-- <%--     				<!-- 관리자만 삭제할 수 있고 답변 할 수 있게 분기처리 --> --%>
<%--     				<%if(loginMember!=null&&loginMember.getMember_id().equals("admin")) {%> --%>
<%--     				<tr> --%>
<%--     					<th colspan="2"> --%>
<%--     						<input type="button" value="답변" onclick=""> --%>
<%--     						<input type="button" value="삭제" onclick="location.href='<%=request.getContextPath()%>/cs/deleteQs.do?qs_no=<%=qs.getQsNo()%>';"> --%>
<%--     					</th> --%>
<%--     				</tr> --%>
<%--     				<%} %> --%>
<!--     			</form> -->
    			<div id="comment-container">
    				<div class="comment-editor">
    					<form action="<%=request.getContextPath()%> /cs/qscommentWrite.do" method="post">
    						<textarea name="content" rows="10" cols="70" placeholder="1대1문의 답변"></textarea>
    						<input type="hidden" name="qsref" value="<%=qs.getQsNo()%>">
    						<input type="hidden" name="level" value="1">
    						<input type="hidden" name="commentref" value="1">
    						<input type="hidden" name="commentWriter" value="관리자">
    						<button type="submit" id="btn-insert">등록</button>
    					</form>
    				</div>
    				<table id="qs-comment">
    					<%if(!comments.isEmpty()) {
    						for(QsComment qsc : comments){
    							if(qsc.getQsCommentLevel()==1){%>
    							<tr class="level1">
    								<td class="comment-writer"><%=qsc.getQsCommentWriter() %></td>
    								<td><%=qsc.getQsCommentContent() %></td>
    								<td class="comment-data"><%=qsc.getQsCommentDate() %></td>
    							</tr>
    							<tr>
    								<td>
    									<button class="btn-delete">삭제</button>
    								</td>
    							</tr>
    						<%}//if
    						}//for
    					}//if%>
    				</table>
    				<br>
    			</div>
    	</div>
    </div>
</section>
<%@ include file="/views/common/footer.jsp" %>