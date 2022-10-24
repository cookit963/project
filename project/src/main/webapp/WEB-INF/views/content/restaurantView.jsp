<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<br/><br/><br/>
	<DIV align="center">
		<table border="1" style="width: 500px; white-space: nowrap;  background-color: white;" class="borderColor">
			<tr>
				<td align="laft">&nbsp;&nbsp;<a href="#" onclick="history.go(-1)">뒤로가기</a></td>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<td align="right" style="border: none;">
					<a href="/content/restaurantDel?res_no=${restaurantVO.res_no}">삭제</a>&nbsp;&nbsp;
				</td>
				</sec:authorize>
			</tr>
			<tr>
				<td colspan="2">		
					<div class="slideshow-container">
	
						<div class="mySlides fade2" align="center">
						  <img src="/resources/save/${restaurantVO.res_img1}" style="height:300px;">
						</div>
						<c:if test="${restaurantVO.res_img2 != 'default'}">
							<div class="mySlides fade2" align="center">
							  <img src="/resources/save/${restaurantVO.res_img2}" style="height:300px;">
							</div>
						
							<c:if test="${restaurantVO.res_img3 != 'default'}">
								<div class="mySlides fade2" align="center">
								  <img src="/resources/save/${restaurantVO.res_img3}" style="height:300px;">
								</div>
							</c:if>
						<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
						<a class="next" onclick="plusSlides(1)">&#10095;</a>
							
						</c:if>
					</div>
						<br/>
						
					<div style="text-align:center">
					
					  <span class="dot" onclick="currentSlide(1)"></span> 
					  <c:if test="${restaurantVO.res_img2 != 'default'}">
					  <span class="dot" onclick="currentSlide(2)"></span>
					  <c:if test="${restaurantVO.res_img3 != 'default'}"> 
					  <span class="dot" onclick="currentSlide(3)"></span>
					  </c:if>
					  </c:if> 
					</div>
					
					
						&nbsp;&nbsp;식당 이름 : <input type="text" value="${restaurantVO.res_name}" readonly="readonly" style="border:none"/>
						<c:if test="${starsCount != null}">
							별점 : <input type="text" value="${starsCount} 점" id="rest_stars" readonly="readonly" style="border:none"/><br/>
						</c:if>
						<c:if test="${starsCount == null}">
							별점 : <input type="text" value="아직 별점이 없습니다!" id="rest_stars" readonly="readonly" style="border:none"/><br/>
						</c:if>
						&nbsp;&nbsp;식당 주소 : <input type="text" value="${restaurantVO.res_address}" readonly="readonly" style="border:none"/>
						<button onclick="window.location='/review/reviewList?res_no=${restaurantVO.res_no}'">리뷰 보러 가기</button>
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
						&nbsp;&nbsp;<input type="text" value="식당 기본 정보" readonly="readonly" style="border:none"/>
						<sec:authorize access="isAuthenticated()">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button onclick="window.location='/review/reviewAdd?res_no=${restaurantVO.res_no}'">리뷰 쓰러 가기!</button>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button onclick="window.location='/user/login'">리뷰 쓰러 가기!</button>
						</sec:authorize>
						<br/>
						&nbsp;&nbsp;<textarea rows="5" cols="50" readonly="readonly" class="borderColor">${restaurantVO.res_content}</textarea><br/>
					
					<div>
						<br/>
						<h6 align="center">콜키지 정보</h6>
						&nbsp;&nbsp;<textarea rows="3" cols="50" readonly="readonly" class="borderColor">${restaurantVO.res_colCon}</textarea><br/>
					</div>
					<div align="center">
						<table>
							<tr>
								<td align="center" width="100px">
									<c:if test="${restaurantVO.res_colGlass == 1}">
										<img src="/resources/bueno-master/img/bg-img/c1.png" style="height: 50px"/><br/>
										전용잔 제공
									</c:if>
								</td>
								<td align="center" width="100px">
									<c:if test="${restaurantVO.res_colSer == 1}">
										<img src="/resources/bueno-master/img/bg-img/c2.jpg" style="height: 50px"/><br/>
										서버 있음
									</c:if>
								</td>
								<td align="center" width="100px">
									<c:if test="${restaurantVO.res_colOpen == 1}">
										<img src="/resources/bueno-master/img/bg-img/c3.jpg" style="height: 50px"/><br/>
										오프너 제공
									</c:if>
								</td>
							</tr>
						</table>
						<br/>
					</div>	
					<div>
						<h6 align="center">편의 시설</h6>
						<div align="center">
							<table>
								<tr>
									<td align="center" width="100px">
										<c:if test="${restaurantVO.res_amenPrivate == 1}">
											<img src="/resources/bueno-master/img/bg-img/a1.png" style="height: 50px"/><br/>
											개인 룸
										</c:if>
									</td>
									<td align="center" width="100px">
										<c:if test="${restaurantVO.res_amenPaking == 1}">
											<img src="/resources/bueno-master/img/bg-img/a2.png" style="height: 50px"/><br/>
											주차장
										</c:if>
									</td>
									<td align="center" width="100px">
										<c:if test="${restaurantVO.res_amenParty == 1}">
											<img src="/resources/bueno-master/img/bg-img/a3.png" style="height: 50px"/><br/>
											단체석
										</c:if>
									</td>
								</tr>
								<tr>
									<td align="center" width="100px">
										<c:if test="${restaurantVO.res_amenValet == 1}">
											<img src="/resources/bueno-master/img/bg-img/a4.png" style="height: 50px"/><br/>
											발렛파킹
										</c:if>
									</td>
									<td align="center" width="100px">
										<c:if test="${restaurantVO.res_amenRental == 1}">
											<img src="/resources/bueno-master/img/bg-img/a5.png" style="height: 50px"/><br/>
											대관
										</c:if>
									</td>
									<td align="center">
										<c:if test="${restaurantVO.res_amenSoml == 1}">
											<img src="/resources/bueno-master/img/bg-img/a6.png" style="height: 50px"/><br/>
											전문 소믈리에
										</c:if>
									</td>
								</tr>
							</table>
							<br/>
						</div>
						<div>
							<h6 align="center">메뉴판 및 가격정보</h6>
							<div align="center">
								<img src="/resources/save/${restaurantVO.res_menu}" width="400px" height="200px" class="borderColor"/>
							</div>
							<br/>
						</div>
						<br/>
						<h6 align="center">주소및 지도 정보</h6>
						<div id="map" style="width:500px;height:300px;"></div>
					</div>	
					
				</td>
			</tr>
			
		</table>
	</DIV>
	
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
	<script>
		
	        var slideIndex = 1;showSlides(slideIndex);
			function plusSlides(n) {  
				showSlides(slideIndex += n);
			}
			function currentSlide(n) {
				showSlides(slideIndex = n);
			}
			function showSlides(n) {
				var i;  
				var slides = document.getElementsByClassName("mySlides");  
				var dots = document.getElementsByClassName("dot");  
				if (n > slides.length) {
					slideIndex = 1;
				}  
				if (n < 1) {
					slideIndex = slides.length;
				}  
				for (i = 0; i < slides.length; i++) {      
					slides[i].style.display = "none";  
				}  
				for (i = 0; i < dots.length; i++) {      
					dots[i].className = dots[i].className.replace("active", "");  
				}  
				slides[slideIndex-1].style.display = "block";dots[slideIndex-1].className += " active";
			}

    		

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
		            content: '<div style="width:200px;text-align:left;padding:6px 0;">식당이름 : ${restaurantVO.res_name}<br/>전화번호 : ${restaurantVO.res_call}<br/>식당 주소 : ${restaurantVO.res_address}</div>'
		        });
		        infowindow.open(map, marker);
		        map.setCenter(coords);
		     }
		});
	</script>
