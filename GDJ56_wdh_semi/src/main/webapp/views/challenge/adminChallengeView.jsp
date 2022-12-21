<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.wdh.challenge.model.vo.Challenge" %>

<%
	Challenge ch=(Challenge)request.getAttribute("challenge");
%>


<%@ include file="/views/common/adminHeader.jsp" %>



<style>
   section#notice-container{width:600px; margin:0 auto; text-align:center;}
   section#notice-container h2{margin:10px 0;}
   table#tbl-notice{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
   table#tbl-notice th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
   table#tbl-notice td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
</style>

  <div id="notice-container">
	   <h2><strong>챌린지(관리자) 상세페이지</strong></h2>
		    <table id="tbl-notice">
			        <tr>
			            <td colspan="2">
						<img src="<%=request.getContextPath()%>/upload/challenge/<%=ch.getChallenge_img() %>" 
					  	width="500px" height="500px">
			        </tr>
			        <tr>
			            <th>제 목</th>
						<td><%=ch.getChallenge_name() %></td>
			        </tr>
			        <tr>
			            <th>시작일</th>
						<td><%=ch.getChallenge_date() %></td>
			        </tr>
		        
		        </table>
	    <div>
	    	<tr>
	    		<th>
	    			<input type="button" value="삭제" onclick="location.href='<%=request.getContextPath()%>/Challenge/deleteChallenge.do?challenge_no=<%=ch.getChallenge_no()%>';">
	    		</th>
	    	</tr>
	    	<%-- 페이징 처리 --%>
                <div id="pageBar">
                	<%=request.getAttribute("pageBar") %>
                </div>
	    		 
	  	</div>	
	  
	  
	   <script>
			//챌린지 게시글 삭제
			const fn_deleteNotice=(NoticeNo)=>{
					location.replace("<%=request.getContextPath()%>/challenge/deleteChallenge.do?no="+challenge_no);
			}
	   </script>					