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
              <input type="radio" name="gender" value="M" checked> 남자
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
              <input type="button" value="인증코드발송" style="font-family:Jua;">
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
        	}else{
        		$("#pwresult").css("color","red").text("비밀번호가 일치하지 않습니다");
        	}
        });
    	 
    	 //회원가입
    	$("#modal").on("click",function(){
    		
    		let d = {
    			"member_id" : $("#id").val(),
    			"member_nickname" : $("#nickname").val(),
    			"name" : $("#name").val(),
    			"password" : $("#password").val(),
    			"gender" : $("input[name=gender]").val(),
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
	        				$("#checkId").attr('color','red')
	        			}else{
	        				$("#checkId").html('사용할 수 있는 아이디입니다.');
	        				$("#checkId").attr('color','green');
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
		    				
		    			}else{//결과값이 0보다 크면(성공)
		    				$("#checknick").html('사용할 수 있는 닉네임입니다.');
		    				$("#checknick").attr('color','green');
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
