<%@page import="com.wdh.mypage.vo.Diary"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<style>
	a {color: black;}
</style>
<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="<%=request.getContextPath() %>/mypage/about.do">
                <span class="d-none d-lg-block">
                <% 
					if(loginMember.getProfile() == null) { %>
									
					<img class="profile img-fluid img-profile rounded-circle" style="width: 200px; height: 200px;"
                      							src="<%=request.getContextPath()%>/assets/img/pocha.jpg" />
                      							
                    <% } else { %>
                      			
                    <img class="profile img-fluid img-profile rounded-circle" style="width: 200px; height: 200px;"
                      							src="<%=request.getContextPath()%>/upload/profile/<%= loginMember.getProfile() %>" />
                      							
                    <% } %>
                </span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="<%=request.getContextPath() %>/mypage/about.do">내 정보</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/lockscreen.do'>정보수정</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/mycontent.do'>내 활동</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/diary.do'>다이어리</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/mypage/leave.do'>탈퇴</a></li>
                </ul>
            </div>
        </nav>
        
        
        <!-- Page Content-->
            <!-- diary -->
	<section class="content-header" id="diary">
    	<div class="container-fluid">
        	<div class="row mb-2">
        		<div class="col-sm-6">
        			<h1>My Diary</h1>
        		</div>
            	<div class="col-sm-6">
	               	<ol class="breadcrumb float-sm-right">
		               	<li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/mypage/about.do">Home</a></li>
		             	<li class="breadcrumb-item active">Calendar</li>
	                </ol>
            	</div>
          	</div>
       	</div><!-- /.container-fluid -->
      </section>
      
  	<section class="content" style="margin-left: 23%; width: 85%;">
  		<div class="col-md-9">
        	<div class="card card-primary">
        		<div class="card-body p-0">
					<div id='calendar'></div>
				</div>
			</div>
		</div>
	</section>
	
	 <!-- 일정 출력 Modal -->
		<div class="modal fade" id="diaryMore" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        
		        <h4 class="modal-title" id="myModalLabel">내 운동 상세 기록</h4>
		        
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-right: 0;">
		        	<span aria-hidden="true" name="close">×</span>
		        </button>
		      </div>
		      <div class="modal-body" id="content" style="margin-bottom: -17%; margin-left: -12%; text-align: center;">
		      <!-- <input type="text" class="form-control" id="diaryId" style="width: 50%;"> -->
		      <div class="col-sm-10" style="">
		       		<label for="inputTitle" class="col-form-label">내 운동: </label> <label id="d_title"></label>
		       </div>
		       <div class="col-sm-10" style="">
		       	<label for="inputContent" class="col-form-label">메모: </label> <label id="d_content"></label>
		       	</div>
		       	<div class="col-sm-10" style="">
		       	<label for="inputStart" class="col-form-label">시작합니다: </label> <label id="d_start"></label>
		       	</div>
				<div class="col-sm-10" style="">
		       	<label for="inputEnd" class="col-form-label">마칩니다: </label> <label id="d_end"></label>
		       	</div>
		      </div>
		      <!-- <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal" name="deleteDiary">삭제</button>
		        <button type="button" class="btn btn-primary" name="">수정</button>
		      </div> -->
		    </div>
		  </div>
		</div>
	<!-- /Modal -->
	
	<!-- 빈 날짜 클릭시 Modal -->
		<div class="modal fade" id="diaryAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        
		        <h4 class="modal-title" id="myModalLabel">내 운동 등록</h4>
		        
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-right: 0;">
		        	<span aria-hidden="true" name="close1">×</span>
		        </button>
		      </div>
		      
		      <!-- 일정 저장 모달폼 설정 -->
		      <div class="modal-body" id="content" style="margin: 3%; margin-bottom: 17%;">
				<form class="form-horizontal" id="updateDiaryFrm" action="<%= request.getContextPath() %>/mypage/updateDiary.do" method="post">
	    			<div class="form-group row" style="margin-top: -4.5%;">													
				      	<div class="col-sm-10" style="">
				      		<label for="inputTitle" class="col-form-label">운동</label>
					       	<input type="text" class="form-control" id="title" style="width: 50%;">
					    </div>
					    <div class="col-sm-10" style="margin-top: 2%;">
						    <label for="inputContent" class="col-form-label">메모</label>
						    <input type="text" class="form-control" id="memo" style="width: 70%; height: 55%;">
					    </div>
					    <div class="col-sm-10" style="margin-top: 2%;">
						    <label for="inputStart" class="col-form-label">시작합니다</label>
						    <input type="datetime-local" class="form-control" id="start" style="width: 50%;" value="">
					    </div>
					    <div class="col-sm-10" style="margin-top: 2%;">
						    <label for="inputEnd" class="col-form-label">마칩니다</label>
						    <input type="datetime-local" class="form-control" id="end" style="width: 50%;">
					    </div>
					     <div class="col-sm-10" style="margin-top: 4%;">
						    <label for="title" class="col-form-label">색상 선택</label>
				        	<div class="col-9 btn-group w-100 my-20">
					         	<ul class="fc-color-picker" id="color-chooser">
                                    <li><a class="text-primary" href="#"><i class="fas fa-square"></i></a></li>
                                    <li><a class="text-warning" href="#"><i class="fas fa-square"></i></a></li>
                                    <li><a class="text-success" href="#"><i class="fas fa-square"></i></a></li>
                                    <li><a class="text-danger" href="#"><i class="fas fa-square"></i></a></li>
                                    <li><a class="text-info" href="#"><i class="fas fa-square"></i></a></li>
                                </ul>
				        	</div>
			        	</div>
					</div>
				</form>
			  </div>
			  
		      <div class="modal-footer" id="test">
		        	<button type="button" id="addBtn" class="btn btn-primary" name="addDiary">추가</button>
		      </div>
		    </div>
		  </div>
		</div>
	<!-- /Modal -->
	
