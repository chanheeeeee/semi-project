<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.wdh.board.vo.*" %>
<% Board b = (Board)request.getAttribute("board"); %>
<%@ include file="/views/common/header.jsp" %>

    <div class="container">
      <ul class="progressbar">
        <li class="active">Step 1. 정보확인</li>
        <li>Step 2. 작성자 평가</li>
        <li>Step 3. 후기글 작성</li>
      </ul>
    </div>

<h2 style="margin:5%; text-align:center;">동행 정보 확인</h2>

<table id="info">
	<tr>
		<th>참여동행</th>
		<td><%=b.getWdTitle() %></td>
		<th>동행자 닉네임</th>
		<td><%=b.getMemberNo() %></td>
	</tr>
	<tr>
		<th>참여날짜</th>
		<td><%=b.getWdDate() %></td>
		<th>운동종목</th>
		<td><%=b.getWdCategory() %></td>
	</tr>
</table>
    
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
	  border: 1px solid #ddd;
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
	  color: blue;
	}
	.progressbar li.active:before {
	  border-color: blue;
	} 
/* 	.progressbar li.active + li:after {
	  background-color: green;
	} */

</style>

<%@ include file="/views/common/footer.jsp" %>