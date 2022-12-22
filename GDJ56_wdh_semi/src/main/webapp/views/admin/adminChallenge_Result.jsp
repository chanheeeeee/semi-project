<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.List, com.wdh.member.vo.Member, com.wdh.challenge.model.vo.Challenge"%>    
<%
List<Member> members=(List<Member>)request.getAttribute("member");

%>

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
                            <li class="breadcrumb-item active">첼린지 결과를 출력합니다.</li>
                        </ol>
                    
                    <div class="row">
                    <div class="card-body">
                        <table id="ctable" class="table">
                            <thead>
                                <tr>
                                   <%--  <th><%=cr.challenge_name %></th>
                                    <th><%=cr.challenge_ %></th> --%>
                                    <th>전체 스템프</th>
                                    <th>리워드 수량</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th>28</th>
                                    <th>5</th>
                                </tr>    
                            </tbody>
                        </table>
                    </div>    
                    </div>
					
                    <hr class="one">


                        <div class="row">
                            
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>                                      
                                            <th>첼린지번호</th>
                                            <th>아이디</th>                                           
                                            <th>참여횟수</th>
                                            <th>사 진</th>                                        
                                        </tr>
                                    </thead>                      
                                    <tbody>
                                    	<%-- <%if(ChallengeResult.isEmpty()){ %>     
                                        <tr>
                                        	<td colspan="4"><h3>조회된 회원이 없습니다</h3></td>
                                        </tr>
						       	  		<%}else{ 
						       	  			for(ChallengeResult cr : ChallengeResult){
						       	  		%>          
                                         	<td><%=cr.challenge_no %></td>
                                            <td><%=cr.member_no %></td>
                                            <td><%=cr.day_cnt %></td>
                                            <td>
                                            <div id="btn_group">
                                            <button id="test_btn1">확인</button>
                                            </div>
                                            </td>
                                        </tr>                          --%>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>