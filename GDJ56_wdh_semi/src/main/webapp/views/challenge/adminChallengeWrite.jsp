<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.wdh.challenge.model.vo.Challenge" %>
<%
Challenge ch=(Challenge)request.getAttribute("ch");
%>

<%@ include file="/views/common/adminHeader.jsp" %>

					<div style="background-image:url('<%=request.getContextPath()%>/images/backback.png')">
			        
			        <section id="notice-container">
			                <h2><strong>챌린지 등록하기</strong></h2>
			         <nav class="bg-light">      
			            <form action="<%=request.getContextPath() %>/admin/challengeWriteEnd.do" method="post" enctype="multipart/form-data">
			                <table id="tbl-board" border="1">
			                <img src="<%=request.getContextPath() %>/images/fontlogo.png" width="450" height="450"
						     onclick="fn_upfile();">
						     <br>
						   <input type="file" name="upfile" style="display:none">
						   <div id="images"></div>
						     <script>
			                 // ajax를 이용한 파일 업로드
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
 
									 <!-- 프로젝트의 실제 경로 -->
									 <!-- 경로:
									 <%=request.getRealPath("/") %> -->
									</div>
					                
									<div class="inputArea">
					                <br>
					                
					                <th>챌린지 제목
					                	<td><input type="text" name="name" id="name" required placeholder="챌린지 입력해주세요" value=""/></td>                 
									</th> 	
								<th>일자
										<td><input type="date" name="date" id="date" required/></td>
								</th>
								</table>			 
								<br>
					             <input class="ch-btn" type="submit" value="등록" onclick="">
					             <input class="ch-btn" type="submit" value="취소" onclick="">
			    				<br>
					        </form>
					    </section>
					    
					        <br>
					   </div>
					   </div>
				