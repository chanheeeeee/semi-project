<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.wdh.member.vo.*" %>
<%@ page import="java.util.List,com.wdh.board.vo.*" %>
<%
	int loginMember=Integer.parseInt(request.getParameter("loginMember"));
	List<Member> members=(List<Member>)request.getAttribute("joinMember");
	List<WdJoin> wj=(List<WdJoin>)request.getAttribute("boardsW");
	Board b=(Board)request.getAttribute("board");
%>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/post.css">	
</head>

<div>
	<h1 style="text-align: center;">참가자 리스트</h1>
		<%if(members.isEmpty()){ %>
			<p style="text-align: center;color:red;">참여 회원이 없습니다.</p>
		<%}else{%>
			<div id="list" style="display:flex;justify-content:center;min-height: 60%;">
			<%for(Member m : members){ %>
				<%=m.getMember_nickname() %>
				<%int memberNo=m.getMember_no(); %>
				<%if(loginMember==b.getMemberNo()) {%>
					<button id="messageSend" style="height:25px !important; width:50px !important; margin:3px !important;"
					onclick="messageSendPop('<%=b.getWdNo()%>','<%=m.getMember_id()%>','<%=m.getMember_nickname()%>')">쪽지</button><br>
					<button id="button1" style="height:25px !important; width:80px !important; margin:3px !important;" onclick="out()">동행거절</button><br>
					<input type="hidden" name="out" onclick="location.href='<%=request.getContextPath()%>/board/wdjoinout.do?memberNo=<%=memberNo%>&wdNo=<%=b.getWdNo()%>';">
				<%} %>
			<%}%>
			</div>
		<%}%>
		<div style="text-align: center;">
			<input type="button" name="listclose" id="button1" value="닫기" onClick="window.close()"
			style="width:80px !important;=bottom: 0% !important;">		
		</div>
		<form id="">
			<input type="hidden" name="">
		</form>

</div>

<script>
	const out=()=>{
		if(confirm("동행을 거절하시겠습니까?")==true){
			document.getElementsByName("out")[0].click();
		}
	}
	
	const messageSendPop=(wdNo,recvMemberNo,recvMemberNick)=>{
		console.log(wdNo,recvMemberNo,recvMemberNick);
	}

</script>

