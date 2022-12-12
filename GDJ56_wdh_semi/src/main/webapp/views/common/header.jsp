<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.wdh.member.model.vo.Member" %>
<%
	Member loginMember=(Member)session.getAttribute("loginMember");
	Cookie[] cookies=request.getCookies();
	String saveId=null;
	if(cookies!=null){
		for(Cookie c : cookies){
			if(c.getName().equals("saveId")){
				saveId=c.getValue();
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<title>:::운동행:::</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon"
	href="<%=request.getContextPath() %>/images/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath() %>/images/favicon.ico">

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/templatemo.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/custom.css">

<!-- Start Script -->
<script src="<%=request.getContextPath() %>/js/jquery-1.11.0.min.js"></script>
<script
	src="<%=request.getContextPath() %>/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath() %>/js/templatemo.js"></script>
<script src="<%=request.getContextPath() %>/js/custom.js"></script>
<!-- End Script -->

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/fontawesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/post.css">
<!-- 달력 -->
<meta charset="utf-8" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />

<!-- 웹에디터 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdn.tiny.cloud/1/각자 발급받은 api key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fontawesome.min.css">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.tiny.cloud/1/각자 발급받은 api key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

</head>

<style>

</style>


<body>
	<!-- Header -->
	<header class="fixedhead">
		<nav class="navbar navbar-expand-lg navbar-light shadow" style="background-color: rgba(255, 255, 255, 0.7);">
			<div class="container d-flex justify-content-between align-items-center">
				<!-- <div class="img-logo"> -->
				<a href="<%=request.getContextPath() %>/main.do">
				<img src="<%=request.getContextPath() %>/images/logo.png" style="width: 200px;">
				</a>
				<!-- </div> -->
				<button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between"	id="templatemo_main_nav">
					<div class="flex-fill">
						<ul	class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
							<li class="nav-item"><a class="nav-link fs-2"
								href="index.html">홈</a></li>
							<li class="nav-item"><a class="nav-link fs-2"
								href="about.html">공지사항</a></li>
							<li class="nav-item"><a class="nav-link fs-2"
								href="contact.html">동행</a></li>
							<li class="nav-item"><a class="nav-link fs-2"
								href="shop.html">챌린지</a></li>
							<li class="nav-item"><a class="nav-link fs-2"
								href="contact.html">고객센터</a></li>
						</ul>
					</div>
					<div class="navbar align-self-center d-lg-flex justify-content-lg-between"	id="templatemo_main_nav">
						<div class="flex-fill">
							<ul	class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
								<li class="nav-item" id="login" ><a class="nav-link fs-3">로그인</a></li>
								<li class="nav-item" id="join"><a class="nav-link fs-3" >회원가입</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<form id="frm"></form>
	</header>
	
	
	<script>
	$("#login").on("click",function(){
		$("#frm").attr("action","<%=request.getContextPath()%>/member/loginMember.do");
		$("#frm").submit();
	});
	
	
	 $("#join").on("click",function(){
		$("#frm").attr("action","<%=request.getContextPath()%>/member/joinMember.do");
		$("#frm").submit();
		
	});
	
	</script>

	
            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <!-- <li class="nav-item" >
                            <a class="nav-link fs-3" href="index.html">홈</a>
                        </li> -->
                        <li class="nav-item">
                            <a class="nav-link fs-3" href="<%=request.getContextPath() %>/notice/noticeList.do">공지사항</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link fs-3" href="<%=request.getContextPath() %>/views/board/postList.jsp">동행</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link fs-3" href="<%=request.getContextPath() %>/views/challenge/challenge.jsp">챌린지</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link fs-3" href="<%=request.getContextPath() %>/views/cs/advertisement.jsp">고객센터</a>
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

