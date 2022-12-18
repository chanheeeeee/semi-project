<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<%
	Member m = (Member)request.getAttribute("member"); 
%>

<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="<%=request.getContextPath() %>/mypage/about.do">
                <span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2 profile" src="<%=request.getContextPath() %>/assets/img/pocha.jpg" alt="..."
                							style="width: 200px; height: 200px;" /></span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/about.do#about'>내 정보</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/lockscreen.do'>정보수정</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/mycontent.do'>내 활동</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/diary.do'>다이어리</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/leave.do'>탈퇴</a></li>
                </ul>
            </div>
        </nav>

<!-- Page Content-->
        <div class="container-fluid p-0">
        
            <!-- 정보수정 -->
            <section class="resume-section" id="update">
                    <div class="tab-pane" id="settings" style="width: 700px; border: 1px solid gray; padding: 20px">
  
  			<!-- 폼 시작 -->
                    <form class="form-horizontal" id="updateMemberFrm" action="<%= request.getContextPath() %>/mypage/updateMemberEnd.do"
    			method="post" >
                      <div class="form-group row">
                        <label for="inputName" class="col-sm-2 col-form-label">아이디</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" id="inputName" value="<%= m.getMember_id() %>" readonly>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputSkills" class="col-sm-2 col-form-label">비밀번호</label>
                        <div class="col-sm-10">
                          <!-- <input type="text" class="form-control" id="inputPassword" placeholder="Password"> -->
                          <input type="button" class="btn btn-xs btn-lblue2 min-42" value="비밀번호변경" onclick="fn_updatePassword();"/>
                        </div>
                        
                      </div>

                      <div class="form-group row">
                        <label for="inputSkills" class="col-sm-6">성별</label>
                        <div class="col-sm-10" style="margin-left: 20px;">
                        <% if(m.getGender()=='F') { %>
                          <input class="form-check-input" type="radio" name="gender" value="F" checked>
                         <% } else { %>
                         <input class="form-check-input" type="radio" name="gender" value="F" >
                         <% } %>
                          <label class="form-check-label" for="flexRadioDefault1">
                            여
                          </label>
                        </div>
                        <div class="col-sm-10" style="margin-left: 20px;">
                          <% if(m.getGender()=='M') { %>
                          <input class="form-check-input" type="radio" name="gender" value="M" checked>
                         <% } else { %>
                         <input class="form-check-input" type="radio" name="gender" value="M" >
                         <% } %>
                          <label class="form-check-label" for="flexRadioDefault2">
                            남
                          </label>
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
                        <div class="col-sm-10">
                          <input type="email" class="form-control" name="email" id="inputEmail" value="<%= m.getEmail() %>">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputName2" class="col-sm-2 col-form-label">닉네임</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="nickname" id="nickname" value="<%= m.getMember_nickname() %>">
                        	<font id="checknick" size = "2" ></font>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputExperience" class="col-sm-2 col-form-label">주소</label>
                        <div class="col-sm-10">
                          	<div style="float:left;"><input type="text" class="form-control" id="postcode" placeholder="우편번호"></div>
							<input type="button" class="btn btn-xs btn-lblue3 min-42" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							<input type="text" class="form-control" id="address" placeholder="주소" name="address">
							<input type="text" class="form-control" id="address2" placeholder="상세주소" name="address2">
							
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="inputSkills" class="col-sm-2 col-form-label">번호</label>
                        <div class="col-sm-6">
                          <select class="form-control" id="phone1" style="width: 60px; display: inline-block" name="phone1">
                            <option value="<%= m.getPhone().substring(0, 3) %>"><%= m.getPhone().substring(0, 3) %></option>
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="017">017</option>
                            <option value="019">019</option>
                        </select>
                        - <input type="text" class="form-control" id="phone2" name="phone2" size="4" maxlength="4" style="width: 60px; display: inline-block;" value="<%= m.getPhone().substring(4, 8) %>" />
                        - <input type="text" class="form-control" id="phone3" name="phone3" size="4" maxlength="4" style="width: 60px; display: inline-block" value="<%= m.getPhone().substring(9, 13) %>" />
                        <!-- <input type="text" class="form-control" id="inputPhone" placeholder="Phone"> -->
                        </div>
                      </div>

                      <div class="form-group row">
                        <div class="offset-sm-2 col-sm-10">
                          <div class="checkbox">
                            <label>
                              
                            </label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group row">
                        <div class="offset-sm-2 col-sm-10">
                          <input type="submit" class="btn btn-danger" value="저장">
                        </div>
                      </div>
                    </form>
                  </div>
            </section>

        </div>
        
        <!-- 주소 api -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>

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
		
		<!-- 변경 시 스크립트 -->
		<script>
			const fn_updatePassword=()=>{
				//새창으로 패스워드 수정페이지 연결
				open("<%= request.getContextPath() %>/mypage/updatePassword.do",
						"_blank","width=400,height=210");
				
			}
			
			<%-- const fn_updateMember=()=>{
				$("#updateMemberFrm").attr("action",
						"<%=request.getContextPath()%>/mypage/updateMemberEnd.do");
				$("#updateMemberFrm").submit();
				
			} --%>
			
			$(function(){
		    	//회원가입 버튼클릭시 아이디,닉네임,패스워드,이메일 유효성체크
		    	//이유:아이디, 닉네임, 패스웓, 이메일 유효성 여부를 또 다시 통신하는것이 불필요하다.
		    	let idCheck = false;
		    	let nickCheck = false;
		    	let pwdCheck = false;
		    	let emailCheck = false;
		    	 
		        /* function allCheck(){
		        	//아이디,닉네임,비밀번호,이메일
	
		        	if(nickCheck == false) {
		        		alert("닉네임을 확인해주세요");
		        		return false;
		        	}
	
		        	if(emailCheck == false){
		        		alert("이메일을 확인해주세요");
		        		return false;
		        	}
		 
		        	if($("#postcode").val().trim()=="" || $("#address").val().trim()=="" || $("#address2").val().trim() == ""){
		        		alert("주소를 확인해주세요");
		        		return false;
		        	}
		        	
		        	return true;//이 모든 구문은 실행됬을때 반환값이 true일경우! 유효성 검사 allcheck가 성공된것을 의미!
		        } */
		        

			    
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
				    			if(result=="불가능" && nickname != <%= m.getMember_nickname() %>){//결과값이 0보다 작으면(실패) 
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
		
		</script>


    <!-- Bootstrap core JS-->
    <script src="<%=request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath() %>/assets/js/scripts.js"></script>
    
<%@ include file="/views/common/footer.jsp" %>