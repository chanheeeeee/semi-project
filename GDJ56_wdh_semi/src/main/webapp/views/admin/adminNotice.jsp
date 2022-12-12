<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ include file="/views/common/adminHeader.jsp" %> 
 
  <style>
        #test_btn1{
            border-radius: 5px;
            border-radius: 5px;
            /* margin-right:-4px; */
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
                        <h1 class="mt-4">공지사항 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">공지사항을 관리합니다.</li>
                        </ol>
                        <div id="btn_group">
                        <p>선택된 항목을 <button id="test_btn1">삭제</button> <button id="test_btn1">수정</button> 합니다. <button id="test_btn1">공지 작성</button> 합니다.</p>
                        </div>
                        <hr class="one">

                        <div class="row">
                            
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                        	<!-- 여기 체크박스는 전체선택이 되어야 한다  -->
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                        <tr>
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            
                                        </tr>
                                        <tr>
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
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
                </footer>
            </div>
        </div>