<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.wdh.member.vo.*" %>
<%@ page import="java.util.List,com.wdh.board.vo.*" %>
<%
	List<Member> members=(List<Member>)request.getAttribute("joinMember");
	List<WdJoin> wj=(List<WdJoin>)request.getAttribute("boardsW");
%>

<div>
	<h1>참가자 리스트</h1>
		<%for(Member m : members){ %>
			<ul>
				<li>
					<%=m.getMember_nickname() %>
					<button id="button1">강퇴</button>
				</li>
			</ul>
		<%} %>
	
	
	
</div>

