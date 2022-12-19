<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.wdh.board.vo.*" %>
<% Board b = (Board)request.getAttribute("board"); %>
<%@ include file="/views/common/header.jsp" %>

    <div class="container">
      <ul class="progressbar">
        <li class="active">Step 1. 정보확인</li>
        <li>Step 2. 작성자 평가</li>
        <li>Step 3. 후기글 작성</li>
      </ul>
    </div>


<!--     <table id="info">
        <tr>
            <th>참여동행</th>
            <td>정보가져오기~~</td>
            <th>동행자 닉네임</th>
            <td>정보가져오기~~</td>
        </tr>
        <tr>
            <th>참여날짜</th>
            <td>정보가져오기~~</td>
            <th>운동종목</th>
            <td>정보가져오기~~</td>
        </tr>
    </table> -->
    <br><br><br>


        <table id="star_table">
            <tr>
                <th colspan="2">
                    <h2>작성자 평가항목</h2>
                </th>
            </tr>
            <tr>
                <th>시간 약속을 잘 지켜요</th>
                <th>
                    <p class="star_rating">
                        <a href="#" class="on">★</a>
                        <a href="#" class="on">★</a>
                        <a href="#" class="on">★</a>
                        <a href="#">★</a>
                        <a href="#">★</a>
                    </p>
                </th>
            </tr>
            <tr>
                <th>친절하고 매너가 좋아요</th>
                <th>
                    <p class="star_rating">
                        <a href="#" class="on">★</a>
                        <a href="#" class="on">★</a>
                        <a href="#" class="on">★</a>
                        <a href="#">★</a>
                        <a href="#">★</a>
                    </p>
                </th>
            </tr>
            <tr>
                <th>응답이 빨라요</th>
                <th>
                    <p class="star_rating">
                        <a href="#" class="on">★</a>
                        <a href="#" class="on">★</a>
                        <a href="#" class="on">★</a>
                        <a href="#">★</a>
                        <a href="#">★</a>
                    </p>
                </th>
            </tr>
            <tr>
                <th>잘 이끌어줘요</th>
                <th>
                    <p class="star_rating">
                        <a href="#" class="on">★</a>
                        <a href="#" class="on">★</a>
                        <a href="#" class="on">★</a>
                        <a href="#">★</a>
                        <a href="#">★</a>
                    </p>
                </th>
            </tr>
            <tr>
                <th>장소가 마음에 들어요</th>
                <th>
                    <p class="star_rating">
                        <a href="#" class="on">★</a>
                        <a href="#" class="on">★</a>
                        <a href="#" class="on">★</a>
                        <a href="#">★</a>
                        <a href="#">★</a>
                    </p>
                </th>
            </tr>
            <tr>
                <th>설명이 자세해요</th>
                <th>
                    <p class="star_rating">
                        <a href="#" class="on">★</a>
                        <a href="#" class="on">★</a>
                        <a href="#" class="on">★</a>
                        <a href="#">★</a>
                        <a href="#">★</a>
                    </p>
                </th>
            </tr>
            <tr>
                <th colspan="2">
                    <div class="wrap" style="margin: 5%;">
                    	<button class="button" onclick="location.href='<%=request.getContextPath()%>/views/board/reviewboardck.jsp';">이전</button>
                        <button class="button" onclick="location.href='<%=request.getContextPath()%>/board/reviewboard.do?wdNo=<%=b.getWdNo()%>&grade='+indexOn;">다음</button>
                    </div>
                </th>
            </tr>

        </table>


        <script>
        	let indexOn=18;
            $( ".star_rating a" ).click(function() {
            	//별 모두 class명 지워주기 (css적용해제)
                $(this).parent().children("a").removeClass("on");
                //클릭한 별과, 이전 형제들 class명 on으로 바꿔주기 (css적용)
                $(this).addClass("on").prevAll("a").addClass("on");
                indexOn=document.getElementsByClassName("on").length;
                return false;
            });
        </script>
        
    </div>
    
<style>
	.container {
	  width: 100%;
	  
	}
	
	.progressbar {
	  counter-reset: step;
	  margin: 5%;
	}
	.progressbar li {
	  list-style: none;
	  display: inline-block;
	  width: 30.33%;
	  position: relative;
	  text-align: center;
	  cursor: pointer;
	}
	.progressbar li:before {
	  content: counter(step);
	  counter-increment: step;
	  width: 30px;
	  height: 30px;
	  line-height : 30px;
	  border: 1px solid blue;
	  border-radius: 100%;
	  display: block;
	  text-align: center;
	  margin: 0 auto 10px auto;
	  background-color: #fff;
	}
	.progressbar li:after {
	  content: "";
	  position: absolute;
	  width: 100%;
	  height: 1px;
	  background-color: #ddd;
	  top: 15px;
	  left: -50%;
	  z-index : -1;
	}
	.progressbar li:first-child:after {
	  content: none;
	}
	.progressbar li.active {
	  color: blue;
	}
	.progressbar li.active:before {
	  border-color: blue;
	} 
	 	.progressbar li.active + li:after {
	  background-color: blue;
	} 

</style>



<%@ include file="/views/common/footer.jsp" %>