<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List, com.wdh.qs.model.vo.Question" %>
    
    
<%
	List<Question> question=(List<Question>)request.getAttribute("question");
%>     

<%@ include file="/views/common/adminHeader.jsp" %>

<style>
        #test_btn1{
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            /* margin-right:-4px; */
        }
        #test_btn2{
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;    
            /* margin-left:-3px; */
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
                        <h1 class="mt-4">1대1 문의글 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">문의가 접수된 글을 관리 합니다.</li>
                        </ol>
                         <hr class="one">
                       <div id="btn_group">
                       
                       
                       </div> 
                       <hr class="one">
                        <div class="row">
                            
              <section id="board-container">
<!--               <form id="qsFrm" method="post"> -->
			            <table id="datatablesSimple">
			            <thead>
			                <tr>			  
			                    <th>번호</th>
			                    <th>말머리</th>
			                    <th>제목</th>
			                    <th>작성자</th>
			                    <th>작성일</th>
			                    <th>처리</th>
			                    <th>답변</th>
			                    <th>삭제</th>
			                </tr>
			                </thead>
							<% if(question.isEmpty()){ %>
							<tr>
								<td colspan="8"><h3>조회된 게시판이 없습니다.</h3></td>
							</tr>	
							<%}else{ 
								for(Question qs : question){
							%>
							 <tr>
                				<td><%=qs.getQsNo() %></td>
                				<td><%=qs.getQsHeadTitle() %></td>
	                			<td><a href="<%=request.getContextPath()%>/cs/qSView.do?qsNo=<%=qs.getQsNo()%>"><%=qs.getQsTitle()%></a></td>
		                		<td><%=qs.getMember().getMember_id() %></td>
		                		<td><%=qs.getQsDate() %></td>
		                		<td><%=qs.getQsResult() %></td>
		                		<td><input type="button" value="답변" onclick="location.replace('<%=request.getContextPath()%>/cs/qsView.do?qsNo=<%=qs.getQsNo()%>')"></td>
		                		<td><input type="button" value="삭제" onclick="fn_deleteQs(<%=qs.getQsNo()%>);"></td>
		                		<%} 
               	 			}%>
                			</tr>
                			</table>
                			<br>
<!--                 			</form> -->
			            </section>
			            <br>
			        </div> 
        </div>
<script>
	//삭제
	const fn_deleteQs=(qsNo)=>{
		location.replace("<%=request.getContextPath()%>/cs/deleteQs.do?no="+qsNo);
<%-- 		$("#qsFrm").attr("action","<%=request.getContextPath()%>/cs/deleteQs.do?no="+qsNo); --%>
// 		$("#qsFrm").submit();
	}
</script>