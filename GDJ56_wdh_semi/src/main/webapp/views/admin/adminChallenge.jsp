<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.wdh.challenge.model.vo.Challenge" %>
<%@ page import="java.util.List" %>
<%
List<Challenge> challenge=(List<Challenge>)request.getAttribute("challenge");
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
						신규 챌린지를
						<button id="test_btn3" onclick="location.href='<%=request.getContextPath()%>/challenge/adminChallengeWrite.do'">등록</button>
						&nbsp; / 선택된 항목을
						<button id="test_btn3">삭제</button>
						합니다.
					</p>
				</div>
				<hr class="one">
					
					<!--게시판-->	
					<div style="border:0px solid red;width:1100px;height:695px;margin-left:80px;">
				            <div style="display:flex">
				          <%if(challenge==null||challenge.isEmpty()){ %>    
				            <div style="border:0px solid green;width:270px;height:300px;text-align: center; ">
				                 <P>등록된 첼린지가 없습니다.</P>
				                </div>
				         <!--데이터 출력  -->
				               <%}else{ 
				                 for(Challenge ch : challenge)  { %> 
				                        <div style="border:0px solid green;width:270px;height:300px;text-align: center; ">
				                            <div style="border:0px solid magenta;width:180px;height:230px; margin-left :50px; margin-top :5px; " >
				                                <img src="<%=request.getContextPath()%>/upload/challenge/<%=ch.getChallenge_img()%>" alt="" style="width:100%;height:100%;margin:auto;border-radius:20px;">
				                            </div>
				                            <div><a href="<%=request.getContextPath()%>/challenge/adminChallengeView.do?challenge_No=<%=ch.getChallenge_no()%>" style="color: black !important;font-size:20px !important;" ><%=ch.getChallenge_name()%></a></div>
				                        </div>           
				                        
				                     <% }
				                    }%> 
				                    
				                    <!--반복문에서 뺴야함  -->
				                    </div> 
				
				
				
				
				
				