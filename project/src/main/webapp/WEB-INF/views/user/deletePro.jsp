<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	
	<c:if test="${result == 1}">
		<script>
			alert("회원 삭제 완료!!!");
			window.location = "/logout";
		</script>
		
	</c:if>
	<c:if test="${result == 0}">
		<script>
			alert("비밀번호를 잘못 입력하셨습니다");
			history.go(-1);
		</script>
	</c:if>
	
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>