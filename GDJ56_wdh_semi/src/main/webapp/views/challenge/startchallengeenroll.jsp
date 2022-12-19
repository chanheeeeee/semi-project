<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.wdh.challenge.model.vo.Challenge" %>

<%
	Challenge ch=(Challenge)request.getAttribute("ch");
%>

<%@ include file="/views/common/header.jsp" %>
<style>
	div#tbl-board{
		display:flex;
		flex-direction: column;
		justify-content:center;
		align-items: center;
	}
	table#tbl-challenge{
		width:60%;
		height:400px;
	}
	div#tbl-board>h2{
		margin-top:6%;
		margin-bottom: 6%;
	}
</style>
<div id="tbl-board">
		<h2><strong>챌린지 상세페이지</strong></h2>    
   			<table id="tbl-challenge">
				<tr>
					<td colspan="2">
						<img src="<%=request.getContextPath()%>/upload/challenge/<%=ch.getChallenge_img() %>" 
						width="400px" height="200px">
					</td>
				</tr>
				<tr>
					<th>제 목</th>
					<td><%=ch.getChallenge_name() %></td>
				</tr>
   				<tr>
   					<th>시작일</th>
   					<td><%=ch.getChallenge_date() %></td>
   				</tr>
   				<tr>
   					<th colspan="2">
   						<input type="button" value="신청하기" onclick="location.href='<%=request.getContextPath()%>/challenge/enrollChallenge.do?challenge_no=<%=ch.getChallenge_no()%>';">
   					</th>
   				</tr>
   			</table>
   			<br>
   	</div>
   	<%@ include file="/views/common/footer.jsp" %>	