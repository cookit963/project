<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	
	<h1 align="center">login</h1>
	
	<form action="login-check" method="post" align="center">
		<c:if test="${param.ng!=null}">
			<p>error : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.massage}"/></p>
		</c:if>
		<input type="text" name="user_id" placeholder="ID" /><br/>
		<br/>
		<input type="password" name="user_pw" placeholder="PW" /><br/>
		<br/>
		<input type="button" value="SignUp" onclick="window.location='/user/signup'" />
		<input type="submit" value="login" />
	
	</form>
	
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>