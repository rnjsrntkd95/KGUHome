<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
.overlay_info {
	border-radius: 6px;
	margin-bottom: 12px;
	float: left;
	position: relative;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	background-color: #fff;
	bottom: 13px;
}

.overlay_info:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.overlay_info a {
	display: block;
	background: #2196f3;
	text-decoration: none;
	color: #fff;
	padding: 12px 30px 12px 14px;
	font-size: 14px;
	border-radius: 6px 6px 0 0
}

.overlay_info .fa-home {
	font-size: 1.2em;
}

.overlay_info .fa-times {
	font-size: 1.3em;
	color: white;
	float: right;
	position: relative;
	bottom: 32px;
	right: 10px;
}

.overlay_info a .title {
	padding-left: 10px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	width: 130px;
	display: inline-block;
	line-height: 14px;
}

.overlay_info .desc {
	padding: 14px;
	padding-bottom: 0px;
	position: relative; 
	top: -18px;
	width: 190px;
	height: 56px;
	display: flex;
	flex-direction: row;
}

.overlay_info img {
	vertical-align: top;
}

.overlay_info .sale-info {
	padding-left: 10px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	width: 100%;
}

.overlay_info .price {
	font-size: 12px;
	color: #333;
/* 	position: absolute;
	left: 80px;
	right: 14px;
	top: 24px; */
	white-space: normal
}

.overlay_info .create_at {
	font-size: 8px;
	display: flex;
	justify-content: flex-end;
	width: 100%;
	color: #2196f3;
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
 			var imageSrc = 'images/finish_marker.png',
 			imageSize = new kakao.maps.Size(25, 25);
 			var finishMarkerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			
			var marker = new kakao.maps.Marker({
				map: map,
				position: position.latlng,
				title: position.title,
				image: finishMarkerImage
			});
		} 
		
		// 등록된 매물들의 마커 표시
		var sales = [
			{	
				latitude: 37.2968324,
				longitude:  127.0311737,
				title: "첫번째 자취방!!!!!!!!!!!!!!!!",
				image: "",
				deposit: 500,
				rent: 30,
				created_at: '2020-06-01'
			},
			{
				latitude: 37.2979503,
				longitude:  127.0288282,
				title: "두번째 자취방!",
				image: "",
				deposit: 300,
				rent: 27,
				created_at: '2020-06-02'
			},
 			{
				latitude: 37.2953918,
				longitude:  127.0267069,
				title: "세번째 자취방!",
				image: "",
				deposit: 500,
				rent: 35,
				created_at: '2020-06-03'
			}, 
		];
		
		function closeSaleInfo(target) {
			openedSaleMarker.setVisible(true);
			openedCustomOverlay.setMap(null);
		}
		
		function makeOverListener(map, sale, saleMarker) {
			return function() {
				if (openedSaleMarker != null) {
					openedSaleMarker.setVisible(true);	
				}
				openedCustomOverlay.setMap(null);
				var content = '<div class="overlay_info">';
				content += '    <a href="" target="_blank"><i class="fas fa-home"></i>'
				content += '		<div class="title">'+sale.title+'</div></a>'
				content += '		<i class="fas fa-times close-btn" onclick="closeSaleInfo(this)"></i>'
				content += '    <div class="desc">';
				content += '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">';
				content += '        <div class="sale-info">';

				content += '        <div class="price deposit">보증금: '+sale.deposit+'</div>';
				content += '        <div class="price rent">월세: '+sale.rent+'</div>';
				content += '        <div class="price create_at">'+sale.created_at+'</div>';

				content += '    </div></div>';
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
 			var imageSrc = 'images/sale_marker.png',
 			imageSize = new kakao.maps.Size(30, 30)
 			var saleMarkerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			// 마커 생성
			const saleMarker = new kakao.maps.Marker({
				map: map,
				position: new kakao.maps.LatLng(sale.latitude, sale.longitude),
				image: saleMarkerImage
			});
			
			// 인포윈도우를  클릭 이벤트 생성
			kakao.maps.event.addListener(saleMarker, "click", makeOverListener(map, sale, saleMarker))
 		}

		
		


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