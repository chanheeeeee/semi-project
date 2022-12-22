<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<style>
	section#message-container{width:600px; margin:0 auto; text-align:center; font-family:'jua';}
	section#message-container h2{margin:10px 0;}
	table#tbl-message{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
	table#tbl-message th, table#tbl-board td {border:1px solid; padding: 5px 0; text-align:center;} 
	/*글쓰기버튼*/
	input#btn-add{float:right; margin: 0 0 15px;}
	/*페이지바*/
	div#pageBar{margin-top:10px; text-align:center; background-color:rgba(0, 188, 212, 0.3);}
	div#pageBar span.cPage{color: #0066ff;}
	
/* 	table {
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
	} */
	</style>
	
	
<section id="message-container">

		<h2 style="margin-top:100px; margin-bottom:30px; font-weight:bold;">받은 쪽지함</h2>
		<div>
		<table id="tbl-message" style="margin-left:0%;margin-right:0%;margin-bottom:100px; border:0;border:none;">
		<thead>
			<tr style="text-align: center;">
				<th style="border:none;">번호</th>
				<th style="border:none;">보낸사람</th>
				<th style="border:none;">내용</th>
				<th style="border:none;">읽음확인</th>
				<th style="border:none;">시간</th>
				<th style="border:none;">삭제</th>
			</tr>
			</thead>
			<tbody id="tbl-body">
			</tbody>
		</table>
	</div>
	<form id="openRePop" name="openRePop">
		<input type="hidden" id="msgNo" name="msgNo">
		<input type="hidden" id="nickName" name="nickName">
		<input type="hidden" id="content" name="content">
		<input type="hidden" id="wdNo" name="wdNo">
		<input type="hidden" id="receive_messenger" name="receive_messenger">
	</form>
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
				//let list = "";
				$("#tbl-body").html("");
				if(data.length == 0){
					const tr=$("<tr>");
					//list += "<tr><td colspan=5>쪽지가 없습니다.</tr>";
					const td=$("<td colspan='5'>").text("쪽지가 없습니다");
					tr.append(td);
					$("#tbl-body").append(tr);
				}else{
					for(let i=0 ; i<data.length; i++){
						
						let tr=$("<tr>");
						let num=$("<td>").text((i+1));
						let sender=$("<td>").text(data[i].writer_nickname);
						let textlength = data[i].msg_content;
						if(textlength.length>=10){
							textlength = textlength.substr(0,10)+"...";
						}
						let atag = $("<a>").attr({//a테그 속성에 href넣기위해 .attr사용,
							href:"javascript:resend('"+data[i].msg_no+"','"+data[i].writer_nickname+"','"+data[i].msg_content+"','"+data[i].wdNo+"','"+data[i].msg_writer+"');"//java
						}).text(textlength);
						let content=$("<td>").append(atag);
						let read = $("<td>").text(data[i].read_yn);
						let date=$("<td>").text(data[i].msg_date);
						let deleteTd=$("<td>");
						let deleteInput=$("<input>").attr({
							type:"button",
							value:"삭제",
							name:data[i].msg_no
						});
						deleteInput.on("click",del);
						
						deleteTd.append(deleteInput);
						tr.append(num);
						tr.append(sender);
						tr.append(content);
						tr.append(read);
						tr.append(date);
						tr.append(deleteTd);
						/* list += "<tr>";
						list += "<td>"+(i+1)+"</td>";
						list += "<td>"+data[i].writer_nickname+"</td>";
						list += "<td>"+data[i].msg_content+"</td>";
						list += "<td>"+data[i].msg_date+"</td>";
						list += '<td><input type="button" value="삭제" onclick="del('+data[i].msg_no+');"></td>';
						list += "</tr>"; */
						$("#tbl-body").append(tr).html();
					};						
				}
			}
		});
	}
	
	//쪽지 삭제하기
	function del(e){//
		if(confirm("삭제하시겠습니까?")==true){
			$.ajax({
				url:"<%=request.getContextPath()%>/member/messageDelete.do",
				data:{"msg_no":e.target.name},
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
	
	function resend(msgNo, writer_nickname, msg_content, wdNo, msg_writer){
		$("#msgNo").val(msgNo);
		$("#nickName").val(writer_nickname);
		$("#content").val(msg_content);
		$("#wdNo").val(wdNo);
		$("#receive_messenger").val(msg_writer);
		
		open("","remessage","width=400,height=700");
		openRePop.method="POST";
		openRePop.action="<%=request.getContextPath()%>/member/reMessageServlet.do";
		openRePop.target="remessage";
		openRePop.submit();
	}
	</script>


<%@include file="/views/common/footer.jsp"%>