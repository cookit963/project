<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<br/><br/><br/>
	<div align="center">
		<div id="map" style="width:1000px;height:600px; border:1px solid black;"></div>
	</div>
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=df9e60b431f3252a1346451beb0f0b5e&libraries=services"></script>
	<script>    
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
		var map = new kakao.maps.Map(mapContainer, mapOption);
		var geocoder = new kakao.maps.services.Geocoder();
		geocoder.addressSearch('${restaurantVO.res_address}', function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:200px;text-align:center;padding:6px 0;">식당이름 : ${restaurantVO.res_name}<br/>전화번호 : ${restaurantVO.res_call}<br/>식당 주소 : ${restaurantVO.res_address}</div>'
		        });
		        infowindow.open(map, marker);
		        map.setCenter(coords);
		     }
		});
	</script>