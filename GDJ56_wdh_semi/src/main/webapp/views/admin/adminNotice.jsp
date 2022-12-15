<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.wdh.notice.model.vo.Notice" %>
<%
	List<Notice> notice=(List<Notice>)request.getAttribute("notice");
%>
    
 
 <%@ include file="/views/common/adminHeader.jsp" %> 
 
  <style>
        #test_btn1{
            border-radius: 5px;
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
    
		    <script>
		    $(document).ready(function(){
		        //최상단 체크박스 클릭
		        $("#checkall").click(function(){
		            //클릭되었으면
		            //console.log($("#checkall").prop("checked"));
		            if($("#checkall").prop("checked")){
		                //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
		                $("input[name=chk]").prop("checked",true);
		                //클릭이 안되있으면
		            }else{
		                //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
		                $("input[name=chk]").prop("checked",false);
		            }
		        })
		    })
			</script>
    
     		 
    
			<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">공지사항 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">공지사항을 관리합니다.</li>
                        </ol>
                       
                       <hr class="one">
                       <div id="btn_group">
                       <p>
                       <button id="test_btn1" onclick="location.replace('<%=request.getContextPath()%>/views/notice/subNotice.jsp')">공지 작성</button>
                       선택된 게시글을 <button id="test_btn1" onclick="location.replace('<%=request.getContextPath()%>/views/notice/UpdateNotice.jsp')">수정</button> 
                       <button id="test_btn1" value="삭제하기";"></button>
                       <%-- <button id="test_btn1" value="삭제하기" onclick="(<%=n.getNoticeNo()%>);"></button> --%>
                       합니다.</p>
                       </div> 
                       <hr class="one">
                        
                       <section id="board-container">
			            <table id="datatablesSimple">
			            <thead>
			                <tr>
			                	<th><input type="checkbox" id="checkall"></th>
			                    <th>번호</th>
			                    <th>제목</th>
			                    <th>작성자</th>
			                    <th>작성일</th>
			                </tr>
			                </thead>
							<% if(notice.isEmpty()){ %>
							<tr>
								<td colspan="5"><h3>조회된 게시판이 없습니다.</h3></td>
							</tr>	
							<%}else{ 
								for(Notice n : notice){
							%>
							 <tr>
							 	<td><input type="checkbox" name="chk" /></td>
                				<td><%=n.getNoticeNo() %></td>
	                			<td><a href="<%=request.getContextPath()%>/notice/noticeView.do?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a></td>
		                		<td><%=n.getNoticeWriter() %></td>
		                		<td><%=n.getNoticeEnroll() %></td>
		                		<%} 
               	 			}%>
                			</tr>
                			</table>
               		 		
                			<br>
			                 <%-- 페이징 처리 --%>
			                <%--<div id="pageBar">
			                	<%=request.getAttribute("pageBar") %>
			                </div> --%>
			              	
			              	
			                
			                
			            </section>
			            <br>
			        </div> 
                  