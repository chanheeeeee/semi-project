<%@page import="com.wdh.board.vo.ReviewBoard"%>
<%@page import="com.wdh.board.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%
	List<Board> boards = (List<Board>)request.getAttribute("boards");

	List<ReviewBoard> reviews = (List<ReviewBoard>)request.getAttribute("reviews");

%>

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
        
        
          <div class="col-md-6">
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
                  <% } else {
                	  	for(Board b : boards) { %>
                    <tr>
                      <td><%= b.getWdNo() %></td>
                      <td><%= b.getWdTitle() %></td>
                      <td><%= b.getWdTime() %></td>
                      <td>
                      	<button type="button" class="btn btn-xs btn-lblue min-42" onclick="location.href='<%=request.getContextPath()%>/views/board/reviewboardck.jsp';">작성</button>
                      </td>
                    </tr>
                   <% 	}
                	 } %>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <ul class="pagination pagination-sm m-0 float-right">
                  <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                </ul>
              </div>
            </div>
           </div>
            <!-- /.card -->
            
            <!-- 후기 -->
          <div class="col-md-6">
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
                  <% } else {
                	  	for(ReviewBoard r : reviews) { %>
                    <tr>
                      <td><%= r.getReviewSeq() %></td>
                      <td><%= r.getReviewTitle() %></td>
                      <td><%= r.getReviewDate() %></td>
                      <td>
                      	<button type="button" class="btn btn-xs btn-lblue min-42" 
                      		onclick="location.href='<%=request.getContextPath()%>/mypage/deleteReview.do?ReviewboardNo=<%= r.getReviewSeq() %>';">삭제</button>
                      </td>
                    </tr>
                   <% 	}
                	 } %>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <ul class="pagination pagination-sm m-0 float-right">
                  <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                </ul>
              </div>
            </div>
            <!-- /.card -->
            </div>
            <!-- ./후기 -->
            
			
            <!-- 문의 -->
            <div class="col-md-6">
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
                      <th></th>
                      <th style="width: 40px"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1.</td>
                      <td>비밀번호를 못 찾겠어요</td>
                      <td></td>
                      <td><button type="button" class="btn btn-xs btn-lred min-42">삭제</button></td>
                    </tr>
                    <tr>
                      <td>2.</td>
                      <td>문의</td>
                      <td></td>
                      <td><button type="button" class="btn btn-xs btn-lred min-42">삭제</button></td>
                    </tr>
                    <tr>
                      <td>3.</td>
                      <td>챌린지 당첨자 언제 나오나요?</td>
                      <td></td>
                      <td><button type="button" class="btn btn-xs btn-lred min-42">삭제</button></td>
                    </tr>
                    <tr>
                      <td>4.</td>
                      <td>일정 등록이 안 돼요</td>
                      <td></td>
                      <td><button type="button" class="btn btn-xs btn-lred min-42">삭제</button></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <ul class="pagination pagination-sm m-0 float-right">
                  <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                </ul>
              </div>
            </div>
            <!-- /.card -->
          <!-- /.col -->
          </div>
          <!-- 문의 -->

          
 		<!-- 신고 -->
            <div class="col-md-6">
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
                      <th></th>
                      <th style="width: 40px"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1.</td>
                      <td>신고</td>
                      <td></td>
                      <td><button type="button" class="btn btn-xs btn-lred min-42">삭제</button></td>
                    </tr>
                    <tr>
                      <td>2.</td>
                      <td>신고합니다</td>
                      <td></td>
                      <td><button type="button" class="btn btn-xs btn-lred min-42">삭제</button></td>
                    </tr>
                    <tr>
                      <td>3.</td>
                      <td>챌린지 당첨자 언제 나오나요?</td>
                      <td></td>
                      <td><button type="button" class="btn btn-xs btn-lred min-42">삭제</button></td>
                    </tr>
                    <tr>
                      <td>4.</td>
                      <td>일정 등록이 안 돼요</td>
                      <td></td>
                      <td><button type="button" class="btn btn-xs btn-lred min-42">삭제</button></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <ul class="pagination pagination-sm m-0 float-right">
                  <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                </ul>
              </div>
            </div>
            <!-- /.card -->
          <!-- /.col -->
          </div>
          <!-- 신고 -->


        <!-- 챌린지 -->
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">챌린지</h3>

                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0" style="height: 300px;">
                <table class="table table-head-fixed text-nowrap">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>챌린지</th>
                      <th></th>
                      <th></th>
                      <th>기간</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>183</td>
                      <td>스쿼트 챌린지!</td>
                      <td></td>
                      <td></td>
                      <td>2022/2~2022/3</td>
                    </tr>
                    <tr>
                      <td>219</td>
                      <td>스쿼트 챌린지!</td>
                      <td></td>
                      <td></td>
                      <td>2022/2~2022/3</td>
                    </tr>
                    <tr>
                      <td>657</td>
                      <td>스쿼트 챌린지!</td>
                      <td></td>
                      <td></td>
                      <td>2022/2~2022/3</td>
                    </tr>
                    <tr>
                      <td>175</td>
                      <td>스쿼트 챌린지!</td>
                      <td></td>
                      <td></td>
                      <td>2022/2~2022/3</td>
                    </tr>
                    <tr>
                      <td>134</td>
                      <td>스쿼트 챌린지!</td>
                      <td></td>
                      <td></td>
                      <td>2022/2~2022/3</td>
                    </tr>
                    <tr>
                      <td>494</td>
                      <td>스쿼트 챌린지!</td>
                      <td></td>
                      <td></td>
                      <td>2022/2~2022/3</td>
                    </tr>
                    <tr>
                      <td>832</td>
                      <td>스쿼트 챌린지!</td>
                      <td></td>
                      <td></td>
                      <td>2022/2~2022/3</td>
                    </tr>
                    <tr>
                      <td>982</td>
                      <td>스쿼트 챌린지!</td>
                      <td></td>
                      <td></td>
                      <td>2022/2~2022/3</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            <!-- /.챌린지 -->
            
            
          </div>
        </div>
        <!-- /.row -->
       <!-- ./챌린지 -->
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