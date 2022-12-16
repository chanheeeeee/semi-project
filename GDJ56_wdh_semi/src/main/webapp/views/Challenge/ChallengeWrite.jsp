<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.wdh.member.vo.Member" %>
<%
	Member loginMember=(Member)session.getAttribute("loginMember");
%>

<%@ include file="/views/common/adminHeader.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:::챌린지 등록하기 - 관리자:::</title>


					<div style="background-image:url('<%=request.getContextPath()%>/images/backback.png')">
			        <section id="notice-container">
			                <h2><strong>챌린지 등록하기</strong></h2>
			               
			            <form action="<%=request.getContextPath() %>/admin/adminWrite.do" 
			            method="post">
			                <table id="tbl-board" border="1">
			                <img src="<%=request.getContextPath() %>/images/parkBogum.jpg" width="500" height="500"
						     onclick="fn_upfile();">
						     <br>
						   <input type="file" name="upfile" style="display:none">
						   <div id="images"></div>
			                 <script>
							      const fn_upfile=()=>{
							         $("input[name=upfile]").click();
							      }
							      $("input[name=upfile]").change(e=>{
							         console.dir(e.target);
							         const reader=new FileReader();
							         reader.onload=e=>{
							            const img=$("<img>").attr({
							               src:e.target.result,
							               width:"200px",
							               height:"200px"
							            });
							         $("img").attr("src",e.target.result);
							         }
							         reader.readAsDataURL(e.target.files[0]);
							      });
							   </script>
			                <br>
			                <tr>
			                    <th>제 목</th>
			                    <td>&nbsp;&nbsp;<input type="text" name="Ch_title"></td>
			                </tr>
			                

			            </table>
			            <button type="submit" id="Chbtn">등록</button>
			            <button type="submit" id="Chbtn">취소</button>
			    <br>
			        </form>
			    </section>
			    
			        <br>
			        </div>
			        </div>
		