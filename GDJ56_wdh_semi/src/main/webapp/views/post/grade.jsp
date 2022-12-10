<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

    <table id="step">
        <tr>
            <td id="step1" style="background-color: rgba(0, 136, 255, 0.297);">step1. 작성자 평가</td>
            <td style="background-color: lightgray;">step2. 후기 작성</td>
            <td style="background-color: lightgray;">step3. 작성완료</td>
        </tr>
    </table>


    <table id="info">
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
    </table>
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
                        <button class="button">다음</button>
                    </div>
                </th>
            </tr>

        </table>


        <script>
            $( ".star_rating a" ).click(function() {
                $(this).parent().children("a").removeClass("on");
                $(this).addClass("on").prevAll("a").addClass("on");
                return false;
            });
        </script>
        
    </div>



<%@ include file="/views/common/footer.jsp" %>