<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.wdh.board.vo.*,com.wdh.member.vo.*" %>
<%
	List<Board> boards = (List<Board>)request.getAttribute("locList");
%>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js"></script>


<div id="map" style="width:100%;height:350px;"></div>

<div>


		<%if(boards.isEmpty()) {%>
		
		
		<%}else{%>
			
			<%for(Board b : boards){%>
				<h2><%=b.getWdLocation() %></h2>
				
			<%}
			
		}%>
		


				
				

</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7c123be4a65e88c927263be5cea14c0&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다






//kakao.maps.services.Geocoder() : 주소-좌표간 변환 서비스 객체를 생성한다.
//addressSearch(addr, callback, options) : 주소 정보에 해당하는 좌표값을 요청한다.
var geocoder = new kakao.maps.services.Geocoder();

var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        console.log(result);
        console.log(result[0].x); //-->해남군 송지면의 x좌표
        console.log(result[0].x); //-->해남군 송지면의 y좌표
    }
};

geocoder.addressSearch('금천구', callback); //가져온list넣기



 
 
 
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '카카오', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    },
    {
        title: '생태연못', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    },
    {
        title: '텃밭', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    },
    {
        title: '근린공원',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];


for(let i=0;i<boards.)



// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
</script>
</body>
</html>