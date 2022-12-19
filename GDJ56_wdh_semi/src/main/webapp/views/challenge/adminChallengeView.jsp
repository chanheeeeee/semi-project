<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.wdh.challenge.model.vo.Challenge" %>

<%
	Challenge ch=(Challenge)request.getAttribute("ch");
%>

<%@ include file="/views/common/adminHeader.jsp" %>




			    	<div id="tbl-board">
						<h2><strong>챌린지 상세페이지</strong></h2>    
			    			<table id="tbl-challenge">
								<tr>
									<th>이미지파일</th>
									<td><%=ch.getChallenge_img() %></td>
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
			    					<th colspan="2">{
			    						<input type="button" value="삭제" onclick="location.href='<%=request.getContextPath()%>/Challenge/deleteChallenge.do?challenge_no=<%=ch.getChallenge_no()%>';">
			    					</th>
			    				</tr>
			    			</table>
			    			<br>
			    	</div>