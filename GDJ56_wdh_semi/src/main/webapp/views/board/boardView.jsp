<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="java.util.List,com.wdh.board.model.vo.*" %>
<%
	Board b=(Board)request.getAttribute("board");
	List<BoardComment> comments = (List<BoardComment>)request.getAttribute("comments");
%> --%>

<%@ include file="/views/common/innerheader.jsp" %>

<!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>



    <!-- Open Content -->
    <section class="bg-light">
        <div class="container pb-5">
            <div class="row">
                
                <div class="col-lg-7 mt-5 container py-5">
                    <div class="card">
                        <div class="card-body">
                            <h1 class="h2"><%-- <%=b.getBoardTitle() %> --%>제목</h1>
                            <p class="h3 py-2">종목</p>
                            <p class="py-2">
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-secondary"></i>
                                <span class="list-inline-item text-dark">작성자 | 게시시간</span>
                            </p>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>목적:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>친목/취미 등등..의 목적</strong></p>
                                </li>
                            </ul>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>지역:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>**> **구</strong></p>
                                </li>
                            </ul>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>성별:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>여/남/무관</strong></p>
                                </li>
                            </ul>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>모임날짜:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>**년**월**일</strong></p>
                                </li>
                            </ul>

                            <h6>글내용</h6>
                            <p>초보환영</p>
                            <h6>Specification:</h6>
                            <ul class="list-unstyled pb-3">
                                <li>Lorem ipsum dolor sit</li>
                                <li>Amet, consectetur</li>
                                <li>Adipiscing elit,set</li>
                                <li>Duis aute irure</li>
                                <li>Ut enim ad minim</li>
                                <li>Dolore magna aliqua</li>
                                <li>Excepteur sint</li>
                            </ul>

                            <form action="" method="GET">
                                <input type="hidden" name="product-title" value="Activewear">
                                    <div class="col-auto">
                                        <ul class="list-inline pb-3">
                                            <li class="list-inline-item text-right">
                                                <input type="hidden" name="product-quanity" id="product-quanity" value="1">
                                            </li>
                                            <li class="list-inline-item"><span class="btn btn-success" id="btn-minus">참가취소</span></li>
                                            <li class="list-inline-item"><span class="badge bg-secondary" id="var-value">1</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success" id="btn-plus">참가하기</span></li>
                                        </ul>
                                    </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Close Content -->

    <!-- 댓글&작성자후기 중 택1 -->     
    <div class="card-body">
    	<div class="row pb-3">
    		<div class="col d-grid">
    			<a class="btn btn-success btn-lg" href="#boardView_c1">댓글보기</a>
    			<!-- <button type="submit" class="btn btn-success btn-lg" name="submit" value="boardView_c1" onclick="change();">댓글보기</button> -->
            </div>
        	<div class="col d-grid">
        		<a class="btn btn-success btn-lg" href="#boardView_c2">작성자후기보기</a>
            </div>
        </div>
     </div>
     
     <%-- <%@ include file="/views/board/boardView_c1.jsp" %> --%>
                                
	<!-- 댓글&작성자후기 중 댓글 -->                        
    <section class="py-5">
        <div class="container">
            <div class="row text-left p-2 pb-3">
                <h4 id="boardView_c1">댓글</h4>
            </div>

            <!--Start comment_댓글-->
            <div id="carousel-related-product">
            	<%-- <%if(comments.isEmpty()){ %>
            		<h6>아직 작성된 댓글이 없습니다</h6>
            	
            	<%} else {
            	
		   				for(BoardComment bc : comments){
		   					if(bc.getBoardCommentLevel()==1){%>
				                <div class="p-2 pb-3">
				                    <div class="product-wap card rounded-0">
				                        <div class="rounded-0">
				                            <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
				                                <!-- <ul class="list-unstyled">
				                                    <li><a class="btn btn-success text-white" href="shop-single.html"><i class="far fa-heart"></i></a></li>
				                                    <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="far fa-eye"></i></a></li>
				                                    <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="fas fa-cart-plus"></i></a></li>
				                                </ul> -->
				                            </div>
				                        </div>
				                        <div class="card-body">
				                            <a href="shop-single.html" class="h3 text-decoration-none"><%=bc.getBoardCommentWriter() %>작성자</a>
				                            <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
				                                <li><%=bc.getBoardCommentContent() %>댓글내용</li>
				                            <p class="text-center mb-0"><%=bc.getBoardCommentDate() %>게시시간</p>
				                            </ul>
				                        </div>
				                    </div>
				                </div>
				                
				             <%} else{%>
				                
								 <div class="p-2 pb-3">
				                    <div class="product-wap card rounded-0">
				                    ㄴ답글
				                        <div class="rounded-0">
				                            <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
				                                <!-- <ul class="list-unstyled">
				                                    <li><a class="btn btn-success text-white" href="shop-single.html"><i class="far fa-heart"></i></a></li>
				                                    <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="far fa-eye"></i></a></li>
				                                    <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="fas fa-cart-plus"></i></a></li>
				                                </ul> -->
				                            </div>
				                        </div>
				                        <div class="card-body">
				                            <a href="shop-single.html" class="h3 text-decoration-none"><%=bc.getBoardCommentWriter() %>작성자</a>
				                            <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
				                                <li><%=bc.getBoardCommentContent() %>댓글내용</li>
				                            <p class="text-center mb-0"><%=bc.getBoardCommentDate() %>게시시간</p>
				                            </ul>
				                        </div>
				                    </div>
				                </div>
				             <% }//for안 if
		   				}//for
		   			}//for밖 if%> --%>
                

			</div>
        </div>
    </section>
    <!-- End 댓글&작성자후기 중 댓글 -->
	<!-- 댓글&작성자후기 중 작성자후기 -->                        
    <section class="py-5">
        <div class="container">
            <div class="row text-left p-2 pb-3">
                <h4 id="boardView_c1">작성자후기</h4>
            </div>

            <!--Start comment_작성자후기-->
            <div id="carousel-related-product">
            	<%-- <%if(comments.isEmpty()){ %>
            		<h6>아직 작성된 작성자 후기가 없습니다</h6>
            	
            	<%} else {
            	
		   				for(BoardComment bc : comments){
		   					if(bc.getBoardCommentLevel()==1){%>
				                <div class="p-2 pb-3">
				                    <div class="product-wap card rounded-0">
				                        <div class="rounded-0">
				                            <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
				                                <!-- <ul class="list-unstyled">
				                                    <li><a class="btn btn-success text-white" href="shop-single.html"><i class="far fa-heart"></i></a></li>
				                                    <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="far fa-eye"></i></a></li>
				                                    <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="fas fa-cart-plus"></i></a></li>
				                                </ul> -->
				                            </div>
				                        </div>
				                        <div class="card-body">
				                            <a href="shop-single.html" class="h3 text-decoration-none"><%=bc.getBoardCommentWriter() %>작성자</a>
				                            <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
				                                <li><%=bc.getBoardCommentContent() %>댓글내용</li>
				                            <p class="text-center mb-0"><%=bc.getBoardCommentDate() %>게시시간</p>
				                            </ul>
				                        </div>
				                    </div>
				                </div>
				                
				             <%} else{%>
				                
								 <div class="p-2 pb-3">
				                    <div class="product-wap card rounded-0">
				                    ㄴ답글
				                        <div class="rounded-0">
				                            <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
				                                <!-- <ul class="list-unstyled">
				                                    <li><a class="btn btn-success text-white" href="shop-single.html"><i class="far fa-heart"></i></a></li>
				                                    <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="far fa-eye"></i></a></li>
				                                    <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="fas fa-cart-plus"></i></a></li>
				                                </ul> -->
				                            </div>
				                        </div>
				                        <div class="card-body">
				                            <a href="shop-single.html" class="h3 text-decoration-none"><%=bc.getBoardCommentWriter() %>작성자</a>
				                            <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
				                                <li><%=bc.getBoardCommentContent() %>댓글내용</li>
				                            <p class="text-center mb-0"><%=bc.getBoardCommentDate() %>게시시간</p>
				                            </ul>
				                        </div>
				                    </div>
				                </div>
				             <% }//for안 if
		   				}//for
		   			}//for밖 if%> --%>
                


                
			</div>
        </div>
    </section>
    <!-- End 댓글&작성자후기 중 작성자후기 -->
    
    
<%@ include file="/views/common/footer.jsp" %>