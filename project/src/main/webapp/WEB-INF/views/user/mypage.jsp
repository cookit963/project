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
			<table style="border: 1px solid black;">
				<tr>
					<td>
					<button onclick="/review/ReviewUserList?user_nicname=${user.user_nicname}">내가쓴 리뷰</button>
					<button onclick="/review/reviewHeartList?user_id=${user.user_id}">가고싶은 식당</button>
					<button onclick="/review/restaurantHeartList?user_id=${user.user_id}">좋아요 누른 리뷰</button>
					</td>
				</tr>
			</table>
			<br/>
				<table style="border: 1px solid black;">
					<tr>
						<td>
							
							<form action="/logout" method="post">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">
								<button>로그아웃</button>
							</form>	
							
						</td>
					</tr>
					<tr>
						<td><br/>
							<button onclick="window.location='/user/modify'">회원정보수정</button>
						</td>
					</tr>
					<tr>
						<td><br/>
							<button onclick="window.location='/user/delete'">회원 탈퇴</button>
						</td>
					</tr>
				</table>
			</div>
			
		</sec:authorize>
	</div>
	
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>