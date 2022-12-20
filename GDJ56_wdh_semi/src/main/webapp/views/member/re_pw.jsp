<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


<style>

	div.forgot > button {
        margin-right: 20px;
        padding: 5px 15px 5px 15px;
        font-size: 20px;
      }
      .button {
		  width: 80px;
		  height: 35px;
		  font-family: 'Roboto', sans-serif;
		  font-size: 14px;
		  text-transform: uppercase;
		  letter-spacing: 2.5px;
		  font-weight: 500;
		  color: #000;
		  background-color: rgba(223, 223, 223, 0.422);
		  border: none;
		  border-radius: 45px;
		  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		  transition: all 0.3s ease 0s;
		  cursor: pointer;
		  outline: none;
		  }
		
		.button:hover {
		  background-color: #2e93e5af;
		  box-shadow: 0px 15px 20px #6dbcfcaf;
		  color: #fff;
		  transform: translateY(-7px);
		}
      
    </style>

	<center>
	<section>
	<div class="find_id" style="height: 220px;">
		<img src="<%=request.getContextPath() %>/images/logo.png" style="height: 300px;"/>
	</div>
	
	<div class="id_body">
		<div class="form-signin">
			<b><p class="text 2" style="font-size:11px; text-align:center; color:blue; ">**비밀번호는 숫자,영문 조합 최소 8자이상이여야 합니다**</p></b>
			<input type="password" name="name" id="new_pw" class="form_control" placeholder="새비밀번호" required="" autofocus="" style=" height: 55px; border-radius:20px; width:220px"><br>
			<font id="new_pw_result" size="2"></font><br>
			<input type="password" name="email" id="check_newpw" class="form_control" placeholder="새비밀번호 확인" required="" style="height: 55px; width:220px; border-radius:20px;"><br>
			<font id="check_newpw_result" size="2"></font>
				<p class="check" id="check">${check}</p>
				<input type="button" id="btnFindPw" class="button" style="height: 65px; width: 184px; border-radius:20px; margin-bottom:25px " value="저  장  하  기">
				<input type="hidden" id="saveId" value="<%=request.getParameter("member_id") %>">
		</div>
	</div>
	</section>
	</center>
	

	
	<!-- 비밀번호 찾은 후 팝업 -->
	 <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">비밀번호 저장</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnX">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body" id="idSearchResult">
            비밀번호 변경완료! 변경된 비밀번호로 로그인하세요.
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal" id="btnClose">확인</button>
          </div>
        </div>
      </div>
    </div>
    

   
    
    <script>
    $(function(){//저장하기 버튼을 눌렀을 경우의 새비밀번호와 새비밀번호가 서로 일치한지의 유효성 검사
    	$("#btnFindPw").on("click",function(){//저장하기 버튼을 누르면 발생하는 이벤트 함수
			const pw = $("#new_pw").val();//새로운비밀 가져와
	   		const pwck = $("#check_newpw").val();//새로운비밀 확인 가져와
	   		if(pw==pwck){//새로운비밀과 새로운비밀창이 서로 같으면
	   			const saveId = $("#saveId").val();
						
			    $.ajax({//.ajax시작
			    	url:"<%=request.getContextPath()%>/member/repasswordAction.do",
			    	data:{"newPw":pw, "saveId":saveId},//새로운 비밀번호만 넘기면 된다!
			    	type:"POST",
			    	dataType:"json",
			    	success:data=>{
			    		console.log(data);
			    		if(data.result>0){
			    			$("#idSearchResult").html("비밀번호 변경완료! 변경된 비밀번호로 로그인하세요.");
			    			$("#exampleModal").modal("show");
			    			
			    		}else{
			    			alert("입력한 값이 서로 다릅니다.다시한번 확인 부탁드립니다.");
			    		}
			    		
			    	},error:function(e,r,m){
			    		console.log(e);
						console.log(r);
						console.log(m);
			    	}
			    });
	   			
	   		}
    	});
    	$("#btnClose").on("click",function(){
    		location.href="<%=request.getContextPath()%>/member/loginMember.do";
    	})
    
    	$("#btnX").on("click", function(){
    		$("#exampleModal").modal("hide");
    	});
    });
    
    function repw(){
    	//정규식
    	const password = $("#new_pw").val();
    	let pwRule =  /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{8,20}$/;//정규식
    	let result = pwRule.test(password.trim());
    	return result;
    }
    	//비밀번호 유효성
    	$("#new_pw").keyup(function(){
    		if(!repw()){
    			$("#new_pw_result").html('숫자,영문 조합 최소 8자이상');
    			$("#new_pw_result").attr('color','red');
    		}else{
    			$("#new_pw_result").html('');
    			$("#new_pw_result").attr('color','green');
    		}
    	});
    	
    	//새비밀번호 일치여부
    	$("#check_newpw").keyup(e=>{
    		const pw = $("#new_pw").val();
    		const pwck = $(e.target).val();
    		if(repw()==true && pw==pwck){
    			$("#check_newpw_result").css("color","green").text("비밀번호가 일치합니다.");
    		}else{
    			$("#check_newpw_result").css("color","red").text("비밀번호가 일치하지 않습니다");
    		}
    		
    	});
    
    </script>


<%@include file="/views/common/footer.jsp"%>