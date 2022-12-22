<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<!-- Start Section -->
	<!-- 주소 API 호출 스크립트 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- Start Section -->
  
        <style>
          form 
         {
          font-family:"Gamja Flower";
          font: size 14px;
          border-radius:8px;

         }

         td {color: #080909;}
          </style>
   
    
        <center>
        <div style="font-family:Jua;">
        <table bgcolor="#f5fafe" cellpadding="15">
        <tr>
        <td >아이디</td>
            <td>
              <input type="text" id="id" placeholder="영문,숫자 5~11자"  style="font-variant-caps:unicase ;" size="25">
              <font id="checkId" size = "2" ></font>
            </td>
          </tr>
         
        <tr>
        <td >닉네임 </td>
            <td>
              <input type="text" id="nickname"  placeholder="한글,숫자 2~7자"  style="font-variant-caps:unicase ;" size="25">
              <font id="checknick" size = "2" ></font>
            </td>
          </tr>
          <tr>
          			
            <td> 비밀번호 </td>
            <td> <input type="password" id="password" placeholder="숫자,영문 조합 최소 8자이상"  style="font-variant-caps:unicase ;" size="25"> 
            	<font id="pw" size="2"></font>
            </td>
          </tr>
  
          <tr>
            <td> 비밀번호 확인 </td>
            <td> 
            	<input type="password" placeholder="비밀번호 재입력" style="font-variant-caps:unicase ;" size="25" id=password_2> <br>
            	<font id="pwresult" size="2"></font>
            </td>
          </tr>
  
          <tr>
            <td> 이름 </td>
            <td> <input type="text" id="name"> </td>
          </tr>
  
          <tr>
            <td> 성별 </td>
            <td>
              <input type="radio" name="gender" value="M"> 남자
              <input type="radio" name="gender" value="F"> 여자
            </td>
          </tr>
  
          <tr>
            <td> 생년월일</td>
            <td>
              <label><input type="date" id="start"></label>
            </td>
          </tr>
  
          <tr>
            <td> 이메일 </td>
            <td>
              <input type="text" id="email"> @ <input type="text" id="email2"/> &nbsp;&nbsp; 
              <select id="mailSelect">
                <option value=""> 직접입력 </option> 
                <option value="naver.com"> naver.com </option>
                <option value="nate.com"> nate.com </option>
                <option value="gmail.com"> gmail.com </option>
              </select>
              <input type="button" value="인증코드발송" id="btn_join" style="font-family:Jua;">
              <div id="check_code" style="display:none">
              <input type="text" value="" id="join_code" placeholder="인증번호"><input type="button" value="확인" id="okay"> 
              <input type="hidden" id="codeAuth" value="">
            </div>
            </td>
          </tr>
  
         <tr>
            <td> 휴대폰 </td>
            <td>
            <select id="numberSelector">
              <option value="010">010</option>
              <option value="011">011</option>
              <option value="016">016</option>
              <option value="017">017</option>
             </select>
              - <input type="text" id="phone" size="6"> - <input type="text" id="phone2" size="6">
            </td>
		</tr>
          <tr>
            <td> 주소 <br> 상세주소 </td>
            <td>
              <input type="text" id="postcode" style="width:130px;" placeholder="우편번호"> <input type="button" value="주소찾기" style="font-family:Jua;" onclick="sample6_execDaumPostcode();"><br>
              <input type="text" id="address"><br>
              <input type="text" id="address2">
            </td>
          </tr>

      </table>
  
      <br>
  
      <input type="button" value="가입하기" style="font-family:Jua;" id="modal">
      <input type="reset" value="취소하기" style="font-family:Jua;">
      <form name="duplicateIdFrm">
      	<input type = "hidden" name="member_id" id="member_id">
      </form>
    </center>
  </div>
    <br><br>
    
    <script>
    $(function(){
    	//회원가입 버튼클릭시 아이디,닉네임,패스워드,이메일 유효성체크
    	//이유:아이디, 닉네임, 패스웓, 이메일 유효성 여부를 또 다시 통신하는것이 불필요하다.
    	let idCheck = false;
    	let nickCheck = false;
    	let pwdCheck = false;
    	let emailCheck = false;
    	
    	
    	$("#btn_join").on("click",function(){//이메일 인증
    		emailCheck = false;//인증후 이메일을 변경할 위험이 있기때문에 막아둠!
    		let email = $("#email").val();
    		let email2 = $("#email2").val();
    		let total = email + "@" + email2;
    		
    		if(email!="" && email2!=""){
    			$.ajax({
    				url:"<%=request.getContextPath()%>/member/joinEmailservlet.do",
    				data:{"email":total},
    				dataType:'json',
    				type:'POST',
    				success:function(result){
    					console.log(result);
    					$("#codeAuth").val(result.authNum);//보낸 인증번호와 입력할 인증번호 비교를 위해 hidden에 저장(보낸인증번호! 서블릿에서 키,벨류값을 확인!)
    					alert("인증번호가 전송되었습니다.");
    					$("#check_code").show();
    				}
    			});
    		}else{
    			alert("인증번호 전송이 실패되었습니다.")
    		}
    	});
    	
    	//확인 클릭시 일치여부 확인 이벤트
    	//저장한 인증번호(hidden=authNum)와 입력한 인증번호 일치여부 확인
    	$("#okay").on("click",function(){
    		let code = $("#join_code").val();
    		let code_check=$("#codeAuth").val();
    		console.log(code);
    		console.log(code_check);
    		if(code!=code_check){
    			alert("인증번호를 확인해주세요");
    			emailCheck=false;
    		}else{
    			alert("인증이 완료되었습니다.");
    			emailCheck=true;
    		}
    	});
    	
    	 //유효성검사
    	 
    	 //비밀번호 정규식
	    function pwvalid(){
		   	const password = $("#password").val();		//비밀번호값 가져오기
		   	let pwRule = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{8,20}$/;	//비밀번호 검사 정규식	
		   	let result = pwRule.test(password.trim());		//정규식 결과
		   	console.log(result);
		   	return result;		//정규식 결과 리턴
		}

	    //비밀번호 유효성
	    $("#password").keyup(function(){
	    	if(!pwvalid()){//test의 결과는 true or false로 나온다!`
	    		$("#pw").html('숫자,영문 조합 최소 8자이상.');
				$("#pw").attr('color','red');
	    	}else{
	    		$("#pw").html('');
				$("#pw").attr('color','green');
	    	}
	   	});
        //비밀번호 일치여부 확인
        $("#password_2").keyup(e=>{
        	
        	const pw = $("#password").val();
        	const pwck = $(e.target).val();
        	if(pwvalid()== true && pw==pwck){
        		$("#pwresult").css("color","green").text("비밀번호가 일치합니다.");
        		pwdCheck = true;
        	}else{
        		$("#pwresult").css("color","red").text("비밀번호가 일치하지 않습니다");
        		pwdCheck = false;
        	}
        });
    	 
        function allCheck(){
        	//아이디,닉네임,비밀번호,이메일
        	if(idCheck == false){
        		alert("아이디를 확인해주세요");
        		return false;//return false하면 반환되어 구문이 끝난다!
        	}
        	if(nickCheck == false) {
        		alert("닉네임을 확인해주세요");
        		return false;
        	}
        	if(pwdCheck == false){
        		alert("비밀번호를 확인해주세요");
        		return false;
        	}
        	//이름은 빈캆만 확인해주면된다!
        	if($("#name").val().trim()==""){
        		alert("이름을 확인해주세요");
        		return false;
        	}
        	//성별 유효성 체크
        	if($("input[name=gender]:checked").val()== undefined ){
        		alert("성별을 확인해주세요");
        		return false;
        	}
        	
        	//생년월일 빈값시 공백으로 나오기 때문에! 양쪽 빈칸값나올수 없기때문에 trim은 안써줘도 됨!
        	if($("#start").val()==""){
        		alert("생년월일을 확인해주세요");
        		return false;
        	}
        	if(emailCheck == false){
        		alert("이메일을 확인해주세요");
        		return false;
        	}
        	if($("#phone").val().trim()=="" || $("#phone2").val().trim()==""){
        		alert("휴대폰 번호를 확인해주세요");
        		return false;
        	}
        	if($("#postcode").val().trim()=="" || $("#address").val().trim()=="" || $("#address2").val().trim() == ""){
        		alert("주소를 확인해주세요");
        		return false;
        	}
        	return true;//이 모든 구문은 실행됬을때 반환값이 true일경우! 유효성 검사 allcheck가 성공된것을 의미!
        }
        
    	 //회원가입 + 인증번호 입력값이 일치할시도 추가! + 값이 하나라도 빈칸일경우!
    	$("#modal").on("click",function(){
    		if(allCheck() == true){//allCheck true! 모든 유효성검사가 성공이 되면 회원가입이 완료된것을 의미! 
    			let d = {
    	    			"member_id" : $("#id").val(),
    	    			"member_nickname" : $("#nickname").val(),
    	    			"name" : $("#name").val(),
    	    			"password" : $("#password").val(),
    	    			"gender" : $("input[name=gender]:checked").val(),	//라디오버튼일때 현재 선택된 라디오버튼의 value 값을 가져옴
    	    			"birth" : $("#start").val(),
    	    			"email" : $("#email").val() + "@" + $("#email2").val(),
    	    			"phone" : $("#numberSelector").val() + "-" + $("#phone").val() + "-" + $("#phone2").val(),
    	    			"address" : $("#address").val() + " " + $("#address2").val(),
    	    			"grade" : 1
   	    		};
   	    		
   		    	$.ajax({
   					url:"<%=request.getContextPath()%>/member/joinAction.do",
   					data:d,
   					type:"POST",
   					dataType:"json",
   					success:data=>{
   						console.log(data);
   						
   						if(data > 0) {//회원가입 성공시
   							$("#exampleModal").modal("show");
   						} else {
   							$("#exampleModal2").modal("show");
   						}
   					},error:function(e,r,m){
   						console.log(e);
   						console.log(r);
   						console.log(m);
   					}
   		    	});
    		}
    	});
    	
    	//취소하기 클릭 이벤트
    	$("#closeJoin").on("click", function() {
    		location.href="<%=request.getContextPath()%>/main.do";
    	});
    	
    	//이메일 내 SelectBox 변경이벤트
    	$("#mailSelect").on("change", function() {
    		let mainSelect = $("#mailSelect").val();
    		$("#email2").val(mainSelect);
    		
    		if(mainSelect == "") {
    			$("#email2").attr("readonly", null);
    		} else {
    			$("#email2").attr("readonly", "readonly");
    		}
    	});
    	
    	
	    //아이디 유효성
	    function idvalid(){
		   	const memberId = $("#id").val();		//아이디값 가져오기
		   	let idRule = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{5,11}$/;	//아이디 검사 정규식	
		   	let result = idRule.test(memberId.trim());		//정규식 결과
		   	console.log(result);
		   	return result;		//정규식 결과 리턴
		}


	    //아이디  중복확인 및 유효성
	    $("#id").focusout(function(){//포커스아웃으로 이벤트 설정
	    	let memberId = $("#id").val();//input_id에 입력되는 값
	    	if(!idvalid()) {
	    		$("#checkId").html('아이디는 영문,숫자 포함 5~11자입니다.');
				$("#checkId").attr('color','red');
				if($("#id").val().trim()==""){
		    		$("#checkId").html('');
				}
	    	}else{
	        	$.ajax({
	        		url:"<%=request.getContextPath()%>/member/idduplicate.do",//비동식통신도 통신이므로 서블릿 필수!
	        		data:{memberId:memberId},
	        		type:"POST",//걍외워
	        		//dataType:"json",//제이슨 타입
	        		success : result=>{
	        			console.log(result);
	        			if(result=="불가능"){
	        				$("#checkId").html('이미 사용중인 아이디입니다.');
	        				$("#checkId").attr('color','red');
	        				idCheck = false;
	        			}else{
	        				$("#checkId").html('사용할 수 있는 아이디입니다.');
	        				$("#checkId").attr('color','green');
	        				idCheck = true;
	        			}
	        		},
	        		error:function(e,r,m){
	    				console.log(e);
	    				console.log(r);
	    				console.log(m);
	        		}
	        	});
	    	}
	    });
	    
	  //닉네임 유효성 및 중복확인
	    function nickvalid(){
		   	const nickname = $("#nickname").val();		//닉네임값 가져오기
		   	let nickRule = /^([ㄱ-ㅎ|가-힣|0-9|]){2,7}$/;	//닉네임 검사 정규식	
		   	let result = nickRule.test(nickname.trim());		//정규식 결과
		   	console.log(result);//정규식 잘들어가는지 확인 
		   	return result;		//정규식 결과 리턴
		}

	    $("#nickname").focusout(function(){	
	    	let nickname = $("#nickname").val();
	    	if(!nickvalid()){
	    		$("#checknick").html('닉네임은 한글,숫자 포함 2~7자입니다.');
				$("#checknick").attr('color','red');
				if($("#nickname").val().trim()==""){
					$("#checknick").html('');
				}
	    	}else{//만약 nickvalid가 false이면 위에 구문이 실행될것이며
	    		$.ajax({//아닐시 ajax구문을 실행되는데
		    		url:"<%=request.getContextPath()%>/member/nicknameDuplicate.do",
		    		data:{nickname:nickname},
		    		type:'POST',
		    		success:result=>{
		    			if(result=="불가능"){//결과값이 0보다 작으면(실패) 
		    				$("#checknick").html('이미 사용중인 닉네임입니다.');
		    				$("#checknick").attr('color','red')
		    				nickCheck=false;//닉네임 유효성 실패
		    				
		    			}else{//결과값이 0보다 크면(성공)
		    				$("#checknick").html('사용할 수 있는 닉네임입니다.');
		    				$("#checknick").attr('color','green');
		    				nickCheck = true;//닉네임 유효성 성공
		    			}
		    		},
		    		error:function(e,r,m){
						console.log(e);
						console.log(r);
						console.log(m);
		    			
		    		}
		    	});
	    	}
	    	
	    	});
    	});//onload
	    //구문은 처음부터 차례차례 진행되기때문에 어떻게 진행될지 순서를 파악하자!->주석주석!
	  
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    /* document.getElementById("sample6_extraAddress").value = extraAddr; */
	                
	                } else {
	                    /* document.getElementById("sample6_extraAddress").value = ''; */
	                }
	                
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("address2").focus();
	            }
	        }).open();
	    }
    

    
    </script>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">회원가입</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            회원가입을 축하드립니다.
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal" id="closeJoin">확인</button>
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">회원가입</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body text-danger">
            회원가입에 실패하였습니다. 데이터를 정확히 입력하였는지 확인해주세요.
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal" id="closeJoin">확인</button>
          </div>
        </div>
      </div>
    </div>

<%@include file="/views/common/footer.jsp"%>
