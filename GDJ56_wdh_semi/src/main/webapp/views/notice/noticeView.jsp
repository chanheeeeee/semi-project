<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.wdh.notice.model.vo.Notice" %>
<%
	Notice n=(Notice)request.getAttribute("notice");
%>

<%@ include file="/views/common/header.jsp" %>
  <div id="notice-container">
    <h2><strong>공지사항 상세페이지</strong></h2>
    <table id="tbl-notice">
    	<tr>
    		<td>제 목</td>
    		<td><%=n.getNoticeTitle() %></td>
    	</tr>
    	<tr>
    		<td>작 성 자</td>
    		<td><%=n.getNoticeWriter() %></td>
    	</tr>
    	<tr>
    		<td>내 용</td>
    		<td><%=n.getNoticeContent() %></td>
    	</tr>
    	<tr>
    		</td>
    	</tr>
    	
    <%if(loginMember!=null&&loginMember.getUser_id().equals("admin")) {%>
    	<tr>
    		<th colspan="2">
<%--     			<input type="button" value="수정하기" onclick="fn_updateNotice(<%=n.getNoticeNo() %>)" > --%>
    			<input type="button" value="삭제하기" onclick="fn_deleteNotice(<%=n.getNoticeNo() %>);">
    		</th>
    	</tr>
    		<%} %>
    </table>
  </div>
    
    <script>
    	const fn_fileDown=(fileName)=>{
    		//다운로드 스크립트
    		location.assign("<%=request.getContextPath()%>/notice/fileDown.do?filename="+fileName);
    	}
    	
    	const fn_deleteNotice=(noticeNo,fileName)=>{
    		//삭제 스크립트
    		location.replace("<%=request.getContextPath()%>/notice/noticeDelete.do?no="+noticeNo+"&fileName="+fileName);
    	}
    </script>
    
    
    
    
<%@ include file="/views/common/footer.jsp" %>