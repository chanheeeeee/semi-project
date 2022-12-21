<%@page import="com.wdh.mypage.vo.Diary"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%

%>
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
	
	 <!-- Modal -->
		<div class="modal fade" id="diaryMore" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		        <span aria-hidden="true">×</span></button>
		        <h4 class="modal-title" id="myModalLabel">내 운동 상세 기록</h4>
		      </div>
		      <div class="modal-body" id="content">
		       	<h2></h2>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
	<!-- Modal -->


	
<script>
	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
		// new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..})
		
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
	      },
	      initialDate: '2022-12-21', // 초기 로딩 날짜.
	      navLinks: true, // can click day/week names to navigate views
	      selectable: true,
	      selectMirror: true,
	      // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
	      select: function(arg) {
	    	  console.log(arg);
	
	        var title = prompt('입력할 일정:');
	    // title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
	        if (title) {
	          calendar.addEvent({
	            title: title,
	            start: arg.start,
	            end: arg.end,
	            allDay: arg.allDay,
	            backgroundColor:"#007bff",
	            textColor:"white"
	          })
	        }
	        calendar.unselect()
	      },
	      eventClick: function(arg) {
	    	  // 있는 일정 클릭시,
	    	  console.log("#등록된 일정 클릭#");
	    	  console.log(arg);
	    	  console.log(arg.event._def.title);
	    	  /* alert("제목 "+arg.event._def.title); */
	    	  $("#diaryMore").modal('show');
	    	  
	        /* if (confirm('Are you sure you want to delete this event?')) {
	          arg.event.remove()
	        } */
	      },
	      editable: true,
	      dayMaxEvents: true, // allow "more" link when too many events
	      events :[
	    	  title: 
	    	  
	      ]		   
		  });
		
		  calendar.render();
		  
		   $.ajax({
    		 type:"get",
    		 url:"<%= request.getContextPath() %>/mypage/diarydata.do",
    		 dataType:"json",
    		 success:data=>{
    			 console.log(data);
    			 data.forEach(v=>{
    				 calendar.addEvent(v);	
    				 
    				 let d=$("<h2>").text(v);
    				 $("#diaryMore").append(d);
    				 
    			 });
    		 }
    	  }).done(function(resp){
    		  resp=JSON.parse(resp);
    		  
    		  
    	  });
		   
		  
    	 
	  });
	  
	
	done(function(resp){
		resp=JSON.parse(resp);
		var seq=resp.seq;
			var projcet_seq=resp.project_seq;
			var title = resp.title;
			var contents = resp.contents;
			var writer = resp.writer;
			var start_date=resp.start_date;
			var end_date=resp.end_date;
			var color=resp.color;
			
			$('.dialog__content h4').append('<div class='+'dynamic'+'>'+title+'</div>'); 
			$('.dialog__content>div:nth-child(2)').append('<div class="dynamic" style="width:270px;">'+contents+'</div>');
			$('.dialog__content>div:nth-child(4)').append('<div class='+'dynamic'+'>'+start_date+'</div>');
			$('.dialog__content>div:nth-child(4)').after('<div class='+'dynamic'+' style="margin-left:80px">'+end_date+'</div>');
			$('.dialog__content>div:nth-child(6)').append('<div class="dynamic" style="float:left">'+writer+'</div>');
			
			$('#title-color').css('background-color',color);
			
		const modal = document.querySelector('dialog');
    	const btnClose = document.querySelectorAll('.button-close');
    	modal.showModal();
    	btnClose.forEach((elm) => elm.addEventListener('click', () => closeModal()));
    	modal.addEventListener('click', (e) => detectBackdropClick(e));
  
    	closeModal = () => {
    	    modal.classList.add("dialog__animate-out");
    	    modal.addEventListener('animationend', handleClose, false);
    	   
    	}

    	handleClose = () => {
    	    modal.classList.remove("dialog__animate-out");
    	    modal.removeEventListener('animationend', handleClose, false);
    	    modal.close();
    	    $('.dynamic').remove(); 
    	}

    	detectBackdropClick = (event) => {
    	    if(event.target === modal) {
    	        closeModal();
    	    }
    	}
    	
    	 $('#eventEdit').on('click',function(){    		 
    		 closeModal();	
    		 //수정하기 modal에  값 채워넣기 
    		 $('#Editrecipient-name').val(title);
    		 $("#Editmessage-text").val(contents)
    		 $('#Editmodal_date_start').val(start_date);
    		 $('#Editmodal_date_end').val(end_date);
    		 /* $('.Editcustom-radios input[type=radio][name=Editcolor][background-color:'+color+']:checked'); */
    		 //색깔 선택 수정하기 !!!!!!
    		 sessionStorage.setItem("seq",seq);
        	 $("#EditmyModal").modal();
    		 
        }) 
	  
 </script>
<!--  fullcalendar css -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css"> -->

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<%@ include file="/views/common/footer.jsp" %>

