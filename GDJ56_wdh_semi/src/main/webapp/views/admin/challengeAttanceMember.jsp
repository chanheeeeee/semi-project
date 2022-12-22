<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.List, com.wdh.member.vo.Member"%>    
<%

List<Member> members=(List<Member>)request.getAttribute("members");

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
								                <th>회원아이디</th>
								                <th>회원닉네임</th>
	                                            <th>확인</th>
                                      
							                </tr>
							            </thead>
							            <tbody>
							       	  		<%if(members.isEmpty()){ %>
						       	  		<tr>
						       	  			<td colspan="11"><h3>조회된 회원이 없습니다</h3></td>
						       	  		</tr>
						       	  		<%}else{ 
						       	  			for(int i=0;i<members.size();i++){
						       	  		%>
						       	  			<tr>
													<td><%=members.get(i).getMember_id() %></td>
													 <td><%=members.get(i).getMember_nickname() %></td>
													<td>
														<button type="test_btn1" 
														onclick="location.href='<%=request.getContextPath() %>/admin/callengeMemberResult.do?challengeNo=<%=request.getParameter("challengeNo")%>&memberNo=<%=members.get(i).getMember_no()%>';">결과확인하기</button>
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