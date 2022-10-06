<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<br/><br/><br/>
	<div align="center">
		<h4>ColkageMap</h4>
		<div id="map" style="width:1000px;height:600px; border:1px solid black;"></div>
	</div>
		
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=df9e60b431f3252a1346451beb0f0b5e&libraries=services"></script>	
	<c:forEach var="restaurantVO" items="${restaurantList}" varStatus="status">
		
		<script>
						
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 1 // 지도의 확대 레벨
		    };
			var map = new kakao.maps.Map(mapContainer, mapOption);
			var geocoder = new kakao.maps.services.Geocoder();
			geocoder.addressSearch('${restaurantVO.res_address}', function(result, status) {
		
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
		
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var iwContent = '<div style="width:200px;text-align:left;padding:6px 0;"><a href="/content/restaurantView?res_no=${restaurantVO.res_no}">식당이름 : ${restaurantVO.res_name}<br/>전화번호 : ${restaurantVO.res_call}<br/>식당 주소 : ${restaurantVO.res_address}</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    				iwRemoveable = true;
			        
			        var marker = new kakao.maps.Marker({
			            position: coords,
			            clickable: true
			        });
			       	
			        marker.setMap(map);
			        var infowindow = new kakao.maps.InfoWindow({
			        	content : iwContent,
			            removable : iwRemoveable
			            
			        });
			        kakao.maps.event.addListener(marker, 'click', function() {
			            // 마커 위에 인포윈도우를 표시합니다
			            infowindow.open(map, marker);  
			     	});
			        
			        var iwContent2 = '<div style="padding:5px;">식당이름 : ${restaurantVO.res_name}</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

				     // 인포윈도우를 생성합니다
				     var infowindow2 = new kakao.maps.InfoWindow({
				         content : iwContent2
				     });
	
				     // 마커에 마우스오버 이벤트를 등록합니다
				     kakao.maps.event.addListener(marker, 'mouseover', function() {
				       // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
				         infowindow2.open(map, marker);
				     });
	
				     // 마커에 마우스아웃 이벤트를 등록합니다
				     kakao.maps.event.addListener(marker, 'mouseout', function() {
				         // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
				         infowindow2.close();
				     });
			        map.setCenter(coords);
			        
			        
			     }
			     
			});
				
		</script>
	</c:forEach>
	
	
