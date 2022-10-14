<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<br/><br/><br/>
	<div align="center">
		<h2>관리자 페이지</h2>
		<br/>
		<table border="1">
			<tr>
				<td>
					<a href="/admin/restaurantAdd">식당 추가</a>
				</td>
				<td>
					<a href="/admin/alcoholAdd">주류 소개 추가</a>
				</td>
				<td>
					<a href="/admin/userManagement">회원 관련 정보</a>
				</td>
			</tr>
		</table>
	</div>
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>