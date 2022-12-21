<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.wdh.notice.model.vo.Notice" %>
<%
	List<Notice> notice=(List<Notice>)request.getAttribute("notice");
%>

<%@ include file="/views/common/header.jsp" %>

    <br>
    <div style="text-align:center" id="tbl-board">
        <h2><strong>공지사항</strong></h2>
        <section id="board-container">
            <table id="tbl-board">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
                <%if(notice.isEmpty()){ %>
                <tr>
                    <td colspan="4"><h3>조회된 게시판이 없습니다.</h3></td>
                </tr>
                <%}else{
                	for(Notice n : notice){ 
                %>
                <tr>
                	<td><%=n.getNoticeNo() %></td>
                	<td><a href="<%=request.getContextPath()%>/notice/noticeView.do?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a></td>
	                <td><%=n.getMember().getMember_id() %></td>
	                <td><%=n.getNoticeEnroll() %></td>
                </tr>
               		 	<%}//if
                	}%>
                </table>
               		<br>
               		<%if(loginMember!=null&&
                      		(loginMember.getMember_id().equals("admin"))) {%>
                   				<button onclick="location.replace('<%=request.getContextPath()%>/notice/writeEnd.do')">글쓰기</button>
                   	<%} %>				
                <br>
                <%-- 페이징 처리 --%>
                <div id="pageBar">
                	<%=request.getAttribute("pageBar") %>
                </div>
            </section>
            <br>
        </div>

<%@ include file="/views/common/footer.jsp" %>