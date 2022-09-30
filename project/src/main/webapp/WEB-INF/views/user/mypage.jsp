<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	
	<div>
		<sec:authorize access="isAnonymous()">
			<script type="text/javascript">
				alert("로그인 후 이용해 주세요");
				window.location = "/user/login";
			</script>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<div align="center">
				<h1>MyPage</h1>
				<form action="/logout" method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}">
					<button>로그아웃</button>
				</form>
				<button onclick="window.location='/user/modify'">회원정보수정</button>
				<button onclick="window.location='/user/delete'">회원 탈퇴</button>
			</div>
		</sec:authorize>
	</div>
	
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>