<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.List, com.wdh.member.vo.Member"%>    
<%
List<Member> members=(List<Member>)request.getAttribute("member");
// 	Member m=(Member)request.getAttribute("member");
%>

<%@ include file="/views/common/adminHeader.jsp" %>

	<style>
       #test_btn1{
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
    
    	<!-- //전체 선택 체크박스
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
			</script> -->
    

		<div id="layoutSidenav_content">
		                <main>
		                    <div class="container-fluid px-4">
		                        <h1 class="mt-4">회원 관리</h1>
		                        <ol class="breadcrumb mb-4">	               
		                            <li class="breadcrumb-item active">전체 회원을 관리합니다.</li>
		                        </ol>
		                        <hr class="one">
                        		<hr class="one">
		
		
		
		                        <div class="row">
		                            
		                            <div class="card-body">
		                                <table id="datatablesSimple">
							            <thead>
							                <tr>
								                <th>회원번호</th>
	                                            <th>아이디</th>
	                                            <th>이름</th>
	                                            <th>닉네임</th>
	                                            <th>성별</th>
	                                            <th>생년월일</th>
	                                            <th>이메일</th>
	                                            <th>전화번호</th>
	                                            <th>주소</th>
	                                            <th>등급</th>
	                                            <th>탈퇴</th>                                       
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
<%-- 						       	  		<form action="<%=request.getContextPath() %>/admin/dropMember.do?memberNo=<%=members.get(i).getMember_no()%>" method="post"> --%>
						       	  			<tr>
													<td><%=members.get(i).getMember_no() %></td>
													<td><%=members.get(i).getMember_id() %></td>
													<td><%=members.get(i).getName() %></td>
													<td><%=members.get(i).getMember_nickname() %></td>
													<td><%=members.get(i).getGender() %></td>
													<td><%=members.get(i).getBirth() %></td>
													<td><%=members.get(i).getEmail() %></td>
													<td><%=members.get(i).getPhone() %></td>
													<td><%=members.get(i).getAddress()%></td>
													<td><%=members.get(i).getGrade() %></td> 
													<td>
														<button type="submit" onclick="location.href='<%=request.getContextPath() %>/admin/dropMember.do?memberNo=<%=members.get(i).getMember_no()%>';">탈퇴</button>
													</td>				
						       	  			</tr>
						       	  		<%} 
						       	  		}%>
						       	  		<!-- </form> -->
							            </tbody>
							        </table>
		                            </div>
		                        </div>
		                    </div>
		                    
		                </main>
		            </div>
		        </div>