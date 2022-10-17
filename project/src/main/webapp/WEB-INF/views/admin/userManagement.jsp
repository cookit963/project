<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<br/><br/><br/>
	<div align="center">
	<h2>회원 관리 페이지</h2>
	<br/>
	
		<c:forEach var="userVO" items="${userList}">
			<c:forEach var="authVO" items="${authList}">
				<c:if test="${userVO.user_id eq authVO.user_id}">
					<table border="1" style="width: 500px; white-space: nowrap;  background-color: white;">
						<tbody>
							<tr>
								<td>
									&nbsp;유저 ID : ${userVO.user_id}&nbsp;
								</td>
								<td>
									&nbsp;유저 닉네임 : ${userVO.user_nicname}&nbsp;
								</td>
								<td>
									&nbsp;유저 이메일 : ${userVO.user_email}&nbsp;
								</td>
							</tr>
							<tr>
								<td>
									 
									<c:if test="${userVO.user_reviewon == 1}">
										<div class="reviewon">&nbsp;리뷰작성 권한 : on&nbsp;</div>
									</c:if>
									<c:if test="${userVO.user_reviewon == 0}">
										<div class="reviewoff">&nbsp;리뷰작성 권한 : off&nbsp;</div>
									</c:if>
								</td>
								<td align="center">
									<c:if test="${userVO.user_reviewon == 1}">
										<button type="button" class="reviewControlBtn" data-id="${userVO.user_id}">권한 해제</button>
									</c:if>
									<c:if test="${userVO.user_reviewon == 0}">
										<button type="button" class="reviewControlBtn2" data-id="${userVO.user_id}">권한 부여</button>
									</c:if>
									
								</td>
							</tr>
							<tr>
								<td>
									
									<c:if test="${authVO.auth eq 'ROLE_USER'}">
										<div class="authon">&nbsp;접근 권한 : 일반 회원&nbsp;</div>
									</c:if>
									<c:if test="${authVO.auth eq 'ROLE_ADMIN'}">
										<div class="authoff">&nbsp;접근 권한 : 관리자&nbsp;</div>
									</c:if> 
								</td>
								<td align="center">
									<c:if test="${authVO.auth eq 'ROLE_USER'}">
										<button type="button" class="roleControlBtn" data-id="${authVO.user_id}">관리자로 변경</button>
									</c:if>
									<c:if test="${authVO.auth eq 'ROLE_ADMIN'}">
										<button type="button" class="roleControlBtn2" data-id="${authVO.user_id}">일반 회원으로 변경</button>
									</c:if> 
									
								</td>
							</tr>
							<tr>
								<td colspan="3">
									계정 생성 날짜 : ${userVO.user_reg}
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
				</c:if>
			</c:forEach>
		</c:forEach>
	
	</div>
	
	
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
	<script>
		$(document).ready(function(){
			$(document).on('click', '.reviewControlBtn', function(){
				let clickBtn = $(this);
				let user_idCheck = clickBtn.data('id');
				$.ajax({
					url: '/admin/reviewControl.json',
					type: 'POST',
					data:{
						user_id: user_idCheck 
					},
					success: function(data){
						if(data == 1){
							clickBtn.html('권한 부여');
							clickBtn.attr('class', 'reviewControlBtn2');
							window.location.reload();
						}else{
							alert('에러 발생');
						}
					},
					error: function(e){
						console.log(e);
					}
				});
			});
			$(document).on('click', '.reviewControlBtn2', function(){
				let clickBtn = $(this);
				let user_idCheck = clickBtn.data('id');
				$.ajax({
					url: '/admin/reviewControl2.json',
					type: 'POST',
					data:{
						user_id: user_idCheck 
					},
					success: function(data){
						if(data == 1){
							clickBtn.html('권한 해제');
							clickBtn.attr('class', 'reviewControlBtn');
							window.location.reload();
						}else{
							alert('에러 발생');
						}
					},
					error: function(e){
						console.log(e);
					}
				});
			});
			$(document).on('click', '.roleControlBtn', function(){
				let clickBtn = $(this);
				let user_idCheck = clickBtn.data('id');
				$.ajax({
					url: '/admin/roleControl.json',
					type: 'POST',
					data:{
						user_id: user_idCheck 
					},
					success: function(data){
						if(data == 1){
							clickBtn.html('관리자로 변경');
							clickBtn.attr('class', 'roleControlBtn2');
							window.location.reload();
						}else{
							alert('에러 발생');
						}
					},
					error: function(e){
						console.log(e);
					}
				});
			});
			$(document).on('click', '.roleControlBtn2', function(){
				let clickBtn = $(this);
				let user_idCheck = clickBtn.data('id');
				$.ajax({
					url: '/admin/roleControl2.json',
					type: 'POST',
					data:{
						user_id: user_idCheck 
					},
					success: function(data){
						if(data == 1){
							clickBtn.html('일반 회원으로 변경');
							clickBtn.attr('class', 'roleControlBtn');
							window.location.reload();
						}else{
							alert('에러 발생');
						}
					},
					error: function(e){
						console.log(e);
					}
				});
			});
		});
	</script>