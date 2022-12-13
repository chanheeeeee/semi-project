<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.List"%>    
<%
	/* List<Member> members=(List<Member>)request.getAttribute("members"); */
%>

<%@ include file="/views/common/adminHeader.jsp" %>

	<style>
       #test_btn1{
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
		                        <h1 class="mt-4">회원 관리</h1>
		                        <ol class="breadcrumb mb-4">
		                            <li class="breadcrumb-item active">전체 회원을 관리합니다.</li>
		                        </ol>
		                        <hr class="one">
                        		<div id="btn_group">
                       	 		<p>선택된 회원을 <button id="test_btn1">탈퇴</button> 처리 합니다. </p>
                        		</div>
                        		<hr class="one">
		
		
		
		                        <div class="row">
		                            
		                            <div class="card-body">
		                                <table id="datatablesSimple">
							            <thead>
							                <tr>
							                	<th><input type="checkbox" name="checkall" id="checkall"></th>
								                <th>번호</th>
	                                            <th>아이디</th>
	                                            <th>이름</th>
	                                            <th>성별</th>
	                                            <th>이메일</th>
	                                            <th>전화번호</th>
	                                            <th>주소</th>
	                                            <th>가입일자</th>
							                </tr>
							            </thead>
							            <tbody>
							       	  		<%-- <%if(members.isEmpty()){ %>
							       	  		<tr>
							       	  			<td><h3>조회된 회원이 없습니다</h3></td>
							       	  		</tr>
							       	  		<%}else{ 
							       	  			for(int i=0;i<members.size();i++){
							       	  		%>
							       	  			<tr>
							       	  				<td></td>
							       	  				<td><%=members.get(i).getUserNo() %></td>
													<td><%=members.get(i).getUserId() %></td>
													<td><%=members.get(i).getUserName() %></td>
													<td><%=members.get(i).getGender() %></td>
													<td><%=members.get(i).getEmail() %></td>
													<td><%=members.get(i).getPhone() %></td>
													<td><%=members.get(i).getAddress() %></td>
	  				
							       	  			</tr>
							       	  		<%} 
							       	  		}%> --%>
							            </tbody>
							        </table>
		                            </div>
		                        </div>
		                    </div>
		                    
		                </main>
		            </div>
		        </div>