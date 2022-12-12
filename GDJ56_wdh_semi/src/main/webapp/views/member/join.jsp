<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<!-- Start Section -->

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
              <input type="button" value="중복확인" style="font-family:Jua;" >
            </td>
          </tr>
        <tr>
        <td >닉네임 </td>
            <td>
              <input type="text" id="nickname" placeholder="영문,숫자 5~11자"  style="font-variant-caps:unicase ;" size="25">
              <input type="button" value="중복확인" style="font-family:Jua;" >
            </td>
          </tr>
          <tr>
            <td> 비밀번호 </td>
            <td> <input type="password" id="password" placeholder="숫자,영문,특수문자 조합 최소 8자"  style="font-variant-caps:unicase ;" size="25"> </td>
          </tr>
  
          <tr>
            <td> 비밀번호 확인 </td>
            <td> <input type="password" placeholder="비밀번호 재입력" style="font-variant-caps:unicase ;" size="25">   *비밀번호를 다시입력하여주세요. </td>
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
              <select>
                <option> 직접입력 </option> 
                <option> naver.com </option>
                <option> daum.net </option>
                <option> nate.com </option>
                <option> gmail.com </option>
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
              <input type="text" id="address">
              <input type="button" value="주소찾기" style="font-family:Jua;"><br>
              <input type="text" id="address2">
            </td>
          </tr>

      </table>
  
      <br>
  
      <input type="button" value="가입하기" style="font-family:Jua;" id="modal">
      <input type="reset" value="취소하기" style="font-family:Jua;">
    </center>
  </div>
    <br><br>
    
    <script>
    $(function(){
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
				},error:function(e,r,m){
					console.log(e);
					console.log(r);
					console.log(m);
					
				}
	    	});
    	});
    })
    	
    
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
            <button type="button" class="btn btn-secondary" data-dismiss="modal" id="closeJoin">확인</button>
          </div>
        </div>
      </div>
    </div>

<%@include file="/views/common/footer.jsp"%>
