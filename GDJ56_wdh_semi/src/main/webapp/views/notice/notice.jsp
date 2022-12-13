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
                    <th>첨부파일</th>
                </tr>
                <%if(notice.isEmpty()){ %>
                <tr>
                    <td colspan="5"><h3>조회된 게시판이 없습니다.</h3></td>
                </tr>
                <%}else{
                	for(Notice n : notice){ 
                %>
                <tr>
                	<td><%=n.getNoticeNo() %></td>
                	<td><a href="<%=request.getContextPath()%>/notice/noticeView.do?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a></td>
                </tr>
                <td><%=n.getNoticeWriter() %></td>
                <td>
                	<%if(n.getFilePath()!=null){ %>
                		<img src="<%=request.getContextPath()%>/images/file.png" width="20" height="20">
                	<%}else{ %>
                		첨부파일 없음
                	<%} %>
                </td>
                <td><%=n.getNoticeEnroll() %></td>
                </table>
                <%if(loginMember!=null&&
                		loginMember.getMember_id().equals("admin")) {%>
                	<button onclick="location.replace('<%=request.getContextPath()%>/views/notice/subNotice.jsp')">글쓰기</button>
                <%} 
                }%>
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