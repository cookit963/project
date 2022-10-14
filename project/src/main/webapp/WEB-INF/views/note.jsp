<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div align="center">

		<form>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<table style="border: 1px solid #444444;">
				<c:forEach var="alcoholVO" items="${alcoholList}">
					<tbody style="border: 1px solid #444444;">
						<tr>
							<td rowspan="5"><a href="#" onclick="window.location='/content/alcoholView?alcol_no=${alcoholVO.alcol_no}'">
							<img src="/resources/save/${alcoholVO.alcol_img}" 
							style="width:200px; height:180px;" /></a></td>
							<td><a href="#" onclick="window.location='/content/restaurantView?res_no=${alcoholVO.alcol_no}'">
							${alcoholVO.alcol_title}</a></td>
						</tr>	
					</tbody>	
				</c:forEach>	
			</table>
		</form>
	</div>