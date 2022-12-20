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
<script src="<%=request.getContextPath() %>/js/jquery-1.11.0.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-migrate-1.2.1.min.js"></script>
</head>

<div>
	<h1 style="text-align: center;">참가자 리스트</h1>
		<%if(members.isEmpty()){ %>
			<p style="text-align: center;color:red;">참여 회원이 없습니다.</p>
		<%}else{%>
			<!-- <div id="list" style="display:flex;justify-content:center;min-height: 60%;"> -->
			<%for(Member m : members){ %>
			<div>
				<%=m.getMember_nickname() %>
				<%int memberNo=m.getMember_no(); %>
					<button id="messageSend" class="button1" style="height:25px !important; width:50px !important; margin:3px !important;"
					onclick="messageSendPop('<%=b.getWdNo()%>','<%=m.getMember_no()%>','<%=m.getMember_nickname()%>')">쪽지</button><br>
				<%if(loginMember==b.getMemberNo()) {%>
					<button id="button1" style="height:25px !important; width:80px !important; margin:3px !important;" onclick="out()">동행거절</button><br>
					<input type="hidden" name="out" onclick="location.href='<%=request.getContextPath()%>/board/wdjoinout.do?memberNo=<%=memberNo%>&wdNo=<%=b.getWdNo()%>';">
				<%} %>
			</div>
			<%}%>
			<!-- </div> -->
		<%}%>
		<div style="text-align: center;">
			<input type="button" name="listclose" id="button1" value="닫기" onClick="window.close()"
			style="width:80px !important;=bottom: 0% !important;">		
		</div>
		<form id="frm" name="frm">
			<input type="hidden" name="wdNo" id="wdNo">
			<input type="hidden" name="recvMemberNo" id="recvMemberNo">
			<input type="hidden" name="recvMemberNick" id="recvMemberNick">
		</form>

</div>

<script>
	const out=()=>{
		if(confirm("동행을 거절하시겠습니까?")==true){
			document.getElementsByName("out")[0].click();
		}
	}
	
	//참가리스트에 쪽지버튼 눌렀을때
	const messageSendPop=(wdNo,recvMemberNo,recvMemberNick)=>{//넘길데이터 게시글번호,멤버번호,멤버닉네임 
		console.log(wdNo,recvMemberNo,recvMemberNick);
	
		$("#wdNo").val(wdNo);
		$("#recvMemberNo").val(recvMemberNo);
		$("#recvMemberNick").val(recvMemberNick);

		open("","frmMessage","width=300,height=300");
		frm.method="post";
		frm.action="<%=request.getContextPath()%>/member/messageServlet.do";
		frm.target="frmMessage";
		frm.submit();
		
		
	}

</script>


