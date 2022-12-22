<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.wdh.challenge.model.vo.Challenge" %>

<%
	Challenge ch=(Challenge)request.getAttribute("ch");
%>

<%@ include file="/views/common/header.jsp" %>
<style>
	div#tb-board{
		display:flex;
		flex-direction: column;
		justify-content:center;
		align-items: center;
	}
	table#tb-challenge{
		width:60%;
		height:400px;
		text-align:center;
	}
	div#tb-board>h2{
		margin-top:6%;
		margin-bottom: 6%;
	}

 #test_btn1{
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            /* margin-right:-4px; */
        }
        #test_btn2{
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;    
            /* margin-left:-3px; */
        }
        #test_btn3{
        }
   	
        #btn_group button{
            border: 1px solid skyblue;
            background-color: rgba(0,0,0,0);
            color: skyblue;
            padding: 5px;
        }
        #btn_group button:hover{
            color:white;
            background-color: cornflowerblue;
        }
        
</style>
        
<div id="tb-board">
		<h2><strong>이번달 챌린지와 함께 운동행</strong></h2>    
   			<table id="tb-challenge">
				<tr style="background-color:write; ">
					<td colspan="2">
						<img src="<%=request.getContextPath()%>/upload/challenge/<%=ch.getChallenge_img() %>" 
						width="600px" height="600px">
					</td>
				</tr>
				<tr>
					<th style="background-color:write; color:royalblue; ">제 목</th>
					<td style="background-color:write; color:royalblue; "><%=ch.getChallenge_name() %></td>
				</tr>
   				<tr>
   					<th style="background-color:write; color:royalblue; ">시작일</th>
   					<td style="background-color:write; color:royalblue; "><%=ch.getChallenge_date() %></td>
   				</tr>
   				<tr>
   					
   				</tr>
   			</table>
   			<div id="btn_group">
   						<button id="test_btn3" onclick="location.href='<%=request.getContextPath()%>/challenge/attanceChallenge.do?challenge_no=<%=ch.getChallenge_no()%>';">신청하기</button>
   					
   					</div>
   			<br>
   	</div>
   	<%@ include file="/views/common/footer.jsp" %>	