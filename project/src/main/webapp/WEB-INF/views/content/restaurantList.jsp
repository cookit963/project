<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<br/><br/><br/>
	<div align="center">
		<table border="1">
			<tr>
				<td><div align="center"><a href="/content/restaurantList?res_ca=고기">Beef</a></div></td>
				<td><div align="center"><a href="/content/restaurantList?res_ca=오마카세">Omakase</a></div></td>
				<td><div align="center"><a href="/content/restaurantList?res_ca=회">Sushi</a></div></td>
			</tr>
			<tr>
				<td><div align="center"><a href="/content/restaurantList?res_ca=레스토랑">Restaurant</a></div></td>
				<td><div align="center"><a href="/content/restaurantList?res_ca=뷔페">Buffet</a></div></td>
				<td><div align="center"><a href="/content/restaurantList?res_ca=기타">Different Order</a></div></td>
			</tr>
		</table>
		<br/>
		<form>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<table style="border: 1px solid #444444;">
				<c:forEach var="restaurant" items="${restaurantList}">
					<c:if test="${res_ca eq 'all'}">
					<tbody style="border: 1px solid #444444;">
						<tr>
							<td rowspan="5"><a href="#" onclick="window.location='/content/restaurantView?res_no=${restaurant.res_no}'">
							<img src="/resources/save/${restaurant.res_img1}" 
							style="width:200px; height:180px;" /></a></td>
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
						<tr>
							<td>리뷰 개수 추가 예정</td>
						</tr>	
					</tbody>
					</c:if>
					<c:if test="${restaurant.res_genre eq res_ca}">
					<tbody style="border: 1px solid #444444;">
						<tr>
							<td rowspan="5"><a href="#" onclick="window.location='/content/restaurantView?res_no=${restaurant.res_no}'">
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
						<tr>
							<td>리뷰 개수 추가 예정</td>
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
	