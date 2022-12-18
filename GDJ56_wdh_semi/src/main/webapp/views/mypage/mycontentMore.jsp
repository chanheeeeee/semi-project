<%@page import="com.wdh.del.model.vo.Declaration"%>
<%@page import="com.wdh.qs.model.vo.Question"%>
<%@page import="com.wdh.board.vo.ReviewBoard"%>
<%@page import="com.wdh.board.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	List<Board> boards = (List<Board>)request.getAttribute("boards");

	List<ReviewBoard> reviews = (List<ReviewBoard>)request.getAttribute("reviews");
	
	List<Question> qs = (List<Question>)request.getAttribute("qs");
	
	List<Declaration> dcl = (List<Declaration>)request.getAttribute("dcl");
	
	int result = 0;
	
	/* 페이징 처리 타입 */
	int type = (int)request.getAttribute("type");


%>
<style>
div#pageBar{margin-top:10px; text-align:center; background-color:rgba(0, 188, 212, 0.3);}
	div#pageBar span.cPage{color: #0066ff;}
</style>
<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="<%=request.getContextPath() %>/mypage/about.do">
                <span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="<%=request.getContextPath() %>/assets/img/pocha.jpg" alt="..." /></span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/about.do'>내 정보</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/lockscreen.do'>정보수정</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/mycontent.do'>내 활동</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/diary.do'>다이어리</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/leave.do'>탈퇴</a></li>
                </ul>
            </div>
        </nav>
        
