<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
        #test_btn3{
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
			<div class="container-fluid px-4">
				<h1 class="mt-4">챌린지 관리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active">챌린지를 등록과 삭제 공개/비공개 여부를 결정
						합니다.</li>
				</ol>
		
				<hr class="one">
				<div id="btn_group">
					<p>
						선택된 항목을
						<button id="test_btn1">등록</button>
						<button id="test_btn2">삭제</button>
						<button id="test_btn3">공개/비공개</button>
						합니다.
					</p>
				</div>
				<hr class="one">