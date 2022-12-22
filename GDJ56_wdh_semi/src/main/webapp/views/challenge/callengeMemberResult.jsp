<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.wdh.challenge.model.vo.Challenge2" %>
<%
List<Challenge2> challenge=(List<Challenge2>)request.getAttribute("challenge");
%>    

 <%@ include file="/views/common/adminHeader.jsp" %>
 
    
    <div style="border:0px solid red;width:1100px;height:695px;margin-left:80px;">
				            
				           <div style="display:flex">
				          <%if(challenge==null||challenge.isEmpty()){ %>    
				            <div style="border:0px solid green;width:270px;height:300px;text-align: center; ">
				                 <P>업로드된 회원 이미지가 없습니다.</P>
				                </div>
				               <%}else{ 
				                 for(Challenge2 ch : challenge)  { %> 
				                        <div style="border:0px solid green;width:270px;height:300px;text-align: center; ">
				                            <div style="border:0px solid magenta;width:180px;height:230px; margin-left :50px; margin-top :5px; " >
				                                <img src="<%=request.getContextPath()%>/upload/challenge_user/<%=ch.getFile_path()%>" alt="" style="width:100%;height:100%;margin:auto;border-radius:20px;">
				                            </div>
				                        </div>           
				                        
				                     <% }
				                    }%> 
				                    
				                    </div> 