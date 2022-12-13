<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>고객센터 - 신고하기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="<%=request.getContextPath()%>/images/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico">
  
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/templatemo.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fontawesome.min.css">
</head>

<body>
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="<%=request.getContextPath() %>/index.jsp">
                <img class="logo" src="<%=request.getContextPath() %>/images/logo3.png" alt="" style="width: 150px;" >
            </a>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/index.jsp">메인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/views/cs/advertisement.jsp">광고문의</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/views/cs/del.jsp">신고하기</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/views/cs/qs.jsp">1대1 문의</a>
                        </li>
                    </ul>
                </div>
               
            </div>

        </div>
    </nav>
    <!-- Close Header -->
    
        <br>
    <div style="text-align:center" id="tbl-board">
        <h2><strong>신고하기 게시판</strong></h2>
        <section id="board-container">
            <table id="tbl-board" style="text-align:center;">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>첨부파일</th>
                </tr>
                <!-- <tr>
                    <td colspan="5">조회된 게시판이 없습니다.</td>
                </tr> -->
                <tr>
                    <td>1</td>
                    <td>제목</td>
                    <td>작성자</td>
                    <td>2022.12.08</td>
                    <td>첨부파일이 없습니다.</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>제목</td>
                    <td>작성자</td>
                    <td>2022.12.08</td>
                    <td>첨부파일이 없습니다.</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>제목</td>
                    <td>작성자</td>
                    <td>2022.12.08</td>
                    <td>첨부파일이 없습니다.</td>
                </tr>
                </table>
                <button onclick="location.href='<%=request.getContextPath()%>/views/cs/subDel.jsp'">글쓰기</button>
                <br>
                페이징처리
            </section>
            <br>
        </div>
        
<%@ include file="/views/common/footer.jsp" %>