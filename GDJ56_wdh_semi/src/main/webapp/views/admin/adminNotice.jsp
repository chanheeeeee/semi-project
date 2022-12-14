<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.wdh.notice.model.vo.Notice" %>
<%
	List<Notice> notice=(List<Notice>)request.getAttribute("notice");
%>
   
 
 <%@ include file="/views/common/adminHeader.jsp" %> 
 
<%
	Notice n=(Notice)request.getAttribute("notice");
%>
 
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
    
			<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">공지사항 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">공지사항을 관리합니다.</li>
                        </ol>
                        <div id="btn_group">
                        <hr class="one">
                        <p>선택된 항목을 <button id="test_btn1" onclick="location.assign('<%=request.getContextPath()%>/notice/write.do');">삭제</button> 
                        <button id="test_btn1" onclick="location.assign('<%=request.getContextPath()%>/notice/write.do');">수정</button>
                        </div>
                        <hr class="one">
                        
                        <div style="text-align:center" id="tbl-board">
       
       		
       		
       		
       		
       		
                        

                       
            </div>
        </div>
        
       