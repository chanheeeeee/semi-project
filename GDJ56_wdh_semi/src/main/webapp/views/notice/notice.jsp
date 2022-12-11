<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

    <br>
    <div style="text-align:center" id="tbl-board">
        <h2><strong>공지사항</strong></h2>
        <section id="board-container">
            <table id="tbl-board">
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
                    <td>관리자</td>
                    <td>2022.12.08</td>
                    <td>첨부파일이 없습니다.</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>제목</td>
                    <td>관리자</td>
                    <td>2022.12.08</td>
                    <td>첨부파일이 없습니다.</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>제목</td>
                    <td>관리자</td>
                    <td>2022.12.08</td>
                    <td>첨부파일이 없습니다.</td>
                </tr>
                </table>
                <button onclick="location.href='<%=request.getContextPath()%>/views/notice/subNotice.jsp'">글쓰기</button>
                <br>
                페이징처리
            </section>
            <br>
        </div>

<%@ include file="/views/common/footer.jsp" %>