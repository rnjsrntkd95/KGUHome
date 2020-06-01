<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#price {
	background-color: #1D6A96;
	padding: 2px 4px;
	border-radius: 7px;
	font-size: 0.7em;
	color: white;
}

#price:hover {
	background-color: #85B8CB;
}

.overlay_info {
	border-radius: 6px;
	margin-bottom: 12px;
	float: left;
	position: relative;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	background-color: #fff;
}

.overlay_info:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.overlay_info a {
	display: block;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
	text-decoration: none;
	color: #fff;
	padding: 12px 36px 12px 14px;
	font-size: 14px;
	border-radius: 6px 6px 0 0
}

.overlay_info a strong {
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_icon.png)
		no-repeat;
	padding-left: 27px;
}

.overlay_info .desc {
	padding: 14px;
	position: relative;
	min-width: 190px;
	height: 56px
}

.overlay_info img {
	vertical-align: top;
}

.overlay_info .address {
	font-size: 12px;
	color: #333;
	position: absolute;
	left: 80px;
	right: 14px;
	top: 24px;
	white-space: normal
}

.overlay_info:after {
	content: '';
	position: absolute;
	margin-left: -11px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png)
		no-repeat 0 bottom;
}
</style>

</head>
<body>
	<p id="result"></p>
	<div id="map" style="width: 800px; height: 700px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=291ae91548b72e5c96e2ad42f5772f46"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.3004755, 127.034374),
			level : 5
		};

		var map = new kakao.maps.Map(container, options);

		// 컨트롤 바를 지도 위에 표시합니다.
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TORIGHT);
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		var openedCustomOverlay = new kakao.maps.CustomOverlay();
		var openedSaleMarker = null;
		
		// 정문 후문 마커 표시
		var positions = [
			{
				title: '정문',
				latlng: new kakao.maps.LatLng(37.3016229, 127.0337445)
			},
			{
				title: '정문 산길',
				latlng: new kakao.maps.LatLng(37.2973027, 127.0328685)
			},
			{
				title: '후문',
				latlng: new kakao.maps.LatLng(37.2975997, 127.0412514)
			},
			{
				title: '후문 샛길',
				latlng: new kakao.maps.LatLng(37.3005728,  127.0420200)
			}
		]
 		for (position of positions) {
			var marker = new kakao.maps.Marker({
				map: map,
				position: position.latlng,
				title: position.title
			});
		} 
		
		// 등록된 매물들의 마커 표시
		var sales = [
			{
				latitude: 37.2968324,
				longitude:  127.0311737,
				image: "",
				deposit: 500,
				rent: 30,
			},
			{
				latitude: 37.2979503,
				longitude:  127.0288282,
				image: "",
				deposit: 300,
				rent: 27,
			},
/* 			{
				latitude: 37.2953918,
				longitude:  127.0267069,
				image: "",
				deposit: 500,
				rent: 35,
			}, */
		]
		function makeOverListener(map, saleMarker) {
			return function() {
				if (openedSaleMarker != null) {
					openedSaleMarker.setVisible(true);	
				}
				openedCustomOverlay.setMap(null);
				var content = '<div class="overlay_info">';
				content += '    <a href="https://place.map.kakao.com/17600274" target="_blank"><strong>월정리 해수욕장</strong></a>';
				content += '    <div class="desc">';
				content += '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">';
				content += '        <span class="address">제주특별자치도 제주시 구좌읍 월정리 33-3</span>';
				content += '    </div>';
				content += '</div>';
	  			var customOverlay = new kakao.maps.CustomOverlay({
					clickable: true,
					content: content,
				    position : saleMarker.getPosition(),
				    yAnchor: 1,
				});
				customOverlay.setMap(map);   
				saleMarker.setVisible(false);
				openedCustomOverlay = customOverlay;
				openedSaleMarker = saleMarker;
			}
		}
		
 		for (sale of sales){
 			
			// 마커 생성
			const saleMarker = new kakao.maps.Marker({
				map: map,
				position: new kakao.maps.LatLng(sale.latitude, sale.longitude),
				title: "구상"
			});
			
			// 인포윈도우를 생성합니다

			kakao.maps.event.addListener(saleMarker, "click", makeOverListener(map, saleMarker))

 			 
 			
 			
 			
/*  			
			var marker = new kakao.maps.Marker({
				map: map,
				position: position.latlng,
				title: position.title
			});
  			var content = '<div id="price-wrapper"><div id="price"><span class="deposit">'+sale.deposit+'</span>'+'/'+'<span class="rent">'+sale.rent+'</span></span></div></div>';
  			var customOverlay = new kakao.maps.CustomOverlay({
				clickable: true,
				content: content,
				position: new kakao.maps.LatLng(sale.latitude, sale.longitude),
			});
			customOverlay.setMap(map);   */
			

			
/* 			kakao.maps.event.addListener(customOverlay, "click", function(overlay) {
				console.log("click");
				var content = '<div class="overlay_info">';
				content += '    <a href="https://place.map.kakao.com/17600274" target="_blank"><strong>월정리 해수욕장</strong></a>';
				content += '    <div class="desc">';
				content += '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">';
				content += '        <span class="address">제주특별자치도 제주시 구좌읍 월정리 33-3</span>';
				content += '    </div>';
				content += '</div>';
				
				overlay.setContent(content);
			}); */
		}
		var select = document.querySelectorAll("#price-wrapper");
		select.forEach((element) => {
			element.addEventListener("click", function(e) {
				target = e.target
				while(target.getAttribute('id') != "price-wrapper") {
					target = target.parentNode;
				}
				var deposit = target.querySelector('.deposit').innerText
				var rent = target.querySelector('.rent').innerText
				var content = '<div class="overlay_info">';
				content += '    <a href="https://place.map.kakao.com/17600274" target="_blank"><strong>월정리 해수욕장</strong></a>';
				content += '    <div class="desc">';
				content += '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">';
				content += '        <span class="deposit">보증금: '+deposit+'</span>';
				content += '        <span class="rent">월세: '+rent+'</span>';
				content += '    </div>';
				content += '</div>';
				target.innerHTML = content;
			})
		})

		
		


	</script>


	<script>
		var registerMarker = new kakao.maps.Marker();
		var myInfoWindow = new kakao.maps.InfoWindow();

		// 클릭한 지점 마커 표시 위도 경도 표시
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng;
			registerMarker.setMap(null);
			myInfoWindow.close();
			
			// 마커 생성
			registerMarker = new kakao.maps.Marker({
				position: latlng,
			});
			registerMarker.setMap(map);
			
			// 인포윈도우를 생성합니다
			var iwContent = '<div style="padding:5px;">My Home!!</div>', 
		    iwPosition = new kakao.maps.LatLng(latlng); 
			myInfoWindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent,
				removable: true
			});
			myInfoWindow.open(map, registerMarker); 
				    
			
			////
		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다';
		    
		    var resultDiv = document.getElementById('result'); 
		    resultDiv.innerHTML = message;
		});
		
		// 좌표 클릭 시 좌표값 표시 이벤트
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng;
		    
		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다';
		    
		    var resultDiv = document.getElementById('result'); 
		    resultDiv.innerHTML = message;
		});
		

		</script>
</body>
</html>