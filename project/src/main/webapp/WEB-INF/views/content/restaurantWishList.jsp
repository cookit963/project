<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<br/><br/><br/>
	<div align="center">
		<form>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<table style="  background-color: white;" class="borderColor">
				<c:forEach var="restaurant" items="${restaurantList}">
					<tbody class="borderColor">
						<tr>
							<td rowspan="5" align="center"><a href="#" onclick="window.location='/content/restaurantView?res_no=${restaurant.res_no}'">
							<img src="/resources/save/${restaurant.res_img1}" 
							style="height:180px;" /></a></td>
							<td><a href="#" onclick="window.location='/content/restaurantView?res_no=${restaurant.res_no}'">
							${restaurant.res_name}</a></td>
						</tr>
						<tr>
							<td><a href="#" onclick="window.location='/content/restaurantView?res_no=${restaurant.res_no}'">
							별점 : <input type="number" value="0.0" id="rest_stars" readonly="readonly" style="border:none"/></a></td>
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
				</c:forEach>	
			</table>
		</form>
	</div>
	
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
	<script>
		if(${restaurantList} == ""){
			alert('가고싶은 식당이 없습니다! 추가해주세요!!');
			window.location="/user/mypage";
		}
	</script>