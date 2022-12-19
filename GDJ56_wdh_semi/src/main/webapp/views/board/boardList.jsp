<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List,com.wdh.board.vo.*" %>
<% 
   List<Board> boards = (List<Board>)request.getAttribute("boards");
%>

<%@ include file="/views/common/header.jsp" %>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js"></script>

<!-- Start Content -->
<div class="container py-5">
 <div class="row">
  <div class="col-lg-3">
  	<!-- 키워드+추가검색 -->
	<div class="input-group mb-2">
		<input type="text" class="form-control" id="inputKeywordSearch" placeholder="Search ...">
		<button class="input-group-text btn-success text-light" onclick="fn_searchSubmit();"> <!-- 검색할 함수 -->
		<i class="fa fa-fw fa-search text-white"></i><!-- 검색icon -->
		</button>
	</div>
			
	<!-- 추가검색form -->
	<form name="searchFrm" action="<%=request.getContextPath()%>/board/boardSearch.do" method="post">
	 <h1 class="h2 pb-4"></h1>
	 <h1 class="h2 pb-4">추가 검색 조건</h1>
		<ul class="list-unstyled templatemo-accordion">
			<li class="pb-3">
				<a class="collapsed d-flex justify-content-between h3 text-decoration-none">
					성별<i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
				</a>
				<ul class="collapse show list-unstyled pl-3">
					<li><label><input type="radio" name="gender" value="F">여</label></li>
					<li><label><input type="radio" name="gender" value="M">남</label></li>
					<li><label><input type="radio" name="gender" value="A">무관</label></li>
				</ul>
	       </li>
	       
			<li class="pb-3">
				<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
					목적<i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
				</a>
				<ul id="collapseTwo" class="collapse list-unstyled pl-3">
					<li><label><input type="radio" name="purpose" value="취미">취미</label></li>
					<li><label><input type="radio" name="purpose" value="친목">친목</label></li>
					<li><label><input type="radio" name="purpose" value="다이어트">다이어트</label></li>
				</ul>
			</li>
			
			<li class="pb-3">
				<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
					종목<i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
				</a>
				<ul id="collapseTwo" class="collapse list-unstyled pl-3">
					<li><label><input type="checkbox" name="category" value="구기" onchange="makeFilter(this);">구기</label></li>
					<li><label><input type="checkbox" name="category" value="유산소" onchange="makeFilter(this);">유산소</label></li>
					<li><label><input type="checkbox" name="category" value="수상" onchange="makeFilter(this);">수상</label></li>
					<li><label><input type="checkbox" name="category" value="기타" onchange="makeFilter(this);">기타</label></li>
				</ul>
			</li>
		</ul>
		
		<input type="hidden" name="searchKeyword">
		<input type="hidden" name="date">
		
	</form>
  </div>



  <div class="col-lg-9">
	<div class="row">
	  <div class="col-md-9">
	  	<ul class="list-inline shop-top-menu pb-3 pt-1">
	  		<li class="list-inline-item">
				<a class="h3 text-dark text-decoration-none mr-3">기간 </a></li>
	  		<li class="list-inline-item"><a class="h3 text-dark text-decoration-none mr-3">
	  			<input type="date" name="date" max="2023-12-31" min="2022-01-01" onclick="fn_getDate();"></a></li>
	  			
	  		<li class="list-inline-item">
				<a class="h3 text-dark text-decoration-none mr-3">~</a></li>
			
	  		<li class="list-inline-item"><a class="h3 text-dark text-decoration-none mr-3">
	  			<input type="date" name="date" max="2023-12-31" min="2022-01-01" onclick="fn_getDate();"></a></li>
	  	</ul>
	  </div>
	  <div class="col-md-3 pb-2">
		<div class="d-flex">
			<button type="button" class="btn btn-success btn-lg px-3" onclick="location.assign('<%=request.getContextPath()%>/board/writeboard.do');">글쓰기</button>
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
				
				<!-- board -->
				<div class="col-md-6 col-lg-3 pb-5">
					<div class="h-100 py-5 services-icon-wap shadow">
						<div class="card rounded-0">
							<img class="card-img rounded-0 img-fluid"
							src="<%=categoryImg%>">
							<div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center"></div>
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

                
	</div>
 </div>
