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
	<table style="margin-right:-70px">
		<tr>
			<td colspan="2">
			<form name="submitId">
				<input type="text" name="member_id" id="member_id" class="form-control" placeholder="아이디"  autofocus="" style="height: 55px; border-radius:20px; width:280px" required>
			</form>
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
				<input type="button" id="btn_email" value="메일인증" class="button" >
			</td>
		</tr>
		<tr id="trAuth" style="display:none">
			<td>
				<input type="email" name="check" id="check" class="form-control" placeholder="인증번호" style="height: 55px; border-radius:20px; width:280px;"  required>
				<input type="hidden" id="find" value="">
			</td>
			<td>
				<input type="button" class="button" value="인증확인" id="code_check" >
			</td>
		</tr>
	</table>
	<div class="forgot " style="margin-top: 20px; margin-bottom: 20px;">
         <input type="button" class="button" onclick="location.href='<%=request.getContextPath() %>/member/findPw.do';" style="width:110px;" value="비밀번호 찾기">
         <input type="button" class="button" onclick="location.href='<%=request.getContextPath() %>/member/findId.do';" style="width:110px;" value="아이디 찾기">
         <input type="button" class="button" onclick="location.href='<%=request.getContextPath() %>/member/joinTerms.do';" style="width:110px;" value="회 원 가 입">
	</div>




    
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
					if(result.isSuccess == "Y"){
						$("#find").val(result.authNum);
						alert("인증번호가 전송되었습니다.");
						$("#trAuth").show();
					}else{
						alert("인증번호 전송이 실패하였습니다.");
					}
				}
			});
		}else{
			alert("내용을 입력해주세요.");
		}
	});
	 	//저장한 인증번호와 입력한 인증번호 일치여부 확인
	 	$("#code_check").on("click",function(){
	 		let code = $("#check").val();//입력한 인증번호 값 가져오기
	 		let code_check = $("#find").val();//히든 입력한값 가져오기
	 		
	 		if(code!=code_check){
	 			alert("인증번호를 확인해주세요.");
	 		}else if(code_check == ""){
	 			alert("인증을 진행해주세요.");	
	 		}else{
	 			//폼테그로 id값을 submit 해주기 위한 구문으로써 비밀번호 재설정시 어떤아이디의 비밀번호를 변경하는지 DB에 저장하기 위한 방법
	 			//1.폼테그 및 hidden으로 인풋값을 작성하여 준다
	 			submitId.method="post";//폼테그 메소드는 post방식
	 			submitId.action="<%=request.getContextPath()%>/member/repassword.do";
	 			submitId.submit();
	 			
	 			
	 		}
	 	});
	
	
	</script>


<%@include file="/views/common/footer.jsp"%>