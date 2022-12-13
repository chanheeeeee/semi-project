<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/adminHeader.jsp" %>

<!-- 관리자로 로그인해야 가능합니다 -->
<%
		/* if(loginMember == null || loginMember.getMemberLevel() < 1) {
		msg = URLEncoder.encode("관리자 권한 필요","utf-8");
		redirectUrl= "/login.jsp?msg="+msg;
		response.sendRedirect(request.getContextPath()+redirectUrl);
		return;
		} */

%>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h3 class="mt-4">관리자 페이지 메인</h3>
            
		            <!-- 공지 5개 Start -->
					<div class="container-fluid pt-4 px-4">
		    			<div class="bg-light text-center rounded p-4">
		        			<div class="d-flex align-items-center justify-content-between mb-4">
		            			<h6 class="mb-0">공지 목록 </h6>
		            			<a href="<%=request.getContextPath()%>/views/admin/adminNotice.jsp">Show All</a>
							</div>
		
							<div class="table-responsive">
		    					<table class="table text-start align-middle table-bordered table-hover mb-0">
		        					<thead>
							            <tr class="text-dark">
							                <th Style="text-align:center;" scope="col">번호</th>
									        <th Style="text-align:center;" scope="col">내용</th>
									        <th Style="text-align:center;" scope="col">작성자</th>
									        <th Style="text-align:center;" scope="col">작성일</th>
							    		</tr>
									</thead>
		
									<tbody>
										<%
											/* for(Notice n : ){ */
										%>
												<tr>
													<%-- <td Style="text-align:center;"><%=n.()%></td>
													<td><%=n.() %></td>
													<td><%=n.() %></td>
													<td><%=n.() %></td> --%>
												</tr>
										<%
											/* } */
										%>
		                			</tbody>
		            			</table>
		        			</div>
		    			</div>
					</div>
					<!-- 공지 5개 End -->
		                            
		                        
		          <!-- 최근가입 회원 Start -->
					<div class="container-fluid pt-4 px-4">
						<div class="bg-light text-center rounded p-4">
							<div class="d-flex align-items-center justify-content-between mb-4">
					      		<h6 class="mb-0">회원 목록 [최근 가입순]</h6>
					        	<a href="<%=request.getContextPath()%>/views/admin/adminMemberList.jsp">Show All</a>
							</div>
		                    
		                    <div class="table-responsive">
		                   		<table class="table text-start align-middle table-bordered table-hover mb-0">
		                        	<thead>
		                            	<tr class="text-dark">
			                                <th Style="text-align:center;" scope="col">번호</th>
			                                <th Style="text-align:center;" scope="col">아이디</th>
			                                <th Style="text-align:center;" scope="col">이름</th>
			                                <th Style="text-align:center;" scope="col">닉네임</th>		          
			                            </tr>
		                   			</thead>
		                           
		                           	<tbody>
				                       <%--  <%
											for(Member m : memberList) {
										%>
											<tr>
												<td><%=m.getMemberNo() %></td>
												<td><%=m.getMemberId() %></td>
												<td><%=m.getMemberName()() %></td>
												<td><%=m.getMember() %></td>
											</tr>
										<%
											}
										%> --%>
		                            </tbody>
								</table>
							</div>
						</div>
					</div>
		            <!-- 최근가입 회원 End -->
		            
		            <!-- 고객센터 5개 Start -->
					<!-- 최근 문의 Start -->
					<div class="container-fluid pt-4 px-4">
						<div class="bg-light text-center rounded p-4">
							<div class="d-flex align-items-center justify-content-between mb-4">
					      		<h6 class="mb-0">문의목록</h6>
					        	<a href="<%=request.getContextPath()%>/admin/helpListAll.jsp">Show All</a>
							</div>
		                    
		                    <div class="table-responsive">
		                   		<table class="table text-start align-middle table-bordered table-hover mb-0">
		                        	<thead>
		                            	<tr class="text-dark">
			                                <th Style="text-align:center;" scope="col">번호</th>
			                                <th Style="text-align:center;" scope="col">문의내용</th>
			                                <th Style="text-align:center;" scope="col">작성자</th>
			                                <th Style="text-align:center;" scope="col">작성일</th>
			                                <th Style="text-align:center;" scope="col">답변</th>
			                            </tr>
		                   			</thead>
		                           
		                           	<tbody>
				                      <%--   <%
				                        for(HashMap<String, Object> m : list){
										%>
											<tr>
												<td><%=m.get("helpNo")%></td>
												<td><%=m.get("helpM")%></td>
												<td><%=m.get("memberId")%></td>
												<td><%=m.get("helpCreatedate")%></td>
												<%
												if(m.get("") != null) {
												%>
														<td>신규</td>
													<%
												} else {
													%>
														<td>답변 완료</td>
												<%
												}
												%>
											</tr>
											<%
											}
											%> --%>
		                            </tbody>
								</table>
							</div>
						</div>
					</div>
		            <!-- 최근 문의 End -->
					
					<div class="container-fluid pt-4 px-4">
						<div class="bg-light text-center rounded p-4">
							<div class="d-flex align-items-center justify-content-between mb-4">
					      		<h6 class="mb-0">신고목록</h6>
					        	<a href="<%=request.getContextPath()%>/admin/helpListAll.jsp">Show All</a>
							</div>
		                    
		                    <!-- 최근 신고 Start -->
		                    <div class="table-responsive">
		                   		<table class="table text-start align-middle table-bordered table-hover mb-0">
		                        	<thead>
		                            	<tr class="text-dark">
			                                <th Style="text-align:center;" scope="col">번호</th>
			                                <th Style="text-align:center;" scope="col">신고내용</th>
			                                <th Style="text-align:center;" scope="col">작성자</th>
			                                <th Style="text-align:center;" scope="col">작성일</th>
			                                <th Style="text-align:center;" scope="col">처리</th>
			                            </tr>
		                   			</thead>
		                           
		                           	<tbody>
				                      <%--   <%
				                        for(HashMap<String, Object> m : list){
										%>
											<tr>
												<td><%=m.get("No")%></td>
												<td><%=m.get("")%></td>
												<td><%=m.get("memberId")%></td>
												<td><%=m.get("Createdate")%></td>
												<%
												if(m.get("") != null) {
												%>
														<td>신규</td>
													<%
												} else {
													%>
														<td>처리 완료</td>
												<%
												}
												%>
											</tr>
											<%
											}
											%> --%>
		                            </tbody>
								</table>
							</div>
						</div>
					</div>
		            <!-- 신고 End -->
					<!-- 고객센터 5개 End -->              

            
                </main>
            </div>
    </body>
</html>
    