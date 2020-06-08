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

.overlay_info .bookmark_btn {
	color: #2196f3;
	position: relative;
	left: 193px;
	background: none;
	border: 0px;
	outline: 0;
	z-index: 10;
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
	<%
		String data = (String)request.getAttribute("test");
		out.println("�ڷ��(forward)" + data);
	%>
	<div id="map" style="width: 400px; height: 400px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=291ae91548b72e5c96e2ad42f5772f46"></script>
	<script>
		console.log(<%=data%>);
	
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.3004755, 127.034374),
			level : 5
		};

		var map = new kakao.maps.Map(container, options);

		// ��Ʈ�� �ٸ� ���� ���� ǥ���մϴ�.
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TORIGHT);
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		var openedCustomOverlay = new kakao.maps.CustomOverlay();
		var openedSaleMarker = null;
		
		// ���� �Ĺ� ��Ŀ ǥ��
		var positions = [
			{
				title: '����',
				latlng: new kakao.maps.LatLng(37.3016229, 127.0337445)
			},
			{
				title: '���� ���',
				latlng: new kakao.maps.LatLng(37.2973027, 127.0328685)
			},
			{
				title: '�Ĺ�',
				latlng: new kakao.maps.LatLng(37.2975997, 127.0412514)
			},
			{
				title: '�Ĺ� ����',
				latlng: new kakao.maps.LatLng(37.3005728,  127.0420200)
			}
		]
 		for (position of positions) {
 			var imageSrc = 'image/finish_marker.png',
 			imageSize = new kakao.maps.Size(25, 25);
 			var finishMarkerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			
			var marker = new kakao.maps.Marker({
				map: map,
				position: position.latlng,
				title: position.title,
				image: finishMarkerImage
			});
		} 
		
		// ��ϵ� �Ź����� ��Ŀ ǥ��
		var sales = [
			{	
				latitude: 37.2968324,
				longitude:  127.0311737,
				title: "ù��° �����!!!!!!!!!!!!!!!!",
				image: "",
				deposit: 500,
				rent: 30,
				created_at: '2020-06-01'
			},
			{
				latitude: 37.2979503,
				longitude:  127.0288282,
				title: "�ι�° �����!",
				image: "",
				deposit: 300,
				rent: 27,
				created_at: '2020-06-02'
			},
 			{
				latitude: 37.2953918,
				longitude:  127.0267069,
				title: "����° �����!",
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
			 	content += ' 		<button class="bookmark_btn" type="button" onclick="checkingBookmark(this)"><i class="far fa-star"></i></button>'; 

				content += '    <div class="desc">';
				content += '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">';
				content += '        <div class="sale-info">';
				content += '        <div class="price deposit">������: '+sale.deposit+'</div>';
				content += '        <div class="price rent">����: '+sale.rent+'</div>';
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
 			var imageSrc = 'image/sale_marker.png',
 			imageSize = new kakao.maps.Size(30, 30)
 			var saleMarkerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			// ��Ŀ ����
			const saleMarker = new kakao.maps.Marker({
				map: map,
				position: new kakao.maps.LatLng(sale.latitude, sale.longitude),
				image: saleMarkerImage
			});
			
			// ���������츦  Ŭ�� �̺�Ʈ ����
			kakao.maps.event.addListener(saleMarker, "click", makeOverListener(map, sale, saleMarker))
 		}

		
		


	</script>


	<script>
		var registerMarker = new kakao.maps.Marker();
		var myInfoWindow = new kakao.maps.InfoWindow();
		
		// ���ã�� ��ũ
		function checkingBookmark(target) {
			if (target.childNodes[0].getAttribute('data-prefix') == 'far')
				target.childNodes[0].setAttribute('data-prefix', 'fas')
			else
				target.childNodes[0].setAttribute('data-prefix', 'far')
				
			// ���ã�� request �۽�
/*			$.ajax({
                type: "POST",
                url: "",
                data: {},
                dataType: "json",
                async: true,
                success: function (response) {
                    $.each(response, function (key, value) {
        
                    )
                }
            })
*/
		}

		// Ŭ���� ���� ��Ŀ ǥ�� ���� �浵 ǥ��
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    // Ŭ���� ����, �浵 ������ �����ɴϴ� 
		    var latlng = mouseEvent.latLng;
			registerMarker.setMap(null);
			myInfoWindow.close();
			
			// ��Ŀ ����
			registerMarker = new kakao.maps.Marker({
				position: latlng,
			});
			registerMarker.setMap(map);
			
			// ���������츦 �����մϴ�
			var iwContent = '<div style="padding:5px;">My Home!!</div>', 
		    iwPosition = new kakao.maps.LatLng(latlng); 
			myInfoWindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent,
				removable: true
			});
			myInfoWindow.open(map, registerMarker); 
				    
			
			////
		    var message = 'Ŭ���� ��ġ�� ������ ' + latlng.getLat() + ' �̰�, ';
		    message += '�浵�� ' + latlng.getLng() + ' �Դϴ�';
		    
		    var resultDiv = document.getElementById('result'); 
		    resultDiv.innerHTML = message;
		});
		
		// ��ǥ Ŭ�� �� ��ǥ�� ǥ�� �̺�Ʈ
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    // Ŭ���� ����, �浵 ������ �����ɴϴ� 
		    var latlng = mouseEvent.latLng;
		    
		    var message = 'Ŭ���� ��ġ�� ������ ' + latlng.getLat() + ' �̰�, ';
		    message += '�浵�� ' + latlng.getLng() + ' �Դϴ�';
		    
		    var resultDiv = document.getElementById('result'); 
		    resultDiv.innerHTML = message;
		});
		
		</script>
</body>
</html>