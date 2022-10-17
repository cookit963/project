<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<br/><br/><br/>
	<div align="center">
		<h2>주류 소개란!</h2>
		<form>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<table style="border: 1px solid #444444;  background-color: white;">
				<c:forEach var="alcoholVO" items="${alcoholList}">
					<tbody class="borderColor">
						<tr>
							<td rowspan="5"><a href="#" onclick="window.location='/content/alcoholView?alcol_no=${alcoholVO.alcol_no}'">
								<img src="/resources/save/${alcoholVO.alcol_img}" 
								style="width:200px; height:180px;" /></a></td>
							<td style="width: 200px"><a href="#" onclick="window.location='/content/restaurantView?res_no=${alcoholVO.alcol_no}'">
							${alcoholVO.alcol_title}</a></td>
						</tr>	
					</tbody>	
				</c:forEach>	
			</table>
		</form>
	</div>
	
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>