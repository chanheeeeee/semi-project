<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.wdh.notice.model.vo.Notice" %>
<%
	Notice n=(Notice)request.getAttribute("notice");
%>

<%@ include file="/views/common/header.jsp" %>
<style>
   section#notice-container{width:600px; margin:0 auto; text-align:center;}
   section#notice-container h2{margin:10px 0;}
   table#tbl-notice{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
   table#tbl-notice th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
   table#tbl-notice td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
</style>

  <div id="notice-container">
   <!--  <h2><strong>공지사항 상세페이지</strong></h2> -->
    <table id="tbl-notice">
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