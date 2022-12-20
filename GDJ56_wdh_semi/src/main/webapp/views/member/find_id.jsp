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
			<p class="text 2"> ${findid2}</p>
		<input type="text" name="name" id="name" class="form_control" placeholder="이름" required="" autofocus="" style=" height: 55px; border-radius:20px; width:350px"><br><br>
	    
		<input type="email" name="email" id="email" class="form_control" placeholder="이메일" required="" style="height: 55px; width:350px; margin-bottom: -20px; border-radius:20px;">
			<p class="check" id="check">${check}</p><br>
			<input type="button" id="btnFindId" class="button" style="height: 55px; width: 184px; border-radius:20px;" value="아 이 디 찾 기">
			
	</div>

	</div>
	
		<div class="forgot" style="margin-top: 20px; margin-bottom: 20px;">
         <input type="button" class="button" onclick="location.href='<%=request.getContextPath() %>/member/findPw.do';" style="width:120px;" value="비밀번호 찾기">
         <input type="button" class="button" onclick="location.href='<%=request.getContextPath() %>/member/findId.do';" style="width:120px;" value="아이디 찾기">
         <input type="button" class="button" onclick="location.href='<%=request.getContextPath() %>/member/joinTerms.do';" style="width:120px;" value="회 원 가 입">
         </div>
       
	</section>
	</center>
	
	<!-- 아이디 찾은 후 팝업 -->
	 <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">아이디 찾기</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnX">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body" id="idSearchResult">
            당신의 아이디는 + MemberId 입니다.
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal" id="btnClose">확인</button>
          </div>
        </div>
      </div>
    </div>
    

   
    
    <script>
    $(function(){
    	$("#btnFindId").on("click",function(){
    		let d = {
    			"name" : $("#name").val(),
    			"email" : $("#email").val()
    		};
    		
		    $.ajax({
		    	url:"<%=request.getContextPath()%>/member/findIdActionServlet.do",
		    	data:d,
		    	type:"POST",
		    	dataType:"json",
		    	success:data=>{
		    		console.log(data);
		    		let memberId = data.memberId;
		    		if(memberId != "") {
		    			$("#idSearchResult").html("당신의 ID는 '" + memberId + "' 입니다.");
		    		} else {
		    			$("#idSearchResult").html("ID가 존재하지 않습니다.");
		    		}
		    		$("#exampleModal").modal("show");
		    		
		    	},error:function(e,r,m){
		    		console.log(e);
					console.log(r);
					console.log(m);
		    	}
		    });
    	});
    	
    	$("#btnClose, #btnX").on("click", function(){
    		$("#exampleModal").modal("hide");
    	});
    });
    
    </script>


<%@include file="/views/common/footer.jsp"%>