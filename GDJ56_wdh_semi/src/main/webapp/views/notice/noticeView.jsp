<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.wdh.notice.model.vo.Notice" %>
<%
	Notice n=(Notice)request.getAttribute("notice");
%>

<%@ include file="/views/common/header.jsp" %>

<br>
<div font-family:Jua;>
  <div style="text-align:center" id="tbl-board">
   <h2><strong>공지사항 상세페이지</strong></h2>
   <section id="board-container">
    <table id="tbl-board">
        <tr>
            <th>제 목</th>
            <td><%=n.getNoticeTitle() %></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><%=n.getMember().getMember_id()  %></td>
        </tr>
        <tr>
            <th>작성시간</th>
            <td><%=n.getNoticeEnroll() %></td>
        </tr>
        <tr>
            <th>내 용</th>
            <td><%=n.getNoticeContent() %></td>
        </tr>
        
        </table>
        <br>
    <div>
    <%if(loginMember!=null&&loginMember.getMember_id().equals("admin")) {%>
    	<tr>
    		<th>
     			<input type="button" value="수정하기" onclick="fn_updateNotice(<%=n.getNoticeNo() %>)" >
    			<td><input type="button" value="삭제하기" onclick="fn_deleteNotice(<%=n.getNoticeNo()%>);">
    		</th>
    	</tr>
    		 <%} %>
    	</div>
  	</div>
  </section>
  
</div>
<br>
    
    
    <script>
	//공지사항 삭제
	const fn_deleteNotice=(NoticeNo)=>{
			location.replace("<%=request.getContextPath()%>/notice/noticeDelete.do?no="+NoticeNo);
	}
	//공지사항 수정
	const fn_updateNotice=(NoticeNo)=>{
		location.replace("<%=request.getContextPath()%>/notice/updateNotice.do?no="+NoticeNo);
	}
	
	
   </script>	
    
    
    
    
<%@ include file="/views/common/footer.jsp" %>