<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List,com.wdh.board.vo.*" %>
<% 
	List<Board>	boards = (List<Board>)request.getAttribute("boards");
%>


<%@ include file="/views/common/innerheader.jsp" %>
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
    <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q"
                        placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>


    <section class="bg-success py-5">

        <div class="container">
            <div class="row align-items-center py-5">
                <div class="col-md-8 text-white">
                    <p>
                    <div class="input-group mb-2">
                        <input type="text" class="form-control" id="inputModalSearch" name="q"
                            placeholder="Search ...">
                        <button type="submit" class="input-group-text bg-success text-light">
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
                        <form action="" method="get">
                            <div>
                                성별
                                <label><input type="radio" name="gender" value="여">여</label>
                                <label><input type="radio" name="gender" value="남">남</label>
                                <label><input type="radio" name="gender" value="무관">무관</label>
                            </div>
                            <div>
                                목적
                                <label><input type="radio" name="goal" value="취미">취미</label>
                                <label><input type="radio" name="goal" value="친목">친목</label>
                                <label><input type="radio" name="goal" value="다이어트">다이어트</label>
                            </div>
                            <div>
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

                            <input type="submit" value="전송">
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
    </script>

    <!-- Start Section -->
    <section class="container py-5">
        <div class="row text-center pt-5 pb-3">
            <div class="col-lg-6 m-auto">
                <h1 class="h1">동행게시글화면</h1>
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

-->
        <div class="row">
            <%if(boards.isEmpty()) {%>
                <%}else{ for(Board b : boards){%>

                <div class="col-md-6 col-lg-3 pb-5">
                    <div class="h-100 py-5 services-icon-wap shadow">
                        <div class="card rounded-0">
                            <img class="card-img rounded-0 img-fluid"
                                src="https://images.unsplash.com/photo-1500468756762-a401b6f17b46?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8bWFyYXRob258ZW58MHwxfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60">
                            <div
                                class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                            </div>
                        </div>
                        <a href="<%=request.getContextPath()%>/board/boardView.do?boardNo=<%=b.getWdNo()%>">
                            <h2 class="h5 mt-4 text-center"><%=b.getWdTitle() %></h2>
                        </a>
                        <h2 class="h5 mt-4 text-center"><%=b.getWdCategory()%></h2>
                    </div>
                </div>
                <%} } %>
        </div>

        <!-- 페이징처리 -->
        <div id="pageBar">
            <%=request.getAttribute("pageBar") %>
        </div>
    </section>
    <!-- End Section -->


<%@ include file="/views/common/footer.jsp" %>