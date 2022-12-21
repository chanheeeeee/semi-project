<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<style>
	section#message-container{width:600px; margin:0 auto; text-align:center;}
	section#message-container h2{margin:10px 0;}
	table#tbl-message{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
	table#tbl-message th, table#tbl-board td {border:1px solid; padding: 5px 0; text-align:center;} 
	/*글쓰기버튼*/
	input#btn-add{float:right; margin: 0 0 15px;}
	/*페이지바*/
	div#pageBar{margin-top:10px; text-align:center; background-color:rgba(0, 188, 212, 0.3);}
	div#pageBar span.cPage{color: #0066ff;}
	
	table {
	  border-collapse: collapse;
	  text-align: left;
	  line-height: 1.5;
	
	}
	table thead th {
	  padding: 10px;
	  font-weight: bold;
	  vertical-align: top;
	  color: #369;
	  border-bottom: 3px solid #036;
	}
	table tbody th {
	  width: 150px;
	  padding: 10px;
	  font-weight: bold;
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	  background: #f3f6f7;
	}
	table td {
	  width: 350px;
	  padding: 10px;
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	  text-align: center;
	}
	</style>
	
	
	<section id="message-container">
		<h2>나에게 온 쪽지 확인하기 </h2>
		<table id="tbl-message">
		<thead>
			<tr>
				<th>번호</th>
				<th>보낸사람</th>
				<th>내용</th>
				<th>시간</th>
				<th>삭제</th>
			</tr>
			</thead>
			<tbody id="tbl-body">
			</tbody>
		</table>
	</section>
	
	<script>
	$(function(){
		list();
	});
	
	//쪽지 목록 가져오기
	function list(){
		$.ajax({
			url:"<%=request.getContextPath()%>/member/messageList.do",
			data:{},
			dataType:'json',
			type:'POST',
			success:data=>{
				console.log(data);
				let list = "";
					if(data.length == 0){
					list += "<tr><td colspan=5>쪽지가 없습니다.</tr>";
				}else{
					for(let i=0 ; i<data.length; i++){
						list += "<tr>";
						list += "<td>"+(i+1)+"</td>";
						list += "<td>"+data[i].writer_nickname+"</td>";
						list += "<td>"+data[i].msg_content+"</td>";
						list += "<td>"+data[i].msg_date+"</td>";
						list += '<td><input type="button" value="삭제" onclick="del('+data[i].msg_no+');"></td>';
						list += "</tr>";
					};						
				}
				$("#tbl-body").html(list);
			}
		});
	}
	
	//쪽지 삭제하기
	function del(msg_no){
		if(confirm("삭제하시겠습니까?")==true){
			$.ajax({
				url:"<%=request.getContextPath()%>/member/messageDelete.do",
				data:{"msg_no":msg_no},
				dataType:'json',
				type:'POST',
				success:data=>{
					 console.log(data.result);
					 if(data.result > 0){
						 alert("삭제되었습니다.");
						 list();	//리스트 메소드 다시 호출
					 }else{
						 alert("삭제에 실패하였습니다.");
					 }
				}
			});
		}
		

	}
	</script>


<%@include file="/views/common/footer.jsp"%>