<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,java.util.Map" %>
<%
	List<Map<String,String>> challengeList=(List<Map<String,String>>)request.getAttribute("challengeList");
	
%>
  <%@ include file="/views/common/header.jsp" %>
 <style>
 	section#container{
 		display:flex;
		flex-direction: column;
 		justify-content: center;
		align-items: center;
		padding:5%;
 	}
 	div.execcontainer{
 		display:flex;
 		justify-content: center;
 		flex-wrap: wrap;
 		width:80%;
 		min-height:400px;
 	}
	 div.execcontainer>img{
		width:70px;
		height:70px;
	 }
	 div#challengeImg{
		display: flex;
		justify-content: center;
		margin-bottom:5px;
	 }
 </style>
  <section id="container">
  	<div id="titleLogo">
  		<img src="<%=request.getContextPath() %>/upload/challenge/<%=challengeList.get(0).get("challengeImg")%>"
  		width="300" height="300">
  	</div>
	<h2> <%=challengeList.get(0).get("challengeName") %> 챌린지 당신의 도전!</h2>
	<br>
  	<div class="execcontainer">
  		<%for(int i=0,j=0;i<28;i++){ %>
  		<div class="execchallenge">
  			<%if(j<challengeList.size()&&challengeList.get(j).get("dayCnt")!=null
  				&&Integer.parseInt(challengeList.get(i).get("dayCnt"))==(i+1)){j++; %>
  				<img src="<%=request.getContextPath() %>/images/challengesuccess.png" title="<%=i+1%>">
  			<%}else{ %>
    			<img src="<%=request.getContextPath() %>/images/challengebutton.png" title="<%=i+1%>">
    		<%} %>
    	</div>
    	<%}%>
	</div>
	  <!-- The Modal -->
	  <div class="modal" id="myModal">
		<div class="modal-dialog">
		  <div class="modal-content">
	  
			<!-- Modal Header -->
			<div class="modal-header">
			  <h4 class="modal-title">challenge등록하기</h4>
			  <button type="button" class="close" onclick="$('#myModal').hide();">&times;</button>
			</div>
	  
			<!-- Modal body -->
			<div class="modal-body">
			  <div id="challengeImg">
			  </div>
			  <input type="file" name="challengeImg" id="addChallenge">
			  <input type="hidden" name="day">
			</div>
	  
			<!-- Modal footer -->
			<div class="modal-footer">
			  <button type="button" class="btn btn-primary" onclick="sendData()">저장하기</button>
			  <button type="button" class="btn btn-danger" onclick="$('#myModal').hide();">닫기</button>
			</div>
	  
		  </div>
		</div>
	  </div>
	<script>
		$(()=>{
			$(".execchallenge").click(e=>{
				const preImgCheck=$(e.target).parent().prev().find("img");
				if(preImgCheck.attr("src")!=undefined&&preImgCheck.attr("src").includes("button.png")){
					alert("이전챌린지를 클릭하지않았습니다.");
				}else{
					let choice=$(e.target).attr("title");
					console.log(choice);
					$("#myModal").find("input[name=day]").val(choice);
					$("#myModal").show();
				}
			})
			$("div.modal-body>input[type=file]").change(e=>{
				const reader=new FileReader();
				reader.onload=e=>{
					const img=$("<img>").attr({
						src:e.target.result,
						width:"200px",
						height:"200px",
					}).css("borderRadius", "50px");
		
					$("div.modal-body>div#challengeImg").html(img.attr("src",e.target.result));
				}
				reader.readAsDataURL(e.target.files[0]);
			
			});
		})
		const sendData=(e)=>{
			const data=new FormData();
			console.log($("#addChallenge")[0].files[0]);
			data.append("file",$("#addChallenge")[0].files[0]);
			data.append("challengeNo",<%=challengeList.get(0).get("challengeNo")%>);
			data.append("day",$("input[name=day]").val());
			const number=$("input[name=day]").val();
			 $.ajax({
			 	url:"<%=request.getContextPath()%>/challenge/enrollChallenge.do",
			 	data:data,
			 	type:"post",
			 	processData:false,
			 	contentType:false,
			 	success:data=>{
			 		if(data>0){
			 			
			 			alert("도전성공을 축하합니다.!");
			 			$("img[title="+number+"]").attr("src","<%=request.getContextPath() %>/images/challengesuccess.png");
						// modal 비워주기
			 			$(".modal-footer>button.btn-danger").click();
			 		}else{
			 			alert("등록에 실패했습니다 다시 시도하세요! 죄송합니다.ㅠㅠ");
			 		}
			 	}
			 });
		}
	</script>

  </section>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  <%@ include file="/views/common/footer.jsp" %>