<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/adminHeader.jsp" %>

	<style>
        #test_btn1{
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            /* margin-right:-4px; */
        }
        #test_btn2{
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;    
            /* margin-left:-3px; */
        }
        #btn_group button{
            border: 1px solid skyblue;
            background-color: rgba(0,0,0,0);
            color: skyblue;
            padding: 5px;
        }
        #btn_group button:hover{
            color:white;
            background-color: cornflowerblue;
        }
    </style>

				<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">신고 접수 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">신고가 접수된 글을 관리 합니다.</li>
                        </ol>
                        <hr class="one">
                        <div id="btn_group">
                        <p>선택된 항목을 <button id="test_btn1">삭제</button> <button id="test_btn2">답변</button> 처리 합니다. </p>
                        </div>
                        <hr class="one">

                        <div class="row">
                            
                            <div class="card-body">
                                <table id="table" class="table">
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>처리상태</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td><input type="checkbox" name="checkall" id="checkall"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox" name="checkall" id="checkall"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox" name="checkall" id="checkall"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox" name="checkall" id="checkall"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox" name="checkall" id="checkall"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                            
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                </main>
                
            </div>
        </div>