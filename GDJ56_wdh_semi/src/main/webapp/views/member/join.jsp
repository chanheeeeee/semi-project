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
        <td >아이디 </td>
            <td>
              <input type="text" id="id" placeholder="영문,숫자 5~11자"  style="font-variant-caps:unicase ;" size="25">
              <input type="button" value="중복확인" style="font-family:Jua;" onclick="fn_idduplicate();" >
            </td>
          </tr>
          <script>
          	const fn_idduplicate=()=>{
          		const memberId = $("#id").val();
          		if(memberId.trim().length<5){
          			alert('아이디는 영문,숫자 포함 5~11자 입니다.');
          			$("#id").val('');
          			$("#id").focus();
          			
          		} else{
          			//팝업 생성 방법
          			$("#member_id").val(memberId);		//ID값을 넣음
          			const title = "idDuplicateFrm";
          			open("","idDuplicateFrm","width=300,height=300");
          			duplicateIdFrm.method="post";
          			duplicateIdFrm.action="<%=request.getContextPath()%>/member/idduplicate.do";
          			duplicateIdFrm.target=title;
          			duplicateIdFrm.submit();
          		}
          	}
          </script>
        <tr>
        <td >닉네임 </td>
            <td>
              <input type="text" id="nickname"  placeholder="한글,숫자 2~7자"  style="font-variant-caps:unicase ;" size="25">
              <input type="button" value="중복확인" style="font-family:Jua;" onclick="fn_idduplicate2();" >
            </td>
          </tr>
          <tr>
          
          <script>
          	const fn_idduplicate2=()=>{
          		const nickname = $("#nickname").val();
          		if(nickname.trim().length<2){
          			alert('닉네임은 한글,숫자 포함 2~7자 입니다.');
          			$("#nickname").val('');
          			$("#nickname").focus();
          			
          		} else{
          			//팝업 생성 방법
          			$("#member_id").val(nickname);		//닉네임값을 넣음
          			const title = "nickDuplicateFrm";
          			open("","nickDuplicateFrm","width=300,height=300");
          			duplicateIdFrm.method="post";
          			duplicateIdFrm.action="<%=request.getContextPath()%>/member/nickDuplicate.do";
          			duplicateIdFrm.target=title;
          			duplicateIdFrm.submit();
          		}
          	}
          </script>
            <td> 비밀번호 </td>
            <td> <input type="password" id="password" placeholder="숫자,영문,특수문자 조합 최소 8자"  style="font-variant-caps:unicase ;" size="25"> </td>
          </tr>
  
          <tr>
            <td> 비밀번호 확인 </td>
            <td> 
            	<input type="password" placeholder="비밀번호 재입력" style="font-variant-caps:unicase ;" size="25" id=password_2> <br>
            	<span id="pwresult"></span>
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
              010 - 
              <input type="text" id="phone" size="6"> - <input type="text" id="phone2" size="6">
            </td>
		</tr>
          <tr>
            <td> 주소 <br> 상세주소 </td>
            <td>
              <input type="text" id="postcode" style="width:130px;" placeholder="우편번호"> <input type="button" value="주소찾기" style="font-family:Jua;" onclick="execDaumPostcode()"><br>
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
        //1.비밀번호 일치여부 확인
        $("#password_2").keyup(e=>{
        	const pw = $("#password").val();
        	const pwck = $(e.target).val();
        	if(pw==pwck){
        		$("#pwresult").css("color","green").text("비밀번호가 일치합니다.");
        	}else{
        		$("#pwresult").css("color","red").text("비밀번호가 일치하지 않습니다");
        	}
        });
    	 
    	 
    	$("#modal").on("click",function(){
    		
    		let d = {
    			"member_id" : $("#id").val(),
    			"member_nickname" : $("#nickname").val(),
    			"name" : $("#name").val(),
    			"password" : $("#password").val(),
    			"gender" : $("input[name=gender]").val(),
    			"birth" : $("#start").val(),
    			"email" : $("#email").val() + "@" + $("#email2").val(),
    			"phone" : "010-" + $("#phone").val() + "-" + $("#phone2").val(),
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
					
					if(data > 0) {
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
    });
    
    function execDaumPostcode() {
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
