<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="<%=request.getContextPath() %>/mypage/about.do">
                <span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" id="profile" src="<%=request.getContextPath() %>/assets/img/pocha.jpg" alt="..."
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
                    <form class="form-horizontal">
                      <div class="form-group row">
                        <label for="inputName" class="col-sm-2 col-form-label">아이디</label>
                        <div class="col-sm-10">
                          <input type="email" class="form-control" id="inputName" placeholder="Id" readonly>
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
                          <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                          <label class="form-check-label" for="flexRadioDefault1">
                            여
                          </label>
                        </div>
                        <div class="col-sm-10" style="margin-left: 20px;">
                          <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
                          <label class="form-check-label" for="flexRadioDefault2">
                            남
                          </label>
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
                        <div class="col-sm-10">
                          <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputName2" class="col-sm-2 col-form-label">닉네임</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" id="inputName2" placeholder="Name">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputExperience" class="col-sm-2 col-form-label">주소</label>
                        <div class="col-sm-10">
                          	<div style="float:left;"><input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호"></div>
							<input type="button" class="btn btn-xs btn-lblue2 min-42" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							<input type="text" class="form-control" id="sample6_address" placeholder="주소">
							<input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소">
							<input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목">
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="inputSkills" class="col-sm-2 col-form-label">번호</label>
                        <div class="col-sm-6">
                          <select class="form-control" id="phone1" style="width: 60px; display: inline-block">
                            <option value="">선택</option>
                            <option value="011">010</option>
                            <option value="016">011</option>
                            <option value="017">016</option>
                            <option value="019">017</option>
                            <option value="010">019</option>
                        </select>
                        - <input type="text" class="form-control" id="phone2" size="4" maxlength="4" style="width: 60px; display: inline-block;" />
                        - <input type="text" class="form-control" id="phone3" size="4" maxlength="4" style="width: 60px; display: inline-block" />
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
                          <button type="submit" class="btn btn-danger">저장</button>
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
		                    document.getElementById("sample6_extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("sample6_extraAddress").value = '';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample6_postcode').value = data.zonecode;
		                document.getElementById("sample6_address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("sample6_detailAddress").focus();
		            }
		        }).open();
		    }
		</script>
		
		<!-- 비밀번호 변경 -->
		<script>
			const fn_updatePassword=()=>{
				//새창으로 패스워드 수정페이지 연결
				open("updatePassword.jsp",
						"_blank","width=400,height=210");
				
			}
		</script>


    <!-- Bootstrap core JS-->
    <script src="<%=request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath() %>/assets/js/scripts.js"></script>
    
<%@ include file="/views/common/footer.jsp" %>