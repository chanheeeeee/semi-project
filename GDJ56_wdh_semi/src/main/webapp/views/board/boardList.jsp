<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List,com.wdh.board.vo.*" %>
<% 
	List<Board>	boards = (List<Board>)request.getAttribute("boards");
%>


<%@ include file="/views/common/header.jsp" %>
    <script	src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js"></script>
<!-- innerheader에 없어서 스타일 일단 여기에 줌 -->
<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/fontawesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/post.css">
    <style>
        /*페이지바*/
        div#pageBar {
            margin-top: 10px;
            text-align: center;
        }

        div#pageBar span.cPage {
            color: #0066ff;
        }
    </style>


    <section class="bg-success py-5">

        <div class="container">
            <div class="row align-items-center py-5">
                <div class="col-md-8 text-white">
                    <p>
                    <div class="input-group mb-2">
                        <input type="text" class="form-control" id="inputKeywordSearch"
                            placeholder="Search ...">
                        <button class="input-group-text bg-success text-light" 
                        onclick="fn_searchSubmit();"> <!-- 검색할 함수 -->
                            <i class="fa fa-fw fa-search text-white"></i>
                        </button>
                    </div>
                    </p>
                </div>
                <div class="col-md-4">
                    <button type="button" class="btn btn-success btn-lg px-3" id="slideToggleAdd">검색 조건 추가하기</button>
                    <button	type="button" class="btn btn-success btn-lg px-3" 
                    	onclick="location.assign('<%=request.getContextPath()%>/board/writeboard.do');">글쓰기</button>
                </div>

                <div id="container">
                	<div>슬라이드 메뉴 지도
                        <%@ include file="/views/board/map3.jsp" %>
                    </div>
                    <div>슬라이드 메뉴
                        <form name="searchFrm" action="<%=request.getContextPath()%>/board/boardSearch.do" method="post">
                        <!-- 폼에 이름주고 폼 안에 있는 태그(이름으로)접근해서 값을 가져올 수 있다 -->
                            <div id="gender"><!-- WD_GENDER -->
                                성별
                                <label><input type="radio" name="gender" value="F">여</label>
                                <label><input type="radio" name="gender" value="M">남</label>
                                <label><input type="radio" name="gender" value="무관">무관</label>
                            </div>
                            <div id="goal"><!-- WD_PURPOSE -->
                                목적
                                <label><input type="radio" name="goal" value="취미">취미</label>
                                <label><input type="radio" name="goal" value="친목">친목</label>
                                <label><input type="radio" name="goal" value="다이어트">다이어트</label>
                            </div>
                            <div id="event"><!-- WD_CATEGORY -->
                                종목
                                <!-- <label><input type="checkbox" name="event" value="구기" checked> 구기</label> -->
                                <label><input type="checkbox" name="event" value="구기"> 구기</label>
                                <label><input type="checkbox" name="event" value="육상"> 육상</label>
                                <label><input type="checkbox" name="event" value="수상"> 수상</label>
                                <label><input type="checkbox" name="event" value="등산"> 등산</label>
                                <label><input type="checkbox" name="event" value="기타"> 기타</label>
                            </div>
                            <div>
                                기간
                                <input type="date" name="date" max="2022-12-31" min="2022-01-01">-
                                <input type="date" name="date" max="2022-12-31" min="2022-01-01">
                            </div>
							<input type="hidden" name="searchKeyword">
							<input type="hidden" name="gender" id="gender">
							<input type="hidden" name="goal">
							<input type="hidden" name="event">
							<input type="hidden" name="address">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 검색 -->
    <style>
        div#container>div {
            display: none;
        }
    </style>
    <script>
        $("#slideToggleMap").click(e => {
            $("#containerMap>div").slideToggle(2000);
        })
        $("#slideToggleAdd").click(e => {
            $("#container>div").slideToggle(2000);
        })
        const fn_searchSubmit = ()=>{
        	searchFrm.searchKeyword.value = $("#inputKeywordSearch").val(); /* 인풋에 입력한 값을 히든searchKeyword에 넣어주고 서브밋해주는 함수 */
        	searchFrm.address.value = address;
        	/* 나머지는 이미 value에 들어가 있음 */
        	searchFrm.submit();
        }
    </script>

    <!-- Start Section -->
    <section class="container py-5">
        <div class="row text-center pt-5 pb-3">
            <div class="col-lg-6 m-auto">
                <h1 class="h1">동행 둘러보기</h1>
                <p>
                    동행게시글화면목록입니다
                </p>
            </div>
        </div>
        <!-- 
