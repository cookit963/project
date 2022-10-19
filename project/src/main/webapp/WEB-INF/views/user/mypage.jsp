<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<br/>
	<div align="center" >
        <a href="/content/main"><img src="/resources/bueno-master/img/core-img/logo.png" alt=""></a>
    </div>
	<sec:authorize access="isAnonymous()">
		<script type="text/javascript">
			alert("로그인 후 이용해 주세요");
			window.location = "/user/login";
		</script>
	</sec:authorize>
	<div>
		<sec:authorize access="isAuthenticated()">
			<div align="center">
			<h1>MyPage</h1>
			<table>
				<tr>
					<td>
						<a href="/review/ReviewUserList?user_nicname=${user.user_nicname}"><img src="/resources/bueno-master/img/bg-img/r1.png" style="height:125px; width: 125px;" class="aIn"/></a>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="/content/restaurantWishList"><img src="/resources/bueno-master/img/bg-img/r2.png" style="height:125px; width: 125px;" class="aIn"/></a>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="/review/reviewHeartList"><img src="/resources/bueno-master/img/bg-img/r3.png" style="height:125px; width: 125px;" class="aIn"/></a>
					</td>
				</tr>
			</table>
			<br/>
				<table>
					<tr>
						<td>
							<form action="/logout" method="post">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">
								<button style="border: none; background-color:transparent;"><img src="/resources/bueno-master/img/bg-img/i1.png" style="height:125px; width: 125px;" class="aIn"/></button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="/user/modify"><img src="/resources/bueno-master/img/bg-img/i2.png" style="height:125px; width: 125px;" class="aIn"/></a>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="/user/delete"><img src="/resources/bueno-master/img/bg-img/i3.png" style="height:125px; width: 125px;" class="aIn"/></a>
							</form>	
							
						</td>
					</tr>
				</table>
			</div>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		</sec:authorize>
	</div>
	
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
	
	<script>
		$(document).ready(function(){
		
			$(".aIn").mouseover(function(){
			
				$(this).css("transform", "scale(1.4)");
				$(this).css("transition", "all 0.2s linear");
			});
				
			$(".aIn").mouseout(function(){
				
				$(this).css("transform", "scale(1)");
			
			});
		
		});
	</script>