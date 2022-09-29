<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	
	<h1 align="center">login</h1>
	<div align="center">
		<form action="/login" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="text" name="username" placeholder="ID"><br/>
			<br/>
			<input type="password" name="password" placeholder="PW"><br/>
			<br/>
			<input type="checkbox" name="remember-me">자동로그인<br/>
			<br/>
			<input type="button" value="SignUp" onclick="window.location='/user/signup'" />
			<input type="submit" value="login" />
		</form>
	</div>
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>