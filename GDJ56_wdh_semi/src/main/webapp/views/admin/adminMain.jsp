<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.wdh.notice.model.vo.Notice" %>
<%@ page import="com.wdh.member.vo.Member" %>
<%@ page import="com.wdh.qs.model.vo.Question" %>
<%@ page import="com.wdh.del.model.vo.Declaration" %>
<%
	List<Notice> notice=(List<Notice>)request.getAttribute("notice");

	List<Member> member=(List<Member>)request.getAttribute("member");

	List<Question> question=(List<Question>)request.getAttribute("question");

	List<Declaration> declaration=(List<Declaration>)request.getAttribute("declaration");
%>


<%-- <%
	Member loginMember = (Member)session.getAttribute("loginMember");
%> --%>


<%@ include file="/views/common/adminHeader.jsp" %>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdn.tiny.cloud/1/039h7ffovh5quv8pr4xa44xed4hu46wb9xqv3njmag70dndy/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

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
		            			<h6 class="mb-0">공지 </h6>
		            			<a href="<%=request.getContextPath()%>/admin/adminNotice.do">Show All</a>
							</div>
		
							<div class="table-responsive">
		    					<table class="table text-start align-middle table-bordered table-hover mb-0">
		        					<thead>
							            <tr class="text-dark">
							                <th Style="text-align:center;" scope="col">번호</th>
									        <th Style="text-align:center;" scope="col">제목</th>
									        <th Style="text-align:center;" scope="col">작성일</th>
							    		</tr>
									</thead>
		
									<tbody>
										<%
											for(Notice n : notice){
										%>
												<tr>
													<td Style="text-align:center;"><%=n.getNoticeNo()%></td>
													<td><%=n.getNoticeTitle() %></td>
													<td><%=n.getNoticeEnroll() %></td>
												</tr>
										<%
											}
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
					      		<h6 class="mb-0">회원 [최근 가입순]</h6>
					        	<a href="<%=request.getContextPath()%>/admin/adminMemberList.do">Show All</a>
							</div>
		                    
		                    <div class="table-responsive">
		                   		<table class="table text-start align-middle table-bordered table-hover mb-0">
		                        	<thead>
		                            	<tr class="text-dark">
			                                <th Style="text-align:center;" scope="col">번호</th>
			                                <th Style="text-align:center;" scope="col">아이디</th>
			                                <th Style="text-align:center;" scope="col">이름</th>
			                                <th Style="text-align:center;" scope="col">이메일</th>		          
			                            </tr>
		                   			</thead>
		                           
		                           	<tbody>
				                     <%
											for(Member m : member) {
										%>
											<tr>
												<td><%=m.getMember_no() %></td>
												<td><%=m.getMember_id() %></td>
												<td><%=m.getName() %></td>
												<td><%=m.getEmail() %></td>
											</tr>
										<%
											}
										%>
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
					      		<h6 class="mb-0">문의</h6>
					        	<a href="<%=request.getContextPath()%>/admin/adminQs.do">Show All</a>
							</div>
		                    
		                    <div class="table-responsive">
		                   		<table class="table text-start align-middle table-bordered table-hover mb-0">
		                        	<thead>
		                            	<tr class="text-dark">
			                                <th Style="text-align:center;" scope="col">번호</th>
			                                <th Style="text-align:center;" scope="col">문의제목</th>
			                                <th Style="text-align:center;" scope="col">작성자</th>
			                                <th Style="text-align:center;" scope="col">작성일</th>
			                                <th Style="text-align:center;" scope="col">답변</th>
			                            </tr>
		                   			</thead>
		                           
		                           	<tbody>
				                      <%
				                        for(Question qs : question){
										%>
											<tr>
												<td><%=qs.getQsNo() %></td>
												<td><%=qs.getQsTitle()%></td>
												<td><%=qs.getMember().getMember_id() %></td>
												<td><%=qs.getQsDate() %></td>
												<td><%=qs.getQsResult() %></td>
												<%-- <%
												if(<%=qs.getCommentMemo() %> != null) {
												%>
														<td>N</td>
													<%
												} else {
													%>
														<td>Y</td>
												<%
												}
												%> --%>
											</tr>
											<%
											}
											%>
		                            </tbody>
								</table>
							</div>
						</div>
					</div>
		            <!-- 최근 문의 End -->
					
					<div class="container-fluid pt-4 px-4">
						<div class="bg-light text-center rounded p-4">
							<div class="d-flex align-items-center justify-content-between mb-4">
					      		<h6 class="mb-0">신고</h6>
					        	<a href="<%=request.getContextPath()%>/admin/adminDcl.do">Show All</a>
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
    