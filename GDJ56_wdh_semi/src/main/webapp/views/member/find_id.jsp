<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


<style>

	div.forgot > button {
        margin-right: 20px;
        padding: 5px 15px 5px 15px;
        font-size: 20px;
      }
      
	
    </style>


	<center>
	<section>
	
	
	<div class="find_id" style="height: 220px;">
		<img src="<%=request.getContextPath() %>/images/logo.png" style="height: 300px;"/>
	</div>
	
	<div class="id_body">
	<form action="findid" class="form-signin" method="post">
			<p class="text 2"> ${findid2}</p>
		<input type="text" name="name" id="name" class="form_control" placeholder="이름" required="" autofocus="" style=" height: 55px; border-radius:20px; width:350px"><br><br>
	    
		<input type="email" name="email" id="email" class="form_control" placeholder="이메일" required="" style="height: 55px; width:350px; margin-bottom: -20px; border-radius:20px;">
			<p class="check" id="check">${check}</p><br>
			<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" style="height: 65px; width: 184px; border-radius:20px;">아 이 디 찾 기</button>
			
	</form>

	</div>
	
		<div class="forgot" style="margin-top: 20px; margin-bottom: 20px;">
         <button type="button" onclick="location.href='<%=request.getContextPath() %>/member/findPw.do';" style="font-family: Jua;border: outset;">비밀번호 찾기</button>
         <button type="button" onclick="location.href='<%=request.getContextPath() %>/member/findId.do';" style="font-family:'Jua';border: outset;">아이디 찾기</button> 
         <button type="button" onclick="location.href='<%=request.getContextPath() %>/member/joinMember.do';" style="font-family:'Jua';border: outset;">회 원 가 입</button> 
         </div>
    
       
	</section>
	</center>


<%@include file="/views/common/footer.jsp"%>