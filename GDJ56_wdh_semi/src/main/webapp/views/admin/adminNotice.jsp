<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.wdh.notice.model.vo.Notice" %>
<%
	List<Notice> notice=(List<Notice>)request.getAttribute("notice");
%>
    
 
 <%@ include file="/views/common/adminHeader.jsp" %> 
 
  <style>
        #test_btn1{
            border-radius: 5px;
            border-radius: 5px;
            /* margin-right:-4px; */
        }
        #btn_group button{
            border: 1px solid skyblue;
            background-color: rgba(0,0,0,0);
            color: skyblue;
            padding: 5px;
        }
        #btn_group button:hover{
            color:white;
            background-color: cornflowerblue;
        }
    </style>  		 
    
			<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">공지사항 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">공지사항을 관리합니다.</li>
                        </ol>
                       
                       <%-- <hr class="one">
                        <div id="btn_group">
                        <button onclick="location.replace('<%=request.getContextPath()%>/views/notice/subNotice.jsp')">글쓰기</button>
                        </div>
                        <hr class="one"> --%>
                        
                       <section id="board-container">
			            <table id="datatablesSimple">
			            <thead>
			                <tr>
			                	<th><input type="checkbox" name="checkall" id="checkall"></th>
			                    <th>번호</th>
			                    <th>제목</th>
			                    <th>작성자</th>
			                    <th>작성일</th>
			                </tr>
			                </thead>
							<% if(notice.isEmpty()){ %>
							<tr>
								<td colspan="5"><h3>조회된 게시판이 없습니다.</h3></td>
							</tr>	
							<%}else{ 
								for(Notice n : notice){
							%>
							 <tr>
							 	<th><input type="checkbox" name="checkall" id="checkall"></th>
                				<td><%=n.getNoticeNo() %></td>
	                			<td><a href="<%=request.getContextPath()%>/notice/noticeView.do?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a></td>
		                		<td><%=n.getNoticeWriter() %></td>
		                		<td><%=n.getNoticeEnroll() %></td>
		                		<%} 
               	 			}%>
                			</tr>
                			</table>
                			<br>
			                 <%-- 페이징 처리 --%>
			                <%--<div id="pageBar">
			                	<%=request.getAttribute("pageBar") %>
			                </div> --%>
			            </section>
			            <br>
			        </div> 
                  