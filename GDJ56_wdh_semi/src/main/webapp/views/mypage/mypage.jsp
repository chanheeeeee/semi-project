<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<% 
	Member m = (Member)request.getAttribute("member"); 
	String grade = (String)request.getAttribute("grade");
%>

		<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="<%=request.getContextPath() %>/mypage/about.do">
                <span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2 profile" src="<%= m.getProfile() %>" alt="..."
                							style="width: 200px; height: 200px;" /></span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/about.do'>내 정보</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/lockscreen.do'>정보수정</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/mycontent.do'>내 활동</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/diary.do'>다이어리</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/leave.do'>탈퇴</a></li>
                </ul>
            </div>
        </nav>
        <!-- Page Content-->
        <div class="container-fluid p-0">

            <!-- About-->
            <!-- 프로필 수정 -->
            <section class="resume-section" id="update">
                   <div class="tab-pane" id="settings" style="width: 700px; border: 1px solid gray; padding: 20px">
                    <form class="form-horizontal">
                      <div class="form-group row">
                      	<span class="d-none d-lg-block"><img class="profile img-fluid img-profile rounded-circle" style="width: 200px; height: 200px;"
                      							src="<%= m.getProfile() %>" onclick="fn_upfile();" />
                      							<input type="file" name="upFile" style="display:none"><button type="button" class="btn btn-xs btn-lblue min-42" onclick="fn_updateProfile()" style="margin-top: 28%;">변경</button>
                      	</span>
                      </div>
                      
                      <script>
							const fn_upfile=()=>{
								
								$("input[name=upFile]").click();
							}
							
							$("input[name=upFile]").change(e=>{
								
								console.dir(e.target);
								const reader=new FileReader();
								reader.onload=e=>{
				
									$(".profile").attr("src",e.target.result);
									
								}
								
								reader.readAsDataURL(e.target.files[0]);
								
							});
							
							const fn_updateProfile=()=>{
									  location.href='<%=request.getContextPath()%>/mypage/changeProfile.do';
							}
					 </script>
                      
                      <div class="form-group row">
                        <label for="inputName" class="col-sm-2 col-form-label"><b><%= loginMember.getMember_nickname() %> 님의 정보</b></label>
                      </div>
                      <div class="form-group row">
                        <label for="inputSkills" class="col-sm-2 col-form-label">성별: <% if(loginMember.getGender()=='F') { %>여<%} else { %>남<%} %></label>
                      </div>

                      <div class="form-group row">
                        <label for="inputSkills" class="col-sm-6">이메일: <%= loginMember.getEmail() %></label>
                      </div>

                      <div class="form-group row">
                        <label for="inputEmail" class="col-sm-2 col-form-label">주소: <%= loginMember.getAddress() %></label>
                      </div>
                      
                      <div class="form-group row">
                        <label for="inputName2" class="col-sm-2 col-form-label">번호: <%= loginMember.getPhone() %></label>
                      </div>
                      
                      <div class="form-group row">
                        <label for="inputName2" class="col-sm-2 col-form-label">내 등급: <%= grade %>단계</label>
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
                          
                        </div>
                      </div>
                    </form>
                  </div>
            </section>

        </div>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="<%=request.getContextPath() %>/assets/js/scripts.js"></script>
        <script src="<%=request.getContextPath() %>/assets/js/jquery-1.11.0.min.js"></script>

<%@ include file="/views/common/footer.jsp" %>