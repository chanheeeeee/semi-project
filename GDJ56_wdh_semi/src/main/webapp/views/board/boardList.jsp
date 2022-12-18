<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List,com.wdh.board.vo.*" %>
<% 
   List<Board>   boards = (List<Board>)request.getAttribute("boards");
%>


<%@ include file="/views/common/header.jsp" %>
    <script   src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js"></script>

    <!-- Start Content -->
    <div class="container py-5">
        <div class="row">

            <div class="col-lg-3">
                <div class="input-group mb-2">
                   <input type="text" class="form-control" id="inputKeywordSearch" placeholder="Search ...">
                    <button class="input-group-text btn-success text-light" onclick="fn_searchSubmit();"> <!-- 검색할 함수 -->
                       <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
                <%-- <div class="col-md-4">
                    <button type="button" class="btn btn-success btn-lg px-3" id="slideToggleAdd">검색 조건 추가하기</button>
                    <button   type="button" class="btn btn-success btn-lg px-3" 
                       onclick="location.assign('<%=request.getContextPath()%>/board/writeboard.do');">글쓰기</button>
                </div> --%>
                
                <!-- 한번 -->
                <form name="searchFrm" action="<%=request.getContextPath()%>/board/boardSearch.do" method="post">
                   <h1 class="h2 pb-4">검색할 조건 추가하기</h1>
                   <ul class="list-unstyled templatemo-accordion">
                       <li class="pb-3">
                           <a class="collapsed d-flex justify-content-between h3 text-decoration-none">
                               성별
                               <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
                           </a>
                           <ul class="collapse show list-unstyled pl-3">
                               <li><label><input type="radio" name="gender" value="F">여</label></li>
                                <li><label><input type="radio" name="gender" value="M">남</label></li>
                                <li><label><input type="radio" name="gender" value="무관">무관</label></li>
                           </ul>
                       </li>
                       <li class="pb-3">
                           <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                               목적
                               <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                           </a>
                           <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                               <li><label><input type="radio" name="goal" value="취미">취미</label></li>
                                <li><label><input type="radio" name="goal" value="친목">친목</label></li>
                                <li><label><input type="radio" name="goal" value="다이어트">다이어트</label></li>
                           </ul>
                       </li>
                       <li class="pb-3">
                           <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                               종목
                               <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                           </a>
                           <ul id="collapseThree" class="collapse list-unstyled pl-3">
                               <li><label><input type="checkbox" name="event" value="구기"> 구기</label></li>
                                <li><label><input type="checkbox" name="event" value="유산소"> 유산소</label></li>
                                <li><label><input type="checkbox" name="event" value="수상"> 수상</label></li>
                                <li><label><input type="checkbox" name="event" value="기타"> 기타</label></li>
                           </ul>
                       </li>
                   </ul>
                         <input type="hidden" name="searchKeyword">
                </form>
                

                <%-- <div id="container">
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
                        //<input type="hidden" name="gender" id="gender">
                        //<input type="hidden" name="goal">
                        //<input type="hidden" name="event">
                        //<input type="hidden" name="address"> 
                        </form>
                    </div>
                </div> --%>
            </div>
            <!-- 검색 -->

            <script>
                $("#slideToggleMap").click(e => {
                    $("#containerMap>div").slideToggle(2000);
                })
                $("#slideToggleAdd").click(e => {
                    $("#container>div").slideToggle(2000);
                })
                const fn_searchSubmit = ()=>{
                    searchFrm.searchKeyword.value = $("#inputKeywordSearch").val(); /* 인풋에 입력한 값을 히든searchKeyword에 넣어주고 서브밋해주는 함수 */
                    //searchFrm.address.value = address;
                    /* 나머지는 이미 value에 들어가 있음 */
                    searchFrm.submit();
                    
                    /* let event = ""; 화면에 검색내용
                    $("input:checkbox[name=event]").each(function (index) { //가져오긴 가져오는데 한꺼번에 가져옴 -이거이용해서 체크박스도 sql검색해주기
                       if($(this).is(":checked")==true){
                            console.log($(this).val());
                            event += " "+$(this).val();
                        }
                    })

                    let text = searchFrm.searchKeyword.value + searchFrm.gender.value + searchFrm.goal.value + searchFrm.date.value + event;

                    const h4 = $("<h4>").text(text);
                    $("div#boards").before(h4); */
                }
            </script>

            <div class="col-lg-9">
                <div class="row">
                    <div class="col-md-8">
                        <ul class="list-inline shop-top-menu pb-3 pt-1">
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3">키워드</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3">성별</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3">목적</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none">종목</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 pb-2">
                        <div class="d-flex">
                            <button   type="button" class="btn btn-success btn-lg px-3" onclick="location.assign('<%=request.getContextPath()%>/board/writeboard.do');">글쓰기</button>
                        </div>
                    </div>
                </div>
                <div class="row" id="boards">
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

                    <!-- 페이징처리 -->
                    
                        <!-- <ul></ul> -->
                        <div id="pageBar" class="row">
		                    <ul>
		                    
		                    </ul>
		                </div>
                    
                    <script>

	                    temp = "<%=request.getAttribute("pageBar") %>";
	                    let arr=temp.split(",");
	                    console.log(arr);
	                    arr.forEach(v =>{
		                    const $e=document.querySelector("#pageBar ul");
		                    console.log($e);
		                    let li="<li><button>"+v+"</button></li>";
		                    $("#pageBar ul").addClass('slick-dots');
		                    /* $("#pageBar ul button").addClass('slick-dots'); */
		                    //$("#pagebar ul button").attr('id','slick-slide-control00');
		                    /* $("#pageBar li").addClass('slick-dots'); */
		                    $e.innerHTML += li;
		                    console.log($e.innerHTML);
	                    });

	                    
	                    
                    </script>
                </section>
                <!-- End Section -->

                
            </div>

        </div>
    </div>
    <!-- End Content -->
    
    <style>
    /*페이지바*/
    div#pageBar {
        margin-top: 10px;
        text-align: center;
    }
    div#pageBar span.cPage {color: #0066ff; }
    div#container>div {display: none;}
   a {text-decoration: none;}
   div.services-icon-wap.hover {background-color: red;}
	</style>


 <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bvstyle.css"/>

<%@ include file="/views/common/footer.jsp" %>