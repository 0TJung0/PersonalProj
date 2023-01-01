 var map;//지도객체 담을것
   var markers= [];
   var range=document.querySelector('#range');
   var address=document.querySelector('#address');
   if(navigator.geolocation){
        //PositionOptins객체 설정용
        var options ={'timeout':3000,'maximumAge':5000};
        navigator.geolocation.getCurrentPosition(function(position){
            var lat = position.coords.latitude;
            var lng = position.coords.longitude;
            
            
        });
    }
 // 지도를 표시할 div 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(
        navigator.geolocation.getCurrentPosition(function(position){
          	return lat = position.coords.latitude;
	    }),
	    navigator.geolocation.getCurrentPosition(function(position){
          	return lat = position.coords.longitude;
	    })
		), // 지도의 중심좌표
	    level: 1 // 지도의 확대 레벨
}; 		
 

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
            
            var content = '<div class="bAddr">' +
                            '<span class="title">법정동 주소정보</span>' + 
                            detailAddr + 
                        '</div>';

            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
        }   
    });
});

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}

/*
 function showKakaoMap(lat,lng){
        var container = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(lat,lng),
            level:3
        };
        map = new kakao.maps.Map(container, options);
        //sample -'오버레이'의 마커 생성하기
        setMaker(lat,lng,'<div style="padding:5px;font-size:.7em;">현재 나의 위치!</div>');
        };///////////////showKakaoMap(lat,lng);
    function setMaker(lat,lng){
        // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(lat,lng),
        draggable:false,
        clickable:true
    });
     //생성한 마커를 배열에 저장
     var key=['marker'+markers.length];
     var markObj={};
     //markObj=['marker'+markers.length];
     markers.push({key:marker});
    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    // 마커가 드래그 가능하도록 설정합니다
    //marker.setDraggable(true);
        
    };////////// setMaker(lat,lng);
    */
    function setMakerClick(content){
            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                content : content,
                removable : true
            });
            // 마커에 클릭이벤트를 등록합니다
            kakao.maps.event.addListener(markers[0][key], 'click', function() {
                // 마커 위에 인포윈도우를 표시합니다
                infowindow.open(map, markers[0][key]);
            });
        };
    function searchByAddress(){
    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(address.value, function(result, status) {
            console.log(kakao.maps.services.Status);
            //console.log("markers[0].getPosition()",markers[0].getPosition());
            //console.log("markers[0].getContent()",markers[0].getContent());
            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {

                var content='<div style="padding:5px">'+address.value+'</div>';
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                //마커 위치 이동
                var key="marker"+(markers.length-1);
                markers[0]["marker"+markers.length-1].setPosition(coords);
                markers[0]['info'].setContent(content);
                setMakerClick(content);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            }else{
                alert(address.value+'와 일치하는 주소가 없어요');
                address.value="";
                address.focus();
            }
        });    
    }
