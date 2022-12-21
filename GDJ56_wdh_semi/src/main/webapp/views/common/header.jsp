<%@page import="com.wdh.member.vo.Member"%>
<%@page import="com.wdh.member.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Member loginMember=(Member)session.getAttribute("loginMember");

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
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/fullcalendar/main.css">

<!-- Start Script -->
<script src="<%=request.getContextPath() %>/js/jquery-1.11.0.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-migrate-1.2.1.min.js"></script>
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
<!--<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>-->
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
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
    <script src="https://cdn.tiny.cloud/1/각자 발급받은 api key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

<!-- 마이페이지 -->
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<%=request.getContextPath() %>/assets/css/mypagestyle.css" rel="stylesheet" />

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/all.min.css">
        <!-- fullCalendar -->
        <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/fullcalendar/main.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/adminlte.min.css">
        
        
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


							<%-- <li class="nav-item"><a class="nav-link fs-2" href="<%=request.getContextPath() %>/main.do">홈</a></li> --%>
							<li class="nav-item"><a class="nav-link fs-3" href="<%=request.getContextPath() %>/notice/noticeList.do">공지사항</a></li>
							<%if(loginMember!=null){ %>
							<li class="nav-item"><a class="nav-link fs-3" href="<%=request.getContextPath() %>/board/boardList.do">동행</a></li>
							<%}else{ %>
							<li class="nav-item"><a class="nav-link fs-3" href="<%=request.getContextPath() %>/member/loginMember.do">동행</a></li>
							<%} %>
							<li class="nav-item"><a class="nav-link fs-3" href="<%=request.getContextPath() %>/challenge/challenge.do">챌린지</a></li>
							<li class="nav-item"><a class="nav-link fs-3" href="<%=request.getContextPath() %>/cs/spon.do">고객센터</a></li>
							<%if(loginMember!=null
							&&loginMember.getMember_id().equals("admin")){ %>
							<li class="nav-item" id="adminMain"><a class="nav-link fs-3" href="<%=request.getContextPath() %>/admin/adminMain.do">관리자</a></li>
							<%} %>
						</ul>
					</div>
					<div class="navbar align-self-center d-lg-flex justify-content-lg-between"	id="templatemo_main_nav">
						<div class="flex-fill">
							<ul	class="nav navbar-nav d-flex justify-content-between mx-lg-auto" style="font-size: 20px;" >
							<% if(loginMember == null) { %>
								<li class="nav-item" id="login" ><a class="nav-link fs-3-2">로그인</a></li>
								<li class="nav-item" id="join"><a class="nav-link fs-3-2" >회원가입</a></li>
							<% } else { %>
								<li class="nav-item" id="mypage" >
									<a class="nav-link fs-3" href='<%=request.getContextPath()%>/mypage/about.do'>
							<% 
								
								if(loginMember.getProfile() == null) { %>
									
									<img class="profile img-fluid img-profile rounded-circle" style="width: 70px; height: 70px; margin-left: 30%;"
                      							src="<%=request.getContextPath()%>/assets/img/pocha.jpg" />
                      							
                      			<% } else { %>
                      			
                      			<img class="profile img-fluid img-profile rounded-circle" style="width: 70px; height: 70px; margin-left: 30%;"
                      							src="<%=request.getContextPath()%>/upload/profile/<%= loginMember.getProfile() %>" />
                      							
                      			<% } %>
									</a>
								</li>
								<li class="nav-item" id="mypage" >	
									<a class="nav-link fs-3-2" style="margin-top: 2%;"><%= loginMember.getMember_nickname() %> 회원님</a>		
									<a class="nav-link fs-3-2" href='<%=request.getContextPath()%>/mypage/logout.do' style="margin-top: -9%;">로그아웃</a>
								</li>
								<li class="nav-item" >
									<a class="nav-link fs-3-2" style="" id="chat" >
										<img src="<%= request.getContextPath() %>/images/chat.png" style="width: 30px; height: 28px;" />
									</a>
									<a class="nav-link fs-3-2" style="" id="message">
										<img src="<%= request.getContextPath() %>/images/message.png" style="width: 25px; height: 18px; margin-left: 10%; margin-top: -50%;" />
									</a>
								</li>
								<li class="nav-item" >
									
								</li>
							<% } %>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<form id="frm" name="frm">
			<!-- <input type="text" name="roomNm"/> -->
		</form>
	</header>
	
	<script>
		$("#login").on("click",function(){
			$("#frm").attr("action","<%=request.getContextPath()%>/member/loginMember.do");
			$("#frm").submit();
		});
		
		$("#join").on("click",function(){
			$("#frm").attr("action","<%=request.getContextPath()%>/member/joinTerms.do");
			$("#frm").submit();
			
		});
		
		//채팅 버튼 클릭시 채팅창 팝업 출력
		$("#chat").on("click", function(){
			open("","frm","width=300,height=300");
			frm.action = "<%=request.getContextPath()%>/chat/chat.do";
			frm.method = "post";
			frm.target="frm";
			frm.submit();
		});
		
		$("#message").on("click",function(){
			$("#frm").attr("action","<%=request.getContextPath()%>/member/messageListAction.do");
			$("#frm").submit();
			
		});
		 
		
	 
	</script>
    <!-- Close Header -->

