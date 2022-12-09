<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>:::운동행:::</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="<%=request.getContextPath()%>/images/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico">
  
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/templatemo.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fontawesome.min.css">
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

수정한 부분
    1. 49, 52, 55, 58 a 태그에 fs-3 class 추가 (BootStrap 폰트 사이즈 변경하는 클래스)
    2. 307 Line custom.js 안에 header.fixedhead 태그에 스크롤이 최상단이 아닐 경우 fixed-top 클래스 추가 / 최상단이라면 fixed-top 클래스 제거 하는 scroll 이벤트 추가
-->
</head>
<body>
    <!-- Header -->
    <header class="fixedhead">
    <nav class="navbar navbar-expand-lg navbar-light shadow" style="background-color: white;">
        <div class="container d-flex justify-content-between align-items-center">
            <!-- <div class="img-logo"> -->
            <a class="navbar-brand text-success logo h1 align-self-center" href="<%=request.getContextPath() %>">
                <img class="logo" src="<%=request.getContextPath()%>/images/logo.png" alt="" style="width: 250px;" >
            </a>
            <!-- </div> -->
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <!-- <li class="nav-item" >
                            <a class="nav-link fs-3" href="index.html">홈</a>
                        </li> -->
                        <li class="nav-item">
                            <a class="nav-link fs-3" href="about.html">공지사항</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link fs-3" href="<%=request.getContextPath() %>/views/board/postList.jsp">동행</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link fs-3" href="shop.html">챌린지</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link fs-3" href="contact.html">고객센터</a>
                        </li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div>
                    </div>
                    
                    <form action="//login.do" method="post">
                        <div class="logintable">
                            <table class="logintable1">
                                <tbody><tr>
                                    <td>
                                        <input type="text" name="memberId" id="memberId" placeholder="아이디" value="">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="password" name="password" id="password" placeholder="패스워드">
                                    </td>
                                </tr>	
                                <!-- <tr>
                                    <td>
                                        <input type="checkbox" name="saveId" id="saveId">
                                        <label for="saveId">아이디저장</label>
                                    </td>
                                </tr> -->
                            </tbody></table>
                            <div class="logintable2">
                                <input type="submit" id="submit" class="btn btn-outline-dark" value="로그인" style="height: 35px; font-size: 10px;">
                                <input type="button" id="signup" class="btn btn-outline-dark" value="회원가입" style="height: 35px; font-size: 10px;" > 
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </nav>
</header>
    <!-- Close Header -->