구기 : https://images.unsplash.com/photo-1579952363873-27f3bade9f55?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8c29jY2VyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60
육상 : https://images.unsplash.com/photo-1500468756762-a401b6f17b46?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8bWFyYXRob258ZW58MHwxfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60
수상 : https://images.unsplash.com/photo-1560089000-7433a4ebbd64?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHNwb3J0fGVufDB8MXwwfHw%3D&auto=format&fit=crop&w=500&q=60
등산 : https://images.unsplash.com/photo-1627551885247-f9301e1d6101?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fGhpa2luZ3xlbnwwfDF8MHx8&auto=format&fit=crop&w=500&q=60
기타 : https://images.unsplash.com/photo-1610768764270-790fbec18178?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODJ8fHNwb3J0fGVufDB8MXwwfHw%3D&auto=format&fit=crop&w=500&q=60
구기, 유산소, 수상, 기타

-->
		
        <div class="row">
            <%if(boards.isEmpty()) {%>
                <%}else{ 
                	for(Board b : boards){

	                String categoryImg = null;
	                switch(b.getWdCategory()){
	                case "구기" : categoryImg = "https://images.unsplash.com/photo-1579952363873-27f3bade9f55?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8c29jY2VyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60";break;
	                case "유산소" : categoryImg = "https://images.unsplash.com/photo-1643039686503-d3d6adb4e18a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80";break;
	                case "수상" : categoryImg = "https://images.unsplash.com/photo-1560089000-7433a4ebbd64?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHNwb3J0fGVufDB8MXwwfHw%3D&auto=format&fit=crop&w=500&q=60";break;
	                case "기타" : categoryImg = "https://images.unsplash.com/photo-1597769555495-c54a15cd8c3f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80";break;
	                default : categoryImg = "https://images.unsplash.com/photo-1597769555495-c54a15cd8c3f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80";break;
                	}%>
	                <div class="col-md-6 col-lg-3 pb-5">
	                    <div class="h-100 py-5 services-icon-wap shadow">
	                        <div class="card rounded-0">
	                            <img class="card-img rounded-0 img-fluid"
	                                src="<%=categoryImg%>">
	                            <div
	                                class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
	                            </div>
	                        </div>
	                        <%-- <a href="<%=request.getContextPath()%>/board/boardView.do?boardNo=<%=b.getWdNo()%>"> --%>
	                        <!-- 동행 참여 회원 리스트 서블릿으로 이동 / view가 달라져야하기때문 -->
	                        <a href="<%=request.getContextPath()%>/board/wdjoinlist.do?memberNo=<%=loginMember.getMember_no()%>&boardNo=<%=b.getWdNo()%>">
	                            <h2 class="a h5 mt-4 text-center"><%=b.getWdTitle() %></h2>
	                        </a>
	                        <h2 class="h5 mt-4 text-center"><%=b.getWdCategory()%></h2>
	                    </div>
	                </div>
                <%} 
            	} %>
        </div>
        <style>
        a {
  			text-decoration: none;
		}
        </style>
        

        <!-- 페이징처리 -->
        <div id="pageBar">
        	<%=request.getAttribute("pageBar") %>
        </div>
    </section>
    <!-- End Section -->


<%@ include file="/views/common/footer.jsp" %>