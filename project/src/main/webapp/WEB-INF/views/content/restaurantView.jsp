<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<br/><br/><br/>
	<DIV align="center">
		<table border="1">
			<tr>
				<td align="laft">&nbsp;&nbsp;<a href="#" onclick="history.go(-1)">뒤</a></td>
			</tr>
			<tr>
				<td>
					<div id="slideShow" align="center">
						<img src="/resources/save/${restaurantVO.res_img1}" id="mainImage" alt="slide"
							width="500px" height="300px"/><br/>
					</div>
					<div>
						식당 이름 : <input type="text" value="${restaurantVO.res_name}" readonly="readonly" style="border:none"/>
						별점 : <input type="number" value="0.0" id="rest_stars" readonly="readonly" style="border:none"/><br/>
						식당 주소 : <input type="text" value="${restaurantVO.res_address}" readonly="readonly" style="border:none"/>
						<button onclick="window.location='/review/reviewView?res_no=${restaurantVO.res_no}'">리뷰 보러 가기</button>
						<sec:authorize access="isAnonymous()">
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<c:if test="${getWishRest == null}">
								<button id="wishRestAddBtn" >가고싶은식당</button>
							</c:if>
							<c:if test="${getWishRest != null}">
								<button id="wishRestDelBtn" >가기싫어졌어요</button>
							</c:if>
						</sec:authorize>
						<br/>
						식당 기본 정보<br/>
						<input type="text" value="${restaurantVO.res_content}" readonly="readonly" width="10" />
					</div>
					<div style="border:1px solid black;">
						<h6 align="center">콜키지 정보</h6>
						<input type="text" value="${restaurantVO.res_colCon}" readonly="readonly" /><br/>
						<table>
							<tr><td>
									<c:if test="${restaurantVO.res_colGlass == 1}">
										전용잔 제공
									</c:if>
								</td>
								<td>
									<c:if test="${restaurantVO.res_colSer == 1}">
										서버 있음
									</c:if>
								</td>
								<td>
									<c:if test="${restaurantVO.res_colOpen == 1}">
										오프너 제공
									</c:if>
								</td>
							</tr>
						</table>
					</div>	
					<div style="border:1px solid black;">
						<h6 align="center">편의 시설</h6>
						<div align="center">
							<table>
								<tr>
									<td>
										<c:if test="${restaurantVO.res_amenPrivate == 1}">
											개인 룸
										</c:if>
									</td>
									<td>
										<c:if test="${restaurantVO.res_amenPaking == 1}">
											주차장
										</c:if>
									</td>
									<td>
										<c:if test="${restaurantVO.res_amenParty == 1}">
											단체석
										</c:if>
									</td>
								</tr>
								<tr>
									<td>
										<c:if test="${restaurantVO.res_amenValet == 1}">
											발렛파킹
										</c:if>
									</td>
									<td>
										<c:if test="${restaurantVO.res_amenRental == 1}">
											대관
										</c:if>
									</td>
									<td>
										<c:if test="${restaurantVO.res_amenSoml == 1}">
											전문 소믈리에
										</c:if>
									</td>
								</tr>
							</table>
						</div>
						<div style="border:1px solid black;">
							<h6 align="center">메뉴판 및 가격정보</h6>
							<div align="center">
								<img src="/resources/save/${restaurantVO.res_menu}" width="400px" height="200px"/>
							</div>
							<br/>
						</div>
						<br/>
						<h6 align="center">주소및 지도 정보</h6>
						<div id="map" style="width:500px;height:300px; border:1px solid black;"></div>
					</div>	
					
				</td>
			</tr>
			
		</table>
	</DIV>
	
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
	
	<script>
		$(document).ready(function(){
			//var result = '<c:out value="${result}"/>';
	        //if((result=='')){
	        //  alert("잘못된 접근입니다");
			//	window.location="/content/main";
	        //}
	        var myImage = document.getElementById("mainImage");
	    	var imageArray = [ "/resources/save/${restaurantVO.res_img1}",
	    		"/resources/save/${restaurantVO.res_img2}", "/resources/save/${restaurantVO.res_img3}" ];
	    	var imageIndex = 0;
			var img2 = "${restaurantVO.res_img2}";
	    	function changeImage() {
	    		myImage.setAttribute("src", imageArray[imageIndex]);
	    		if(!(img2 == "default")){
		    		imageIndex++;
		    		if (imageIndex >= imageArray.length) {
		    			imageIndex = 0;
		    		}
	    		}
	    	}
    		setInterval(changeImage, 3000);
    		
    		if(${stars} != ""){
    			let stars = ${stars.re_stars};
    			let star = 0;
    			let num = 0;
    			stars.forEach(function(number, index) {
    			   star += number;
    			   num = index;
    			});
    			let res = star / num;
    			document.setElementbyId("rest_stars").value=res;
    		}
    		
    		
		});
	</script>
	<script>
		$(document).ready(function(){
			
			
			$(document).on('click','#wishRestAddBtn', function(){
				console.log("ajax!!!!!!!");
				$.ajax({
					url: "/content/wishRestAdd",
					type: "POST",
					data: {
						user_id: '${user}',
						res_no: ${restaurantVO.res_no}
					},
					success: function(data){
						if(data != 1){
							$('#wishRestAddBtn').html('가기싫어졌어요');
							$('#wishRestAddBtn').attr('id', 'wishRestDelBtn');
						}else{
							alert("에러 발생");
						}
					},error: function(e){ 
						console.log(e); 
					}
				});
			});
			$(document).on('click','#wishRestDelBtn', function(){
				console.log("ajax2!!!!!!!");
				$.ajax({
					url: "/content/wishRestDel",
					type: "POST",
					data: {
						user_id: '${user}',
						res_no: ${restaurantVO.res_no}
					},
					success: function(data){
						if(data != 1){
							$('#wishRestDelBtn').html('가고싶은식당');
							$('#wishRestDelBtn').attr('id', 'wishRestAddBtn');
						}else{
							alert("에러 발생");
						}
					},error: function(e){ 
						console.log(e); 
					}
				});
			});
		});
	</script>
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
