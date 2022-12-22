<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List,com.wdh.board.vo.*,com.wdh.member.vo.*" %>
<% 

	List<ReviewBoard> rbAllList = (List<ReviewBoard>)request.getAttribute("rbAllList");
	int BoardWriterNo = (int)request.getAttribute("BoardWriterNo");
%>

<script src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js"></script>
<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/fontawesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/post.css">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon"
	href="<%=request.getContextPath() %>/images/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath() %>/images/favicon.ico">

<link rel="stylesheet"

	href="<%=request.getContextPath() %>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/templatemo.css">


<div>

	<section class="py-5">
        <div class="container">
            <%-- <div class="row text-left p-2 pb-3" ><%= %>
                <h4 id="boardView_c2"><%=b.getMember().getMember_nickname()%>(<%=b.getMember().getMember_id() %>)님에 달린 후기</h4>
                <button 
                onclick="window.open('<%=request.getContextPath() %>/board/boardViewReviewAll.do?Review=all&BoardWriterNo=<%=b.getMember().getMember_no() %>','작성자후기더보기' ,'width=700, height=600');">작성자후기더보기</button>
            </div> --%>

            <!--Start comment_작성자후기-->
            <div id="carousel-related-product">
            	<%if(rbAllList.isEmpty()) {%>
            		<h6 style="margin-left:50px;">아직 작성된 작성자 후기가 없습니다</h6>
            	
            	<%} else {
            	
            		for(ReviewBoard rb : rbAllList){%>
		   					
				                <div class="p-2 pb-3">
				                    <div class="product-wap card rounded-0">
				                        <div class="card-body">	
				                        	<div style="display: flex; justify-content:space-between;">
				                        		<div style="display: flex;">
													<h6 style="text-align: left;">[ <%=rb.getReviewTitle() %> ]</h6>
													<!-- 5번 for문.. rb score만큼 warning -->
													<%for(int i=1;i<6;i++){ 
														if(rb.getReviewScore()>=i){%>
															<i class="fa fa-star text-warning"></i>
														<%}else{ %>
															<i class="fa fa-star text-secondary"></i>
														<%} 
													}%>
												</div>

											</div>
											<div style="display: flex; justify-content:flex-start; margin-top: 20px;">
												<%if(rb.getImg()!=null){ %>
													<img src="<%=request.getContextPath()%>/reviewImg/<%=rb.getImg()%>" alt="" style="width:80px; height:80px;">	
												<%} %>	                            
					                            <p style="margin-left:30px;"><%=rb.getReviewContent()%></p>
					                       	</div>
				                            <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
				                                <li></li>
				                            	<li class="text-center mb-0 primary"><%=rb.getReviewDate()%>게시시간</li>
				                            </ul>
				                        </div>
				                        
				                    </div>
				                </div>
				                

		   				<%}//for
		   			}//for밖 if%>
                


                
			</div>
        </div>
    </section>
	
	

</div>