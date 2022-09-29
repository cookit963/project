<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	
	<c:if test="${result == 1}">
		<script>
			alert("회원 정보 수정 완료!!!");
			window.location = "/user/mypage";
		</script>
	</c:if>
	<c:if test="${result == -1}">
		<script>
			alert("닉네임이나 비밀번호중 하나를 변경해 주세요!!!");
			history.go(-1);
		</script>
	</c:if>
	
	
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>