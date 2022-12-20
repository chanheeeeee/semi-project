<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="<%=request.getContextPath() %>/js/jquery-1.11.0.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath() %>/js/templatemo.js"></script>
<script src="<%=request.getContextPath() %>/js/custom.js"></script>
<%


%>
<title>쪽지보내기</title>
</head>
<body>
	<div class = "field half first">
		<label for="send_msg">보내는 사람</label>
		<input type="hidden" id="send_messenger" name="" value="" >
	</div>
	
	<div class = "field half">
		<label for="receive_msg">받는 사람</label>
		<input type="hidden" id="receive_messenger" value="">
	</div>	
	
	<div class="field">
		<p>내용 : </p>
		<textarea id="message" rows="6" name="message"></textarea>	
	</div>	
		<input type="button" value="발송" class="special" id="sendMsg"/>
	
	<script>
	$("#sendMsg").on("click",function(){
		console.log("Asfsf");
		const s_msg = $("#send_messenger").val();
		const r_msg = $("#receive_messenger").val();
		const text = $("#message").val();
		
		$.ajax({
			url:"<%=request.getContextPath()%>/member/MessageServiceConServlet.do",
			data:{"send_messenger":s_msg , "receive_messenger":r_msg , "message":text},
			type:'POST',
			dataType:'json',
			success:result=>{
				console.log(data);
				
				if(result > 0){
					//쪽지보냄 성공
					alert("메세지 전송 성공");
				}else{
					alert("메세지 전송 실패");
				}
			},error:function(e,r,m){
   						console.log(e);
   						console.log(r);
   						console.log(m);
   			}
		});
	
	});
	
	
	
	
	
	</script>
