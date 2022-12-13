<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

		<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">
                <span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="../../assets/img/pocha.jpg" alt="..." /></span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">내 정보</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="lockscreen.html">정보수정</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="mycontent.html">내 활동</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="diary.html">다이어리</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="leave.html">탈퇴</a></li>
                </ul>
            </div>
        </nav>
        
        <!-- Automatic element centering -->
<div class="lockscreen-wrapper">
  <div class="lockscreen-logo">
    <a>비밀번호 확인</a>
  </div>
  <!-- User name -->


  <!-- START LOCK SCREEN ITEM -->
  <div class="lockscreen-item">
    <!-- lockscreen image -->
    <div class="lockscreen-image">
      <img src="../../assets/img/pocha.jpg" alt="User Image">
    </div>
    <!-- /.lockscreen-image -->

    <!-- lockscreen credentials (contains the form) -->
    <form class="lockscreen-credentials">
      <div class="input-group">
        <input type="password" class="form-control" placeholder="password">

        <div class="input-group-append">
          <a href="profile.html"><button type="button" class="btn">
            <i class="fas fa-arrow-right"></i></a>
          </button>
        </div>
      </div>
    </form>
    <!-- /.lockscreen credentials -->

  </div>
  <!-- /.lockscreen-item -->
  <div class="help-block text-center">
    Enter your password to retrieve your session
  </div>
  <div class="text-center">
    <a href="login.html">Or sign in as a different user</a>
  </div>
</div>
<!-- /.center -->


<!-- jQuery -->
<script src="../../assets/js/jquery-1.11.0.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../assets/js/bootstrap.bundle.min.js"></script>


<%@ include file="/views/common/footer.jsp" %>