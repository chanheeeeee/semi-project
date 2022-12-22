<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<div>
    <table style="text-align: center; margin: auto; height: 500px; width: 1300px;">
<!--         <tr style="border-bottom: 1px solid lightgray; height: 170px;">
            <th></th>
        </tr> -->
        <tr style="border-bottom: 1px solid lightgray;">
            <th >
                <h2 style="font-weight: bolder; color: gray;">게시글이 등록되었습니다.</h2><br>
                    <button id="button" style="margin-left: 20px; margin-right: 20px;"
                    onclick="location.replace('<%=request.getContextPath()%>/board/boardList.do')">목록보기</button>
            </th>
        </tr>
    </table>
    
    <style>
        #button {
        width: 110px;
        height: 40px;
        font-family: 'Roboto', sans-serif;
        font-size: 13px;
        text-transform: uppercase;
        letter-spacing: 2.5px;
        font-weight: 500;
        color: gray;
        background-color: #fff;
        border: none;
        border-radius: 45px;
        box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease 0s;
        cursor: pointer;
        outline: none;
        }

        #button:hover {
        background-color: #2e93e5af;
        box-shadow: 0px 15px 20px #6dbcfcaf;
        color: #fff;
        transform: translateY(-7px);
        }

    </style>
<%@ include file="/views/common/footer.jsp" %>