<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<div align="center">
		<h1>회원정보수정</h1>
		<form action="/user/modify" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<table>
			<tr>
				<td>유저 아이디</td>
				<td>${user.user_id}</td>
			</tr>
			<tr>
				<td>비밀번호 변경</td>
				<td><input type="password" name="user_pw" /></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="pwch" /></td>
			</tr>
			<tr>
				<td>닉네임 변경</td>
				<td><input type="text" name="user_nicname" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" />
					<input type="reset" value="재작성" />
					<input type="button" value="취소" onclick="window.location='/content/main'" />
				</td>
			</tr>
		</table>
		</form>
	</div>
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>