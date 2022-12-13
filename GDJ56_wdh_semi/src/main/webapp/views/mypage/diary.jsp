<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">
                <span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="<%=request.getContextPath() %>/assets/img/pocha.jpg" alt="..." /></span>
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
            <!-- Content Wrapper. Contains page content -->
            <!-- Content Header (Page header) -->                   
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
            
                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-3">
                        <div class="sticky-top mb-3">
                            <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">내 운동 목록</h4>
                            </div>
                            <div class="card-body">
                                <!-- the events -->
                                <div id="external-events">
                                <div class="external-event bg-success">스쿼트</div>
                                <div class="external-event bg-warning">바이크</div>
                                <div class="external-event bg-info">런닝</div>
                                <div class="external-event bg-primary">축구</div>
                                <div class="external-event bg-danger">필라테스</div>
                                <div class="checkbox">
                                    <label for="drop-remove">
                                    <input type="checkbox" id="drop-remove">
                                    저장하지 않기
                                    </label>
                                </div>
                                </div>
                            </div>
                            <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                            <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">운동 추가</h3>
                            </div>
                            <div class="card-body">
                                <div class="btn-group" style="width: 100%; margin-bottom: 10px;">
                                <ul class="fc-color-picker" id="color-chooser">
                                    <li><a class="text-primary" href="#"><i class="fas fa-square"></i></a></li>
                                    <li><a class="text-warning" href="#"><i class="fas fa-square"></i></a></li>
                                    <li><a class="text-success" href="#"><i class="fas fa-square"></i></a></li>
                                    <li><a class="text-danger" href="#"><i class="fas fa-square"></i></a></li>
                                    <li><a class="text-muted" href="#"><i class="fas fa-square"></i></a></li>
                                </ul>
                                </div>
                                <!-- /btn-group -->
                                <div class="input-group">
                                <input id="new-event" type="text" class="form-control" placeholder="운동">
            
                                <div class="input-group-append">
                                    <button id="add-new-event" type="button" class="btn btn-primary">추가</button>
                                </div>
                                <!-- /btn-group -->
                                </div>
                                <!-- /input-group -->
                            </div>
                            </div>
                        </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-md-9">
                        <div class="card card-primary">
                            <div class="card-body p-0">
                            <!-- THE CALENDAR -->
                            <div id="calendar"></div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                    </div><!-- /.container-fluid -->
                </section>
                <!-- /.content -->
                <!-- /.content-wrapper -->
            
                <!-- Control Sidebar -->
                <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
                </aside>
                <!-- /.control-sidebar -->
          
            <!-- ./wrapper -->
            <!-- diary -->

        <!-- jQuery -->
        <script src="<%=request.getContextPath() %>/assets/js/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="<%=request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>
        <!-- jQuery UI -->
        <script src="<%=request.getContextPath() %>/assets/js/jquery-ui.min.js"></script>
        <!-- AdminLTE App -->
        <script src="<%=request.getContextPath() %>/assets/js/adminlte.min.js"></script>
        <!-- fullCalendar 2.2.5 -->
        <script src="<%=request.getContextPath() %>/assets/js/moment.min.js"></script>
        <script src="<%=request.getContextPath() %>/assets/fullcalendar/main.js"></script>
        
        

        <!-- Page specific script -->
        <script>
            $(function () {
          
              /* initialize the external events
               -----------------------------------------------------------------*/
              function ini_events(ele) {
                ele.each(function () {
          
                  // create an Event Object (https://fullcalendar.io/docs/event-object)
                  // it doesn't need to have a start or end
                  var eventObject = {
                    title: $.trim($(this).text()) // use the element's text as the event title
                  }
          
                  // store the Event Object in the DOM element so we can get to it later
                  $(this).data('eventObject', eventObject)
          
                  // make the event draggable using jQuery UI
                  $(this).draggable({
                    zIndex        : 1070,
                    revert        : true, // will cause the event to go back to its
                    revertDuration: 0  //  original position after the drag
                  })
          
                })
              }
          
              ini_events($('#external-events div.external-event'))
          
              /* initialize the calendar
               -----------------------------------------------------------------*/
              //Date for the calendar events (dummy data)
              var date = new Date()
              var d    = date.getDate(),
                  m    = date.getMonth(),
                  y    = date.getFullYear()
          
              var Calendar = FullCalendar.Calendar;
              var Draggable = FullCalendar.Draggable;
          
              var containerEl = document.getElementById('external-events');
              var checkbox = document.getElementById('drop-remove');
              var calendarEl = document.getElementById('calendar');
          
              // initialize the external events
              // -----------------------------------------------------------------
          
              new Draggable(containerEl, {
                itemSelector: '.external-event',
                eventData: function(eventEl) {
                  return {
                    title: eventEl.innerText,
                    backgroundColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
                    borderColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
                    textColor: window.getComputedStyle( eventEl ,null).getPropertyValue('color'),
                  };
                }
              });
          
              var calendar = new Calendar(calendarEl, {
                headerToolbar: {
                  left  : 'prev,next today',
                  center: 'title',
                  right : 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                themeSystem: 'bootstrap',
                //Random default events
                events: [
                  {
                    title          : 'All Day Event',
                    start          : new Date(y, m, 1),
                    backgroundColor: '#f56954', //red
                    borderColor    : '#f56954', //red
                    allDay         : true
                  },
                  {
                    title          : 'Long Event',
                    start          : new Date(y, m, d - 5),
                    end            : new Date(y, m, d - 2),
                    backgroundColor: '#f39c12', //yellow
                    borderColor    : '#f39c12' //yellow
                  },
                  {
                    title          : 'Meeting',
                    start          : new Date(y, m, d, 10, 30),
                    allDay         : false,
                    backgroundColor: '#0073b7', //Blue
                    borderColor    : '#0073b7' //Blue
                  },
                  {
                    title          : 'Lunch',
                    start          : new Date(y, m, d, 12, 0),
                    end            : new Date(y, m, d, 14, 0),
                    allDay         : false,
                    backgroundColor: '#00c0ef', //Info (aqua)
                    borderColor    : '#00c0ef' //Info (aqua)
                  },
                  {
                    title          : 'Birthday Party',
                    start          : new Date(y, m, d + 1, 19, 0),
                    end            : new Date(y, m, d + 1, 22, 30),
                    allDay         : false,
                    backgroundColor: '#00a65a', //Success (green)
                    borderColor    : '#00a65a' //Success (green)
                  },
                  {
                    title          : 'Click for Google',
                    start          : new Date(y, m, 28),
                    end            : new Date(y, m, 29),
                    url            : 'https://www.google.com/',
                    backgroundColor: '#3c8dbc', //Primary (light-blue)
                    borderColor    : '#3c8dbc' //Primary (light-blue)
                  }
                ],
                editable  : true,
                droppable : true, // this allows things to be dropped onto the calendar !!!
                drop      : function(info) {
                  // is the "remove after drop" checkbox checked?
                  if (checkbox.checked) {
                    // if so, remove the element from the "Draggable Events" list
                    info.draggedEl.parentNode.removeChild(info.draggedEl);
                  }
                }
              });
          
              calendar.render();
              // $('#calendar').fullCalendar()
          
              /* ADDING EVENTS */
              var currColor = '#3c8dbc' //Red by default
              // Color chooser button
              $('#color-chooser > li > a').click(function (e) {
                e.preventDefault()
                // Save color
                currColor = $(this).css('color')
                // Add color effect to button
                $('#add-new-event').css({
                  'background-color': currColor,
                  'border-color'    : currColor
                })
              })
              $('#add-new-event').click(function (e) {
                e.preventDefault()
                // Get value and make sure it is not null
                var val = $('#new-event').val()
                if (val.length == 0) {
                  return
                }
          
                // Create events
                var event = $('<div />')
                event.css({
                  'background-color': currColor,
                  'border-color'    : currColor,
                  'color'           : '#fff'
                }).addClass('external-event')
                event.text(val)
                $('#external-events').prepend(event)
          
                // Add draggable funtionality
                ini_events(event)
          
                // Remove event from text input
                $('#new-event').val('')
              })
            })
          </script>

<%@ include file="/views/common/footer.jsp" %>