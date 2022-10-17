<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<br/><br/><br/><br/>
	<div align="center">
        <a href="/content/main"><img src="/resources/bueno-master/img/core-img/logo.png" alt=""></a>
    </div>
	<h1 align="center">login</h1>
	<div align="center">
		<div style="background-color: #f6ceaa; border-radius: 10px;border-style: hidden; width: 200px;">
			<form action="/login" method="post">
				<c:if test="${LoginFailMessage!=null}">
					<p><c:out value="${LoginFailMessage}"/> </p>
				</c:if>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<br/>
				<input type="text" name="username" placeholder=" ID" required="required" style="border: none; border-radius: 10px;"><br/>
				<br/>
				<input type="password" name="password" placeholder=" PW" required="required" style="border: none; border-radius: 10px;"><br/>
				<br/>
				<input type="checkbox" name="remember-me">자동로그인<br/>
				<br/>
				<input type="submit" value="login" style="border-radius: 10px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="SignUp" onclick="window.location='/user/signup'" style="border-radius: 10px"/>
				<br/><br/>
			</form>
		</div>
	</div><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>