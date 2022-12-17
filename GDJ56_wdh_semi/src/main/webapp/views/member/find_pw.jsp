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
				<input type="email" name="check" id="check" class="form-control" placeholder="인증번호" style="height: 55px; border-radius:20px; width:280px;margin-left: -1px;"  required>
				<input type="hidden" id="find" value="">
			</td>
			<td>
				<input type="button" value="인증확인" id="code_check" style="font-family:Jua; height:55px; margin-left:10px;">
			</td>
		</tr>
	</table>





    
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
				success:function(result){
					console.log(result);
					//메일로 보내진 인증번호를 가져와 인증번호 칸과 동일한지 확인해야한다
					//보낸인증번호와 일치한지를 알아보려면 일단 인증번호의 값을 어딘가에(input hidden) 저장한다
					$("#find").val(result.authNum);
					alert("인증번호가 전송되었습니다.");
				}
			});
		}else{
			alert("빈칸을 채워주세요");
		}
	});
	 	//저장한 인증번호와 입력한 인증번호 일치여부 확인
	 	$("#code_check").on("click",function(){
	 		let code = $("#check").val();//입력한 인증번호 값 가져오기
	 		let code_check = $("#find").val();//히든 입력한값 가져오기
	 		
	 		if(code!=code_check){
	 			alert("인증번호가 일치하지 않습니다.");
	 		}else{
	 			location.href="<%=request.getContextPath()%>/member/repassword.do";
	 		}
	 	});
	
	
	</script>


<%@include file="/views/common/footer.jsp"%>