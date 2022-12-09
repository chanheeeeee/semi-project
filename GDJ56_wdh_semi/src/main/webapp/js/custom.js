$(document).ready(function() {
   
    //스크롤시 header.fixedhead 태그에 fixed-top 클래스를 넣고 빼는 이벤트
    let headerOffset = $('header.fixedhead').offset();
    $(window).scroll( function() {
        if($(document).scrollTop() > headerOffset.top) {
            $('header.fixedhead').addClass('fixed-top');
        } else {
            $('header.fixedhead').removeClass('fixed-top');
        }
    });
});