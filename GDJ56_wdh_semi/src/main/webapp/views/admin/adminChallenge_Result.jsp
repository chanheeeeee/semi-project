<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/adminHeader.jsp" %>

<style>
        #test_btn1{
            border-radius: 10px;
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
                        <h1 class="mt-4">첼린지 마감</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">첼린지 결과를 관리합니다.</li>
                        </ol>
                    
                    <div class="row">
                    <div class="card-body">
                        <table id="ctable" class="table">
                            <thead>
                                <tr>
                                    <th>운영 기간</th>
                                    <th>전체 참여자</th>
                                    <th>전체 스템프</th>
                                    <th>리워드 수량</th>
                                    <th>리워드 발급 인원</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th>2022.12.01 - 2022.12.31</th>
                                    <th>0</th>
                                    <th>28</th>
                                    <th>5</th>
                                    <th>0</th>
                                </tr>    
                            </tbody>
                        </table>
                    </div>    
                    </div>
					
					<div id="btn_group">
                    <p>선택한 회원을 <button id="test_btn1">리워드 발급</button> 합니다</p>
                    </div>
                    <hr class="one">


                        <div class="row">
                            
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
                                            <th>회원번호</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>닉네임</th>
                                            <th>스탬프 갯수</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
                                            <th>회원번호</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>닉네임</th>
                                            <th>스탬프 갯수</th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
                                            <td>1</td>
                                            <td>admin</td>
                                            <td>관리자</td>
                                            <td>예시용도</td>
                                            <th></th>
                                            <td>
                                            <div id="btn_group">
                                            <button id="test_btn1">확인</button>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div id="btn_group">
                                            <button id="test_btn1">확인</button>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div id="btn_group">
                                            <button id="test_btn1">확인</button>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                           <td>
                                            <div id="btn_group">
                                            <button id="test_btn1">확인</button>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div id="btn_group">
                                            <button id="test_btn1">확인</button>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div id="btn_group">
                                            <button id="test_btn1">확인</button>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div id="btn_group">
                                            <button id="test_btn1">확인</button>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div id="btn_group">
                                            <button id="test_btn1">확인</button>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div id="btn_group">
                                            <button id="test_btn1">확인</button>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><input type="checkbox" name="checkall" id="checkall"></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div id="btn_group">
                                            <button id="test_btn1">확인</button>
                                            </div>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>