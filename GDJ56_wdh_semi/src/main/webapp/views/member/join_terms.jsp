<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


	<style>
  form {
    font-family:"Gamja Flower";
    font: size 14px;
    border-radius:8px;
  }
  
  td {color: #080909;}
  *{margin: 0;padding: 0;box-sizing: border-box}
  body{background-color: #f7f7f7;}
  ul>li{list-style: none}
  a{text-decoration: none;}
  .clearfix::after{content: "";display: block;clear: both;}

  #joinForm{width: 800px;margin: 0 auto; text-align: center;}
  ul.join_box{border: 1px solid #ddd;background-color: #fff;}
  .checkBox,.checkBox>ul{position: relative;}
  .checkBox>ul>li{float: left;}
  .checkBox>ul>li:first-child{width: 85%;padding: 30px;font-weight: 600;color: #888;}
  .checkBox>ul>li:nth-child(2){position: absolute;top: 50%;right: 30px;margin-top: -12px;}
  .checkBox textarea{width: 96%;height: 96px; margin: 0 2%;background-color: #f7f7f7;color: #888; border: none; text-align: -webkit-match-parent;}
  .footBtwrap{margin-top: 15px;}
  .footBtwrap>li{float: left;width: 50%;height: 60px;}
  .footBtwrap>li>button{display: block; width: 100%;height: 100%; font-size: 20px;text-align: center; margin-left:-15px;}
  .fpmgBt1{background-color: #fff;color:#fff}
  .fpmgBt2{background-color: rgb(80, 80, 243);color: #fff}
  
     .button {
		  width: 80px;
		  height: 35px;
		  font-family: 'Roboto', sans-serif;
		  font-size: 14px;
		  text-transform: uppercase;
		  letter-spacing: 2.5px;
		  font-weight: 500;
		  color: #000;
		  background-color: rgba(223, 223, 223, 0.422);
		  border: none;
		  border-radius: 45px;
		  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		  transition: all 0.3s ease 0s;
		  cursor: pointer;
		  outline: none;
		  }
		
	.button:hover {
		  background-color: #2e93e5af;
		  box-shadow: 0px 15px 20px #6dbcfcaf;
		  color: #fff;
		  transform: translateY(-7px);
	}
   </style>



	<center>
	<section>

     <div id="joinForm">
       <ul class="join_box">
           <li class="checkBox check01">
               <ul class="clearfix">
                 <li>이용약관, 개인정보 수집 및 이용,
                     위치정보 이용약관(선택), 프로모션 안내
                     메일 수신(선택)에 모두 동의합니다.</li>
                 <li class="checkAllBtn">
                     <input type="checkbox" name="chkAll" id="chkAll" class="chkAll">
                 </li>
             </ul>
         </li>
               <li class="checkBox check02">
                   <ul class="clearfix">
                       <li>이용약관 동의(필수)</li>
                       <li class="checkBtn">
                           <input type="checkbox" name="chk" class="chk important"> 
                       </li>
                   </ul>
                   <textarea name="" id=""> 운동행 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 운동행 서비스의 이용과 관련하여 운동행 서비스를 제공하는 운동행주식회사(이하 ‘운동행’)와 이를 이용하는 운동행 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 운동행 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                  </textarea>
               </li>
               <li class="checkBox check03">
                   <ul class="clearfix">
                       <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                       <li class="checkBtn">
                           <input type="checkbox" name="chk" class="chk important">
                       </li>
                   </ul>
                   <textarea name="" id="">운동행 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 운동행 서비스의 이용과 관련하여 운동행 서비스를 제공하는 운동행 주식회사(이하 ‘운동행’)와 이를 이용하는 운동행 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 운동행 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                 </textarea>
               </li>
               <li class="checkBox check03">
                   <ul class="clearfix">
                       <li>위치정보 이용약관 동의(선택)</li>
                       <li class="checkBtn">
                           <input type="checkbox" name="chk" class="chk">
                       </li>
                   </ul>
                   <textarea name="" id=""> 운동행 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 운동행 서비스의 이용과 관련하여 운동행 서비스를 제공하는  운동행 주식회사(이하 ‘운동행’)와 이를 이용하는 운동행 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 운동행 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                   </textarea>
               </li>
               <li class="checkBox check04">
                   <ul class="clearfix">
                       <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
                       <li class="checkBtn">
                           <input type="checkbox" name="chk" class="chk">
                       </li>
                   </ul>

               </li>
           </ul>
           <ul class="footBtwrap clearfix">
               <li><input type="button" class="button" onclick="location.href='<%=request.getContextPath()%>/main.do';"  style="background-color:lightblue;" value="비동의"></li>
               <li><input type="button" class="button" id = "modal" value="동의"></li>
           </ul>
         </div>
      
</section>
</center>

<script>
window.onload = function () {
    //약관 목록의 길이
    const chkBoxLength = $("input.chk").length;

    $("#chkAll").on('click', function(event) {
        if(event.target.checked)  {
          $("input.chk").attr("checked", true);
        }else {
          $("input.chk").attr("checked", false);
      }
    });

    //체크박스 클릭했을때
    $("input.chk").on("click", function(){
      let count = 0;    //현재 체크되어 있는 약관 목록 개수 체크
      $("input.chk").each(function(){
        //체크되어있으면 checked, 체크되어있지 않으면 undefined
        if($(this).attr("checked") == "checked") {
        count++;
      }
      });
      if(count !== chkBoxLength){
          $("#chkAll").attr("checked", false);
        }else{
          $("#chkAll").attr("checked", true);
        }
    });
    
    $("#modal").on("click",function(){
    	let count=0;//갯수 확인을 위하여 변수 선언
    	//필수란을 가져와 포문을 돌린후 체크박스 갯수 확인한다
    	$(".important").each(function(){
    		if($(this).attr("checked") == "checked"){//만약 선택자 자신(this)가 checked 속성이 check가 되면
    			count++//값이 증가된다
    		}
    	});
    	
    	//필수 id값이 2개미만으로 체크되어있으면
    	if(count<2){
    		alert("필수는 모두 체크하셔야 합니다.");
    	}else{
    		location.href="<%=request.getContextPath()%>/member/join.do";
    	}
    });

    
  }

</script>


<%@include file="/views/common/footer.jsp"%>