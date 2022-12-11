<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<br>
<div id="challcontainer1">
        <h3><strong>2022년 운동행&nbsp;NEW WINTER CHALLENGE</strong></h3>

    </div>
    <div id="challcontainer2">
        <img src="<%=request.getContextPath() %>/images/walk.jpg" id="challimg">
    </div>
    <div id="challcontainer3">
        <h4><strong>COMMING !! DEC WINTER CHALLENGE !</strong></h4>
    </div>
    <br>
    <nav id="challnav">
            <div id="challcontainer4">
                <h5 id="challh5"> <strong>WELLCOME! 어서오고!&nbsp; &lt; 너의 챌린지 시작을 응원해!! &gt;<br>운동행™ 공식 이벤트 챌린지!!<br>
                    100% 달성한 [ TOP 5 ] 에게는 유명 커피 브랜드 쿠폰이 쏟아진다!!</strong></h5>
            </div>
            <div id="challcontainer4">
                <h5 id="challh5"><strong>2022년 검은 호랑이해의 마지막을 장식할 <br>운동행™의 특급챌린지!!<br>
                나를 변화 시키고 싶다면 지금바로 운동행에 접속하세요</strong></h5> 
            </div>
    </nav>
    <br>
    <div id="challcontainer6">
        <img src="<%=request.getContextPath() %>/images/chcallender.png" alt="" id="chcall" onclick="">
        <button id="checkbtn" type="file"><img src="<%=request.getContextPath() %>/images/check.png" width="100" height="100" id="chimg"></button>
        <input type="file" name="upfile" style="display: none;">
    </div>




    <div id="challcontainer7">
        <p><strong>※주의사항! 챌린지 이미지 출석체크 이렇게 인증 해주세요!</strong></p>
        	<ul id="chall8">
        		<li>
        			<strong>chap 1.</strong> [1만보] 이상 걸음수가 기록된 앱 화면 또는 스마트워치 사진 올리기
        		</li>
        		<br>
        		<li>
        			<strong>chap 2.</strong> 당일 걸음수만 당일 챌린지 출석체크에 인증이 가능합니다.(전날의 기록 -> 당일 인증 X)
        		</li>
        		<li>
        			<strong>chap 3.</strong> 날짜를 인증할 수 있는 달력이나 네이버 메인 화면을 함께 올리면 당첨 확률도 쑥쑥 UP! UP!
        		</li>
        		<li>
        			<strong>chap 4.</strong> 걸음수가 기록이 된 어플 화면 또는 스마트 워치를 찍은 사진만 출석체크로 인정됩니다<br>
        			※&nbsp;다른 사람의 핸드폰을 찍은 것은 인정이 되지않습니다!
        		</li>
        		<li>
        			<strong>chap 5.</strong> 매일 인증을 했지만 상품 당첨이 되지않았다면 실망하지 마시고 매월 오픈하는 운동행 챌린지를 기다려주세요!
        		</li>
        	</ul>
    </div>

    <div id="challcontainer5">
    	<p id="chall6"><strong>QnA.&lt; 특급챌린지 보상은 어떻게 하면 받을 수 있나요 ? &gt;</strong></p>
        	<ul id="chall7">
            	<li>
               		<strong>chap 1.</strong> 이벤트가 진행되는 28일간 꾸준히 열심히! 참여하기!
            	</li>
            	<li>
               		<strong>chap 2.</strong> 단, 28일 동안 매일 참여했다고 해서 반드시 받을 수 있는 것은 아님을 참고해주세요!
            	</li>
            	<li>
               		<strong>chap 3.</strong> 이벤트를 참여 & 인증하는 이미지를 운동행 스탭들이 확인하고 상품이 지급되니 참고해주세요!
            	</li>
        	</ul>
    </div>
    
    <div id="challcontainer5">
        <p><strong>QnA.&lt; 상품은 어떻게 구성되어 있나요 ?&gt;</strong></p>
        	<ul id="chall7">
            	<li>
                	<strong>chap 1.</strong> 해당 이벤트의 상품은 매월 1회 진행되는 챌린지임을 참고해주세요!
            	</li>
            	<li>
                	<strong>chap 2.</strong> 이벤트는 매월 변경되며 상품도 매월 변경이 되는 점을 참고해주시고 꾸준히 참여해주세요!
            	</li>
            	<li>
                	<strong>chap 3.</strong> 지급된 상품의 유통기한이나 사용처를 유의해서 사용해주세요!
            	</li>
        	</ul>
    </div>
        <br>


<%@ include file="/views/common/footer.jsp" %>