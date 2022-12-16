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
	
	<p class="text 2"> ${findid2}</p>
	<table>
		<tr>
			<td colspan="2">
				<input type="text" name="member_id" id="member_id" class="form-control" placeholder="아이디"  autofocus="" style="height: 55px; border-radius:20px; width:280px" required><br>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="text" name="name" id="name" class="form-control" placeholder="이름"  style=" height: 55px; border-radius:20px; width:280px" required>
			</td>
		</tr>
		<tr>
			<td>
				<input type="email" name="email" id="email" class="form-control" placeholder="이메일"  style="height: 55px; border-radius:20px; width:280px;margin-left: -1px;" required>
			</td>
			<td>
				<input type="button" id="btn_email" value="메일인증">
			</td>
		</tr>
		<tr>
			<td>
				<input type="email" name="check" id="check" class="form-control" placeholder="인증번호" style="height: 55px; border-radius:20px; width:280px;margin-left: -1px;" required>
			</td>
			<td>
				<input type="button" value="확인" style="font-family:Jua; height:55px; margin-left:10px;">
			</td>
		</tr>
	</table>
	<p class="checks" id="checks">${findpw_checkf}</p><br/>
	<input type="button" id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" style="font-family:'Jua';width: 200px;margin-bottom: 20px;margin-left: -40px;" value="비밀번호 찾기">





    
	</section>
	</center>
	
	<script>
	$("#btn_email").on("click",function(){
		let id = $("#member_id").val();
		let name = $("#name").val();
		let email = $("#email").val();
		
		
		if(id!="" && name!="" && email!=""){
			$.ajax({
				url:"<%=request.getContextPath()%>/member/authSendCode.do",
				data:{"member_id":id, "name":name, "email":email},
				dataType:'json',
				type:'POST',
				success : result=>{
					console.log(result);
					
					
/* 					isSuccess 인증번호가 날라갔으면 y
					authNum 인증번호
					password  비밀번호*/

					/*
					내일 할일
					인증번호 넣고 확인 버튼 클릭시 인증번호가 일치할 경우 비밀번호 출력 / 일치하지 않으면 인증번호 다시 입력 하라고 하거나, 중복확인 다시 하도록 함 
					빈값있으면 alert 띄워주기
					
					*/
					
					
				}
			});
			
		}
	})
	
	
	</script>


<%@include file="/views/common/footer.jsp"%>