</div><!-- End first div -->


<!-- 검색 -->
<script>
	//form radio 검색
	/* $("input[name='gender']").change(	function() {
		
			if($("input[name='gender']:checked").val() == "F"){
				alert("여자선택함");fn_searchSubmit();
			
			}else if ($("input[name='gender']:checked").val() == "M") {
				alert("남자선택함");fn_searchSubmit();
				
			} else {
				alert("무관선택함");fn_searchSubmit();
			}
			
	}); */
	
	//form checkbox 검색
	/* var cbArr = new Array(); //필터 내용을 저장할 배열
	
	function makeFilter(target){
		
			var checkVal = target.value;
			var confirmCheck = target.checked;
		
			//선택
			if(confirmCheck == true){	cbArr.push(checkVal);	}
			//선택해제
			else{	cbArr.splice(cbArr.indexOf(checkVal), 1);	}
			
			console.log("검색할 값 : "+cbArr);
	} */
	
	const fn_searchSubmit = ()=>{
		
		//keyword
		searchFrm.searchKeyword.value = $("#inputKeywordSearch").val(); /* input에 입력된 값 hidden searchKeyword.value에 접근해서 값 할당 */
		/* 나머지는 이미 value값이 들어가 있음 */
		//date
		searchFrm.date.value = $("input[name='date']").eq(0).val();
		console.log(searchFrm.date.value);
		
		let date1 = $("input[name='date']").eq(0).val();
        let date2 = $("input[name='date']").eq(1).val();
        console.log(date1);
        console.log(date2);
		searchFrm.submit();
		
		//searchFrm.category.value = cbArr; /* cbArr */
		//console.log(cbArr);
		//searchFrm.address.value = address;
		
	}
	let date = "";
	const fn_getDate = (()=>{
		
		return ()=>{
			let date1 = $("input[name='date']").eq(0).val();
	        let date2 = $("input[name='date']").eq(1).val();
	        console.log(date1);
	        console.log(date2);
	        
	        date = date1+date2;
	        
	        searchFrm.date.value = date;
		}
	})();
	
	/* $("#slideToggleMap").click(e => {
	$("#containerMap>div").slideToggle(2000);
	})
	$("#slideToggleAdd").click(e => {
		$("#container>div").slideToggle(2000);
	}) */

</script>
<script>
	temp = "<%=request.getAttribute("pageBar") %>";
	let arr=temp.split(",");
	//console.log(arr);
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
	
	
<%-- <div class="col-md-4">
       <button type="button" class="btn btn-success btn-lg px-3" id="slideToggleAdd">검색 조건 추가하기</button>
       <button   type="button" class="btn btn-success btn-lg px-3" 
          onclick="location.assign('<%=request.getContextPath()%>/board/writeboard.do');">글쓰기</button>
     </div> --%>
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
             <div id="purpose"><!-- WD_PURPOSE -->
                 목적
                 <label><input type="radio" name="purpose" value="취미">취미</label>
                 <label><input type="radio" name="purpose" value="친목">친목</label>
                 <label><input type="radio" name="purpose" value="다이어트">다이어트</label>
             </div>
             <div id="category"><!-- WD_CATEGORY -->
                 종목
                 <!-- <label><input type="checkbox" name="category" value="구기" checked> 구기</label> -->
                 <label><input type="checkbox" name="category" value="구기"> 구기</label>
                 <label><input type="checkbox" name="category" value="육상"> 육상</label>
                 <label><input type="checkbox" name="category" value="수상"> 수상</label>
                 <label><input type="checkbox" name="category" value="등산"> 등산</label>
                 <label><input type="checkbox" name="category" value="기타"> 기타</label>
             </div>
             <div>
                 기간
                 <input type="date" name="date" max="2022-12-31" min="2022-01-01">-
                 <input type="date" name="date" max="2022-12-31" min="2022-01-01">
             </div>
      <input type="hidden" name="searchKeyword">
         //<input type="hidden" name="gender" id="gender">
         //<input type="hidden" name="purpose">
         //<input type="hidden" name="category">
         //<input type="hidden" name="address"> 
         </form>
     </div>
 </div> --%>


 <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bvstyle.css"/>

<%@ include file="/views/common/footer.jsp" %>