<!-- <div class="wrapper"> -->


  <!-- Content Wrapper. Contains page content -->
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>My Content</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Content</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
        
        <% if(type==1) { %>
        	<!-- 동행 -->
          <div class="col-md-6" style="flex: auto; max-width: 100%;">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">동행</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table">
                  <thead>
                    <tr>
                      <th style="width: 10px">#</th>
                      <th>제목</th>
                      <th>게시날짜</th>
                      <th style="width: 40px">후기</th>
                    </tr>
                  </thead>
                  <tbody>
                  <% if(boards.isEmpty()) { %>
                  	<tr><td>작성된 글이 없습니다.</td></tr>
                  <% } else {       

                	  	for(Board b : boards) {
                	
                	  		
	                	  		for(ReviewBoard r : reviews) {
	                	  			
	                	  			if(r.getWdNo()==b.getWdNo()) {
	                					result = 1;
	                				} 
	                	  		}
                	  		%>
                    <tr>
                      <td><%= b.getWdNo() %></td>
                      <td>
                      	<a href="<%=request.getContextPath()%>/board/wdjoinlist.do?memberNo=<%=loginMember.getMember_no()%>&boardNo=<%=b.getWdNo()%>" style="text-decoration: none; color: black;">
                      		<%= b.getWdTitle() %>
                      	</a>
                      </td>
                      <td><%= b.getWdTime() %></td>
                      <td>
                      <% if(result == 1) { %>
                      
                      	<button type="button" class="btn btn-xs btn-lgray min-42" disabled='disabled'>완료</button>
                      	
                      <% 
                      	
                      
                      } else { %>
                      
                      	<button type="button" class="btn btn-xs btn-lblue min-42" onclick="location.href='<%=request.getContextPath()%>/board/reviewcheckboard.do?boardNo=<%=b.getWdNo()%>';">작성</button>
                      	
                      <%
                      			
                      	} %>
                      </td>
                    </tr>
                   <% 	
                   		
                  			result = 0;
                	  	}
                	  		
                	 
                  } %>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              
              <!-- 페이징 처리 -->
              <div class="card-footer clearfix" style="float: left;">
              	<ul class="pagination pagination-sm m-0 float-right" style="float: left;">
              	<li class="page-item" style="float: left;">
                 	<div id="pageBar">
						<%=request.getAttribute("pageBar") %>
					</div>
				</li>
				</ul>
              </div>
              
              
            </div>
           </div>
            <!-- /.card -->
           <% } %>
            
                 
         <% if(type==2) { %>
            <!-- 후기 -->
          <div class="col-md-6" style="flex: auto; max-width: 100%;">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">후기</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table">
                  <thead>
                    <tr>
                      <th style="width: 10px">#</th>
                      <th>제목</th>
                      <th>게시날짜</th>
                      <th style="width: 40px"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <% if(reviews.isEmpty()) { %>
                    <tr><td colspan="4">작성된 글이 없습니다.</td></tr>
                  <% } else {
                	  	
                	  	for(ReviewBoard r : reviews) {
						%>
                    <tr>
                      <td><%= r.getReviewSeq() %></td>
                      <td>
                      	<a href="<%=request.getContextPath()%>/board/wdjoinlist.do?memberNo=<%=loginMember.getMember_no()%>&boardNo=<%=r.getWdNo()%>" style="text-decoration: none; color: black;">
                      		<%= r.getReviewTitle() %>
                      	</a>
                      </td>
                      <td><%= r.getReviewDate() %></td>
                      <td>
                      	<button type="button" class="btn btn-xs btn-lblue min-42" 
                      		onclick="location.href='<%=request.getContextPath()%>/mypage/deleteReview.do?reviewboardNo=<%= r.getReviewSeq() %>';">삭제</button>
                      </td>
                    </tr>
                   <%		}
							
                	 } %>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              
              <!-- 페이징 처리 -->
              <div class="card-footer clearfix" style="float: left;">
              	<ul class="pagination pagination-sm m-0 float-right" style="float: left;">
              	<li class="page-item" style="float: left;">
                 	<div id="pageBar">
						<%=request.getAttribute("pageBar") %>
					</div>
				</li>
				</ul>
              </div>
              
            </div>
            <!-- /.card -->
            </div>
            <!-- ./후기 -->
          <% } %>
            
		  <% if(type==3) { %>
            <!-- 문의 -->
            <div class="col-md-6" style="flex: auto; max-width: 100%;">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">문의</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table">
                  <thead>
                    <tr>
                      <th style="width: 10px">#</th>
                      <th>제목</th>
                      <th>등록날짜</th>
                      <th style="width: 40px"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <% if(qs.isEmpty()) { %>
                    <tr><td colspan="4">작성된 글이 없습니다.</td></tr>
                  <% } else {

                	  	for(Question q : qs) {
						%>
                    <tr>
                      <td><%= q.getQsNo() %></td>
                      <td>
                      	<a href="<%=request.getContextPath()%>/cs/qs.do?qsNo=<%=q.getQsNo()%>" style="text-decoration: none; color: black;">
                      		<%= q.getQsTitle() %>
                      	</a>
                      </td>
                      <td><%= q.getQsDate() %></td>
                      <td>
                      	<button type="button" class="btn btn-xs btn-lblue min-42" 
                      		onclick="location.href='<%=request.getContextPath()%>/mypage/deleteQs.do?qsNo=<%= q.getQsNo() %>';">삭제</button>
                      </td>
                    </tr>
                   <%		}

                	 } %>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              
              <!-- 페이징 처리 -->
              <div class="card-footer clearfix" style="float: left;">
              	<ul class="pagination pagination-sm m-0 float-right" style="float: left;">
              	<li class="page-item" style="float: left;">
                 	<div id="pageBar">
						<%=request.getAttribute("pageBar") %>
					</div>
				</li>
				</ul>
              </div>
              
            </div>
            <!-- /.card -->
          <!-- /.col -->
          </div>
          <!-- 문의 -->
         <% } %>

         
         <% if(type==4) { %>
 		<!-- 신고 -->
            <div class="col-md-6" style="flex: auto; max-width: 100%;">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">신고</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table">
                  <thead>
                    <tr>
                      <th style="width: 10px">#</th>
                      <th>제목</th>
                      <th>등록날짜</th>
                      <th style="width: 40px"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <% if(dcl.isEmpty()) { %>
                    <tr><td colspan="4">작성된 글이 없습니다.</td></tr>
                  <% } else {
	
                	  	for(Declaration d : dcl) {
						%>
                    <tr>
                      <td><%= d.getDclNo() %></td>
                      <td>
                      	<a href="<%=request.getContextPath()%>/dcl/dclView.do?dclNo=<%=d.getDclNo()%>" style="text-decoration: none; color: black;">
                      		<%= d.getDclTitle() %>
                      	</a>
					  </td>
                      <td><%= d.getDclDate() %></td>
                      <td>
                      	<button type="button" class="btn btn-xs btn-lblue min-42" 
                      		onclick="location.href='<%=request.getContextPath()%>/mypage/deleteDcl.do?dclNo=<%= d.getDclNo() %>';">삭제</button>
                      </td>
                    </tr>
                   <%		}
  	
                	 } %>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              
              <!-- 페이징 처리 -->
              <div class="card-footer clearfix" style="float: left;">
              	<ul class="pagination pagination-sm m-0 float-right" style="float: left;">
              	<li class="page-item" style="float: left;">
                 	<div id="pageBar">
						<%=request.getAttribute("pageBar") %>
					</div>
				</li>
				</ul>
              </div>
              
            <!-- /.card -->
          <!-- /.col -->
          </div>
          <!-- 신고 -->
         <% } %>
            
            
       </div>
       </div>
       </section>
     


  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
<!-- </div> -->
<!-- ./wrapper -->

<!-- jQuery -->
<script src="<%=request.getContextPath() %>/assets/js/jquery-1.11.0.min.js"></script>

<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/assets/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=request.getContextPath() %>/assets/js/demo.js"></script>

 <!-- Bootstrap core JS-->
 <script src="<%=request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
 <!-- Core theme JS-->
 <script src="<%=request.getContextPath() %>/assets/js/scripts.js"></script>

<%@ include file="/views/common/footer.jsp" %>