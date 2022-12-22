<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.wdh.board.vo.*" %>
<% 
	Board b=(Board)request.getAttribute("board"); 
	Member m=(Member)request.getAttribute("member");
%>
<%@ include file="/views/common/header.jsp" %>

    <div class="container">
      <ul class="progressbar">
        <li class="active">Step 1. 정보확인</li>
        <li>Step 2. 작성자 평가</li>
        <li>Step 3. 후기글 작성</li>
      </ul>
    </div>

<h1>동행 정보 확인</h1>
<div id="first">
	<div id="check">
		<div>
			<div>참여 동행 - <%=b.getWdTitle() %></div>
			<div>동행자 닉네임 - <%=m.getMember_nickname() %></div>
			<div>운동 종목 - <%=b.getWdCategory() %></div>
			<div>참여 날짜 - <%=b.getWdCategory() %></div>
		</div>		
	</div>
</div>
<style>
	#check{
		font-family: 'Jua', sans-serif;
		font-size: 26px;
		text-align: center;
		color: grey;
		border: 2px solid grey;	
		width:600px;
		height:300px;
		justify-content:center;
		border-radius: 40px;
	}
	#check>div>div{
		margin-bottom: 20px;
		
	}
	h1{
		font-family: 'Jua', sans-serif;
		text-align:center;
		margin-top:100px;
		margin-bottom: 30px;
	}
	#first{
		display: flex;
		justify-content: center;
	}
	#check>div{
		margin-top:40px;
	}
</style>



    
<div style="margin:5%; text-align:center;">
	<button class="button" onclick="location.href='<%=request.getContextPath()%>/board/grade.do?boardNo=<%=b.getWdNo()%>'">확인</button>
</div>


<style>
	.container {
	  width: 100%;
	  
	}
	
	.progressbar {
	  counter-reset: step;
	  margin: 5%;
	}
	.progressbar li {
	  list-style: none;
	  display: inline-block;
	  width: 30.33%;
	  position: relative;
	  text-align: center;
	  cursor: pointer;
	}
	.progressbar li:before {
	  content: counter(step);
	  counter-increment: step;
	  width: 30px;
	  height: 30px;
	  line-height : 30px;
	  border: 2px solid #ddd;
	  border-radius: 100%;
	  display: block;
	  text-align: center;
	  margin: 0 auto 10px auto;
	  background-color: #fff;
	}
	.progressbar li:after {
	  content: "";
	  position: absolute;
	  width: 100%;
	  height: 1px;
	  background-color: #ddd;
	  top: 15px;
	  left: -50%;
	  z-index : -1;
	}
	.progressbar li:first-child:after {
	  content: none;
	}
	.progressbar li.active {
	  color: #2A47BA;
	}
	.progressbar li.active:before {
	  border-color: #2A47BA;
	} 
/* 	.progressbar li.active + li:after {
	  background-color: green;
	} */

</style>

<%@ include file="/views/common/footer.jsp" %>