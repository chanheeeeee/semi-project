<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="<%=request.getContextPath() %>/js/jquery-1.11.0.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath() %>/js/templatemo.js"></script>
<script src="<%=request.getContextPath() %>/js/custom.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/post.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<title>답장하기</title>
</head>
<body style="margin:0; ">
	<div id="body">
	<div class = "field half first"  >
		<label for="send_msg" >보낸 사람</label>
		<input type="text" id="receive_nickName" name="" value="<%=request.getAttribute("nickName") %>" readonly="readonly">
		<input type="hidden" id="msgNo" name="" value="<%=request.getAttribute("msgNo") %>">
		<input type="hidden" id="wdNo" name="" value="<%=request.getAttribute("wdNo") %>">
		<input type="hidden" id="receive_messenger" name="" value="<%=request.getAttribute("receive_messenger") %>">
	</div>
	<div class="field">
		<textarea id="message" rows="6" name="message" readonly="readonly" class="txtArea"><%=request.getAttribute("content") %></textarea>	
	</div>
	<br>
	<div style="text-align: center;">
		<input type="button" value="답장하기" class="button" id="open" style="text-align:center; margin-top:20px; justify-content:center;"/>
	</div>
	<div id="inputDiv" style="display: none;">
		<div class="field">
			<textarea id="contents" rows="6" name="contents" class="txtArea"></textarea>	
		</div>
		<div style="text-align: center;">
			<input type="button" value="전송하기" class="button" id="sendMsg" style="text-align:center; margin-top:20px; justify-content:center;"/>
		</div>
	</div>
	</div>
	
	<script>
	$("#open").on("click", function(){
		$("#inputDiv").show();
	});
	
	$("#sendMsg").on("click",function(){
		const wdNo = $("#wdNo").val();//게시글번호
		const content = $("#contents").val();//내용
		const r_msg = $("#receive_messenger").val();//받는사람 시퀀스 -> 보낸사람
		
		$.ajax({
			url:"<%=request.getContextPath()%>/member/MessageServiceConServlet.do",
			data:{"wdNo":wdNo , "receive_messenger":r_msg , "message":content},
			type:'POST',
			dataType:'json',
			success:data=>{
				console.log(data);
				if(data.result > 0){
					//쪽지보냄 성공
					alert("메세지 전송 성공");
					window.close(); 
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
	
	<style>
		#receive_nickName {
/*  		  width: 150px;
		  height: 32px;
		  border: 0;
		  border-radius: 15px;
		  outline: none;
		  padding-left: 10px;
		  background-color: rgba(223, 223, 223, 0.422); */
		  font-weight:bold;font-size: 15px;
		  border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
		  font-family:'Jua';	
		
		}		
		
		textArea.txtArea {
			margin-top:20px;
			width: 100%;
			height: 180px;
			padding: 10px;
			box-sizing: border-box;
			border: solid 2px #1E90FF;
			border-radius: 10px;
			font-size: 16px;
			resize: both;
			font-family:'Jua';
		
		}
		#body{
			padding:20px;
			font-family:'Jua';
			
		}

	</style>