<script>
	/* const now = new Date(); // 현재 시간
	const utcNow = now.getTime() + (now.getTimezoneOffset() * 60 * 1000); // 현재 시간을 utc로 변환한 밀리세컨드값
	const koreaTimeDiff = 9 * 60 * 60 * 1000; // 한국 시간은 UTC보다 9시간 빠름(9시간의 밀리세컨드 표현)
	const koreaNow = new Date(utcNow + koreaTimeDiff); // utc로 변환된 값을 한국 시간으로 변환시키기 위해 9시간(밀리세컨드)를 더함 */
	//document.getElementById('start').value = new Date();
	//console.log(koreaNow);
	//console.log(document.getElementById('start').value);
	//document.getElementById('end').value = new Date();
	//new Date(utcNow + koreaTimeDiff).toISOString().slice(0, 16);
	//document.getElementById('end').value= koreaNow;
	//new Date(utcNow + koreaTimeDiff).toISOString().slice(0, 16);
	
	//document.getElementById('start').value= new Date().toISOString().slice(0, 16);
	//document.getElementById('end').value= new Date().toISOString().slice(0, 16);

	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
		// new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..})
		
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	timeZone: 'local',
	      headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth'
	      },
	      /* initialDate: '2022-12-21', // 초기 로딩 날짜=> 지우면 오늘 날짜로 자동 설정 */
	      navLinks: true, // can click day/week names to navigate views
	      selectable: true,
	      selectMirror: true,
	      locale: "ko",
	      // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용!
	      select: function(arg) {
	    	  console.log(arg);
				
	    	  /* var title = $("#diaryUpadte input[name=title]").val();
	    	  var title = $("#diaryUpadte input[name=content]").val();
	    	  var title = $("#diaryUpadte input[name=start]").val();
	    	  var title = $("#diaryUpadte input[name=end]").val(); */
	    	  
	    	 /*  $("#start").value(moment(date).format('YYYY-MM-DD HH:mm:ss'));
	    	  $("#end").value(moment(date).format('YYYY-MM-DD HH:mm:ss')); */
	    	 
	    	  
	    	  $("#diaryAdd").modal("show");
	        /* var title = prompt('입력할 일정:'); */
	    	// title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
	        /* if (title) {
	          calendar.addEvent({
	            title: title,
	            start: arg.start,
	            end: arg.end,
	            backgroundColor:"#007bff",
	            textColor:"white"
	          })
	        } */
	        calendar.unselect()
	      },
	      eventClick: function(arg) {
	    	// 있는 일정 클릭시,
	    	console.log("#등록된 일정 클릭#");
	    	console.log(arg);
	    	console.log(arg.event._def.title);
	    	  /* alert("제목 "+arg.event._def.title); */
	    	 
	    	/* $("#diaryMore .modal-title").html('내 일정'); */
	    	console.log(arg.event._def.extendedProps.diaryId);
	    	//$("#diaryId").html(arg.event._def.extendedProps.diaryId);
	    	var diaryId = arg.event._def.extendedProps.diaryId;
	    	$('input[name=diaryId]').attr('value',diaryId);
		    $("#d_title").html(arg.event._def.title);
		    $("#d_content").html(arg.event.extendedProps.memo);
		    //$("#d_start").html(arg.event._instance.range.start);
		    $("#d_start").html(moment(arg.event._instance.range.start).format('YYYY-MM-DD HH:mm'));
		    $("#d_end").html(moment(arg.event._instance.range.end).format('YYYY-MM-DD HH:mm'));
		    //$("#d_end").html(arg.event._instance.range.end);
		   
		    
		    /* d_start = moment(calEvent.start).format('YYYY-MM-DD hh:mm');
		    d_end = moment(calEvent.end).format('YYYY-MM-DD hh:mm'); */
		    
	    	 $("#diaryMore").modal('show');
	    	  
	        /* if (confirm('Are you sure you want to delete this event?')) {
	          arg.event.remove()
	        } */
	      },
	      eventDrop: function (arg){
	    	  if(confirm("기록을 삭제하시겠습니까?")){
		    	  var diaryId = arg.event._def.extendedProps.diaryId;
		    	  console.log(arg.event._def.extendedProps.diaryId);
		    	  arg.event.remove();
	    	  } else {
	    		  location.reload();
	    	  }
	    	  $(function deleteData(){
	    		  $.ajax({
			    	   url:"<%=request.getContextPath()%>/mypage/deleteDiary.do",
			    	   method:"DELETE",
			    	   dataType:"json",
			    	   data:{"diaryId":JSON.stringify(diaryId)},
			    	   success:function(data){
			    	   console.log(diaryId);
				    	   if(data=='성공') {
				    	    	event.remove();
				    	    } else alert("삭제 실패했습니다 다시 시도하세요 :(");
			    	    }, error:function(e,r,m){
								console.log(e);
								console.log(r);
								console.log(m);
							}
			    	}); 
              })
	      	},
		      editable: true,
		      dayMaxEvents: true, // allow "more" link when too many events
		      events :[
		      ]
		         
			});
		
		  calendar.render();
		  
		   $.ajax({
    		 type:"get",
    		 url:"<%= request.getContextPath() %>/mypage/diarydata.do",
    		 //dataType:"json",
    		 success:data=>{
    			 console.log(data);
    			 data.forEach(v=>{
    				 calendar.addEvent(v);	
    			 });
    		 }
    	  });
    	  
    	  /* 색상 버튼 이벤트 추가 */
    	  var currColor = '#007bff' //디폴트 컬러
    	  
          // Color chooser button
          $('#color-chooser > li > a').click(function (e) {
            e.preventDefault()
            // 저장할 색
            currColor = $(this).css('color');
            // 추가 버튼에 색 변경 이벤트
            $('#addBtn').css({
              'background-color': currColor,
              //'border-color'    : currColor
            })
          });
   
    	  
    	  $(document).on("click", "button[name='addDiary']", function () {
	    		 let d = {
	   	    			"title" : $("#title").val(),
	   	    			"description" : $("#memo").val(),
	   	    			"start" : dateFormat(new Date(moment($("#start").val()).format('YYYY-MM-DD HH:mm'))),
	   	    			"end" : dateFormat(new Date(moment($("#end").val()).format('YYYY-MM-DD HH:mm'))),
	   	    			"backgroundColor" : currColor
	  	    		};
		    		console.log(d);
					
		    	    $.ajax({
		    	    	url:"<%=request.getContextPath()%>/mypage/addDiary.do",
		    	     	type:"post",
		    	     	//dataType:"json",
		    	     	data:{diary:JSON.stringify(d)},
		    	     	success:function(data){
		    	     		if(data=='성공!') {
		    	     			calendar.addEvent(d);
		    	     			//모달 내용 초기화
		    	     			$("#updateDiaryFrm")[0].reset();
		    	     			$("#diaryAdd").modal('hide');
		    	     		}
		    	     		else {
		    	     			alert("기록을 실패했습니다 다시 시도하세요 :(");
		    	     			
		    	     		}
		   	
		    	     	}, error:function(e,r,m){
							console.log(e);
							console.log(r);
							console.log(m);
						}
		    	    });  
		     	 });
		    	    
		    	    
		     	<%-- $(document).on("click", "button[name='deleteDiary']", function () {
		     			
		     		let obj = new Object();
		     			obj.diaryId = Object.extendedProps.diaryId;
		     			
		     			console.log(Object.extendedProps.diaryId);
			    	    $.ajax({
			    	    	url:"<%=request.getContextPath()%>/mypage/deleteDiary.do",
			    	     	type:"post",
			    	     	dataType:"json",
			    	     	data:{"diaryId":diaryId},
			    	     	success:function(data){
			    	     		console.log(diaryId);
			    	     		if(data=='성공') {
			    	     			event.remove();
			    	     			$("#diaryAdd").modal('hide');
			    	     		}
			    	     		else alert("삭제 실패했습니다 다시 시도하세요 :(");
			    	     		
			    	     	}, error:function(e,r,m){
								console.log(e);
								console.log(r);
								console.log(m);
							}
			    	    });  
			     	 }); --%>
		    	    
		     $(document).on("click", "span[name='close1']", function () {
		    	//나가면 모달 폼 초기화
		    	if(confirm("창을 닫으면 내용이 초기화됩니다. 그래도 닫으시겠습니까?")){
					$("#updateDiaryFrm")[0].reset();
					$("#diaryAdd").modal('hide');
			     	
		    	} else {
		    		alert("동작을 취소했습니다.");
		    		$("#diaryAdd").modal('show');
		    	}
			
		     });
		     
		     $(document).on("click", "span[name='close']", function () {
		    	 $("#diary").modal('hide');
			     $("#diaryMore").modal('hide');
		     });
		     
              
	  });
	  
	  function dateFormat(date) {
	        let month = date.getMonth() + 1;
	        let day = date.getDate();
	        let hour = date.getHours();
	        let minute = date.getMinutes();
	        let second = date.getSeconds();

	        month = month >= 10 ? month : '0' + month;
	        day = day >= 10 ? day : '0' + day;
	        hour = hour >= 10 ? hour : '0' + hour;
	        minute = minute >= 10 ? minute : '0' + minute;
	        second = second >= 10 ? second : '0' + second;

	        return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
	};
	  
 </script>
 

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<!-- moment -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<%@ include file="/views/common/footer.jsp" %>

