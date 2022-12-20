<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Start Script -->
<script src="<%=request.getContextPath() %>/js/jquery-1.11.0.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath() %>/js/templatemo.js"></script>
<script src="<%=request.getContextPath() %>/js/custom.js"></script>
<!-- End Script -->

</head>
<body>
	<div id="container">
		보낸사람<input type="text" size="4" id="sender" value="<%=request.getAttribute("nickName")%>" readonly="readonly">
		받는사람<input type="text" size="4" id="receiver"><br>
		<input type="text" id="sendMsg" placeholder="전송할 메세지 작성!">
		<input type="hidden" id="roomNo" value="<%=request.getParameter("roomNm")%>">
		<button id="btnSend">전송</button>
	</div>
	<div id="msgcontainer"></div>
	<script>
		//웹소켓서버에 연결하기
		//자바에서 기본으로 제공하므로 바로 스크립트로 사용하면됨!
		//주소
		//ws: http프로토콜이용
		//wss: https프로토콜이용
		//ws: 서버주소(//localhost:9090)/프로젝트주소/mapping 주소)
		const socket = new WebSocket("ws://localhost:9091/<%=request.getContextPath()%>/chatting");
		//주소잘적어야함! 이건 공부해서 9090으로 해놨으므로 나중에 꼭 주소 변경해야함!
		
		//소켓에는 서버에 접속이 완료됐을때 실행되는 함수 등록하기
		socket.onopen=e=>{
			console.log(e);
			console.log("채팅서버 접속!");
			//접속하였습니다 하면 여기에서 채팅 하면 됨
		}
		
		//서버에서 보낸 데이터를 처리하는 핸들러 등록
		socket.onmessage=e=>{
			console.log(e);	
			//메세지 분기처리
			//JSON을 사용후 split 사용 필요 없다!
			//const data = e.data.split(",");
			//json방식의 문자열을 다시 객체로 만들어 주는 함수
			//JSON.parse()
			const data = JSON.parse(e.data);
			console.log(data);
			const div=$("<div>").css("display","flex");
			const msg=$("<h3>").text(data["msg"]);//이구문으로 채팅창을 꾸밀수있다!
			const sender=$("<sup>").text(data["sender"]);
			/* if($("#sender").val()== data["sender"]){
				//센더에 작성되어있는 화면은 오른쪽으로 가고 그게 아니면 왼쪽으로 가라라는! 
				div.append(sender).append(msg).css("justify-content","right");
			}else if($("#sender").val()==data["receiver"]){
				div.append(sender).append(msg).css({"justify-content":"left","color":"lightgray"});
			}else if(data["receiver"]==""){
				div.append(sender).append(msg).css("justify-content","left");
			}
			$("#msgcontainer").append(div);
		//이 핸들러는 브라우저가 소켓에 연결되어있으므로 자동적으로 실행된다!
		*/
		
		//윗부분대신!
		if($("#sender").val()== data["sender"]){
			//센더에 작성되어있는 화면은 오른쪽으로 가고 그게 아니면 왼쪽으로 가라라는! 
			div.append(sender).append(msg).css("justify-content","right");
		}else{
			const style=data["receiver"]!=""?
					{"justify-content":"left","color":"lightgray"}:
					{"justify-content" : "left"};
			div.append(sender).append(msg).css(style);
		}
		$("#msgcontainer").append(div);
	//이 핸들러는 브라우저가 소켓에 연결되어있으므로 자동적으로 실행된다!
	}
	
		
		$("#btnSend").click(e=>{
			//작성한 메세지를 웹소켓서버에 전송하는 함수
			//1.작성한 데이터를 가져오기
			//2.send(전송할데이터)함수를 이용해서 데이터를 서버에 전송
			//3.보내는 데이터 패턴만들기
			//보낸사람, 메세지 작성!
			
			//","아이디값! 이걸로 어떤 사람이 보냈는지 구분할수있다! 아무거나 선택 가능!그건 개발자의 선택!
			
		/* 	const data=$("#sender").val() + "," + $("#receiver").val() + "," + $("#sendMsg").val();
			socket.send(data); */
			//send에서 보내면 서버에 @OnMessage를 만들어야지! 동작확인가능하다!
			
			
			//class Message{ 이거 생성후 위에 보다 아래처럼 작성 가능!
			//이렇게 객채화 시키면 키값이 고정된다!
			const data = new Message($("#roomNo").val(),
						$("#sender").val(),
						$("#receiver").val(),
						$("#sendMsg").val());
			console.log(data);
			//JSON.stringify객체를 객체는 javascript패턴문자열로 변환해주는 함수
			socket.send(JSON.stringify(data));//객체를 문자열로 변환해준다!
		});
		
		class Message{
			constructor(roomNo, sender, receiver, msg){
				this.roomNo = roomNo;
				this.sender = sender;
				this.receiver = receiver;
				this.msg = msg;
			}
		}
	</script>
</body>
</html>
