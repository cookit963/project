<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<div align="center">
		<div class="post-catagory section-padding-100-0 mb-70">
        <div class="container">
            <div class="row justify-content-center">
                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="/resources/bueno-master/img/bg-img/Beef.jpg" alt="" style="write: 200px; height: 160px; border-radius: 10px">
                        <!-- Content -->
                        <div class="catagory-content-bg" style="border-radius: 10px">
                            <div class="catagory-content">
                                <a href="/content/restaurantList?res_ca=고기" class="post-title">Beef</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="/resources/bueno-master/img/bg-img/Omakase.jpg" alt="" style="write: 200px; height: 160px; border-radius: 10px">
                        <!-- Content -->
                        <div class="catagory-content-bg" style="border-radius: 10px">
                            <div class="catagory-content">
                                <a href="/content/restaurantList?res_ca=오마카세" class="post-title">Omakase</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="/resources/bueno-master/img/bg-img/Sushi.jpg" alt="" style="write: 200px; height: 160px; border-radius: 10px">
                        <!-- Content -->
                        <div class="catagory-content-bg" style="border-radius: 10px">
                            <div class="catagory-content">
                                <a href="/content/restaurantList?res_ca=회" class="post-title">Sushi</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="/resources/bueno-master/img/bg-img/Restaurant.jpg" alt="" style="write: 200px; height: 160px; border-radius: 10px">
                        <!-- Content -->
                        <div class="catagory-content-bg" style="border-radius: 10px">
                            <div class="catagory-content">
                                <a href="/content/restaurantList?res_ca=레스토랑" class="post-title">Restaurant</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="/resources/bueno-master/img/bg-img/Buffet.jpg" alt="" style="write: 200px; height: 160px; border-radius: 10px">
                        <!-- Content -->
                        <div class="catagory-content-bg" style="border-radius: 10px">
                            <div class="catagory-content">
                                <a href="/content/restaurantList?res_ca=뷔페" class="post-title">Buffet</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="/resources/bueno-master/img/bg-img/DifferentOrder.jpg" alt="" style="write: 200px; height: 160px; border-radius: 10px">
                        <!-- Content -->
                        <div class="catagory-content-bg" style="border-radius: 10px">
                            <div class="catagory-content">
                                <a href="/content/restaurantList?res_ca=기타" class="post-title">Different Order</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
		<form>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<table style="background-color: white;">
				<c:forEach var="restaurant" items="${restaurantList}">
					<c:if test="${res_ca eq 'all'}">
					<tbody class="borderColor">
						<tr>
							<td rowspan="4" align="center"><a href="#" onclick="window.location='/content/restaurantView?res_no=${restaurant.res_no}'">
							<img src="/resources/save/${restaurant.res_img1}" 
							style="height:180px;"/></a></td>
							<td><a href="#" onclick="window.location='/content/restaurantView?res_no=${restaurant.res_no}'">
							${restaurant.res_name}</a></td>
						</tr>
						<tr>
							<td><a href="#" onclick="window.location='/content/restaurantView?res_no=${restaurant.res_no}'">
							별점 : <input type="text" value="아직 별점이 없습니다!" class="rest_stars" readonly="readonly" style="border:none" data-resno="${restaurant.res_no}"/></a></td>
						</tr>
						<tr>
							<td><a href="#" onclick="window.location='/content/restaurantView?res_no=${restaurant.res_no}'">
							${restaurant.res_genre}</a></td>
						</tr>
						<tr>
							<td><a href="#" onclick="window.location='/content/restaurantView?res_no=${restaurant.res_no}'">
							${restaurant.res_address}</a></td>
						</tr>
					</tbody>
					</c:if>
					<c:if test="${restaurant.res_genre eq res_ca}">
					<tbody class="borderColor">
						<tr>
							<td rowspan="4"><a href="#" onclick="window.location='/content/restaurantView?res_no=${restaurant.res_no}'">
							<img src="/resources/save/${restaurant.res_img1}" 
							style="width:200px; height:180px;" /></a></td>
							<td><a href="#" onclick="window.location='/content/restaurantView?res_no=${restaurant.res_no}'">
							${restaurant.res_name}</a></td>
						</tr>
						<tr>
							<td><a href="#" onclick="window.location='/content/restaurantView?res_no=${restaurant.res_no}'">
							별점 : <input type="number" value="0.0" class="rest_stars" readonly="readonly" style="border:none"/></a></td>
						</tr>
						<tr>
							<td><a href="#" onclick="window.location='/content/restaurantView?res_no=${restaurant.res_no}'">
							${restaurant.res_genre}</a></td>
						</tr>
						<tr>
							<td><a href="#" onclick="window.location='/content/restaurantView?res_no=${restaurant.res_no}'">
							${restaurant.res_address}</a></td>
						</tr>
					</tbody>
					</c:if>	
				</c:forEach>	
			</table>
		</form>
	</div>
	
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
	<script>
		$(document).ready(function(){
			$('.rest_stars').each(function(i,e){
				let rest = $(this);
				let res_noCon = rest.data('resno');
				$.ajax({
					url: '/content/heartCountGet.json',
					type: 'POST',
					data:{
						res_no: res_noCon
					},
					success: function(data){
						if(data != "0"){
							rest.attr('value', data+ ' 점');
						}
					},
					error: function(e){
						console.log(e);
					}
				});
			});
		});
	</script>
	