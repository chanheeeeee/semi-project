<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

		<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="<%=request.getContextPath() %>/mypage/about.do">
                <span class="d-none d-lg-block">
                <% 
					if(loginMember.getProfile() == null) { %>
									
					<img class="profile img-fluid img-profile rounded-circle" style="width: 200px; height: 200px;"
                      							src="<%=request.getContextPath()%>/assets/img/pocha.jpg" />
                      							
                    <% } else { %>
                      			
                    <img class="profile img-fluid img-profile rounded-circle" style="width: 200px; height: 200px;"
                      							src="<%=request.getContextPath()%>/upload/profile/<%= loginMember.getProfile() %>" />
                      							
                    <% } %>
                </span>
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
        
<div class="lockscreen-wrapper">
  <div class="lockscreen-logo">
    <a>비밀번호 확인</a>
  </div>

  <div class="lockscreen-item">
    <!-- 프로필사진 -->
    <div class="lockscreen-image">
      <img src="<%=request.getContextPath() %>/assets/img/pocha.jpg" class="profile" alt="User Image">
    </div>

    <!-- 비밀번호 체크 폼 -->
    <form class="lockscreen-credentials" id="updateFrm" action="<%= request.getContextPath() %>/mypage/updateMember.do"
    			method="post">
    			
      <div class="input-group">
      
        <input type="password" class="form-control" placeholder="password" name="pass">

        <div class="input-group-append">
       
        	<!-- <button type="button" class="btn" onclick="fn_update()"> -->
        	<button type="submit" class="btn">
            	<i class="fas fa-arrow-right"></i>
            </button>

        </div>
      </div>
    </form>
  </div>

  <div class="help-block text-center">
    정보를 변경하려면 비밀번호를 입력하세요.
  </div>
  <div class="text-center">
    <a href="location.href='<%=request.getContextPath() %>/member/findPw.do';">비밀번호가 기억나지 않으신가요?</a>
  </div>
</div>

<!-- 스크립트 -->
<script>
	<%-- const fn_update=()=>{
		$("#updateFrm").attr("action",
			"<%=request.getContextPath()%>/mypage/updateMember.do");
		$("#updateFrm").submit();
	} --%>
</script>

<!-- jQuery -->
<script src="<%=request.getContextPath() %>/assets/js/jquery-1.11.0.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>


<%@ include file="/views/common/footer.jsp" %>