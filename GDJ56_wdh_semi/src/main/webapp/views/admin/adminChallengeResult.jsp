<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.List, com.wdh.member.vo.Member, com.wdh.challenge.model.vo.Challenge"%>    
<%

List<Challenge> challenger=(List<Challenge>)request.getAttribute("challenger");

%>
<%@ include file="/views/common/adminHeader.jsp" %>

<style>
        #test_btn1{
            border-radius: 10px;
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
                        <h1 class="mt-4">첼린지 운영자</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">첼린지 결과를 출력합니다.</li>
                        </ol>
                    </div>
                     <div class="row">
		                            
		                            <div class="card-body">
		                                <table id="datatablesSimple">
							            <thead>
							                <tr>
								                <th>챌린지명</th>
	                                            <th>확인</th>
                                      
							                </tr>
							            </thead>
							            <tbody>
							       	  		<%if(challenger.isEmpty()){ %>
						       	  		<tr>
						       	  			<td colspan="11"><h3>조회된 회원이 없습니다</h3></td>
						       	  		</tr>
						       	  		<%}else{ 
						       	  			for(int i=0;i<challenger.size();i++){
						       	  		%>
<%-- 						       	  		<form action="<%=request.getContextPath() %>/admin/dropMember.do?memberNo=<%=members.get(i).getMember_no()%>" method="post"> --%>
						       	  			<tr>
													<td><%=challenger.get(i).getChallenge_name() %></td> 
													<td>
														<button type="button" onclick="location.href='<%=request.getContextPath() %>/admin/challendAttanceMemberList.do?challengeNo=<%=challenger.get(i).getChallenge_no()%>';">신청회원보기</button>
													</td>				
						       	  			</tr>
						       	  		<%} 
						       	  		}%>
						       	  		<!-- </form> -->
							            </tbody>
							        </table>
		                            </div>
	                            </div>
              
	             </main>