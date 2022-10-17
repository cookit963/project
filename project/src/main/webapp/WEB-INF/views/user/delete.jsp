<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<div align="center">
		<h1> 회원 탈퇴 </h1>
		<form action="/user/delete" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="user_pw" value="${user.user_pw}" />
			<table style=" background-color: white;">
				<tr>
					<td> 탈퇴를 원하시면 비밀번호를 입력하세요 <br />
						<input type="password" name="user_pawd" />
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="탈퇴" />
						<input type="button" value="취소" onclick="window.location='/user/mypage'" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>