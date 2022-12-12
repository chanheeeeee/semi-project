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
	
	
	<div class="find_pw" style="height: 150px; position: relative; z-index: -1;">
		<img src="<%=request.getContextPath() %>/images/logo.png" style="height: 233px;"/>
	</div>
	
	<div class="pw_body">
	<form action="findpw" class="form-signin" method="post" >
		<p class="text 2"> ${findid2}</p>
		<input type="text" name="member_id" id="member_id" class="form-control" placeholder="아이디" style="height: 55px; border-radius:20px; width:350px" required><br>
		<input type="text" name="name" id="name" class="form-control" placeholder="이름"  autofocus="" style=" height: 55px; border-radius:20px; width:350px" required><br>
		<div style="width:19%;">
			<input type="email" name="email" id="email" class="form-control" placeholder="이메일"  style="float:left; height: 55px; width:245px; margin-bottom: -20px; border-radius:20px;" required> <input type="button" value="인증코드발송" style="font-family:Jua; height:55px; margin-left:10px;">
		</div>

		<div style="width:19%; margin-top: 25px;">
			<input type="email" name="check" id="check" class="form-control" placeholder="인증번호" style="float:left; height: 55px; width:245px; margin-bottom: -20px; border-radius:20px;" required> <input type="button" value="확인" style="font-family:Jua; height:55px; margin-left:10px;">
		</div>		

		<p class="checks" id="checks">${findpw_checkf}</p><br/>
		<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" style="font-family:'Jua';">비밀번호 찾기</button>
      </form>

	</div>
	
		<div class="forgot" style="margin-top: 20px; margin-bottom: 20px;">
	        <button type="button" onclick="location.href='<%=request.getContextPath() %>/member/findPw.do';" style="font-family:'Jua';border: outset;">비밀번호 찾기</button>
	        <button type="button" onclick="location.href='<%=request.getContextPath() %>/member/findId.do';" style="font-family:'Jua';border: outset;">아이디 찾기</button> 
	        <button type="button" onclick="location.href='<%=request.getContextPath() %>/member/joinMember.do';" style="font-family:'Jua';border: outset;">회 원 가 입</button> 
        </div>
    
	</section>
	</center>


<%@include file="/views/common/footer.jsp"%>