<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	
	<br />
	<h1 align="center"> 회원가입 </h1>
	<div align="center">
	<form action="/user/signup" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="au" value="user" />
		<table>
			<tr>
				<td>아이디 *</td>
				<td><input type="text" name="user_id" id="user_id" required="required"/><div id="checkResult"></div></td>
			</tr>
			<tr>
				<td>비밀번호 *</td>
				<td><input type="password" name="user_pw" required="required"/></td>
			</tr>
			<tr>
				<td>비밀번호 확인 *</td>
				<td><input type="password" name="pwch" required="required"/></td>
			</tr>
			<tr>
				<td>닉네임 *</td>
				<td><input type="text" name="user_nicname" required="required"/></td>
			</tr>
			<tr>
				<td>email *</td>
				<td>
					<input type="text" name="user_email" required="required"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="회원 가입" />
					<input type="reset" value="재작성" />
					<input type="button" value="취소" onclick="window.location='../content/main'" />
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	
	 
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
	
	<script>
	
	$(document).ready(function(){
		$("#user_id").change(function(){  // id 입력란에 값을 입력했을때, 
			// id 입력란에 사용자가 입력한 값이 필요 
			let idVal = $("#user_id").val();
			//console.log(idVal); 출력해서 확인하기!! 
			
			// 꺼낸 입력값을 서버에 보내서 DB에 동일한 id가 있는지 체크
			$.ajax({
				type: "post", 
				url: "/user/idAvail",
				data: {user_id : idVal},
				dataType : 'json',
				success: function(result){
					if(result == 0){
						$("#checkResult").html('이미 사용중인 아이디 입니다.');
						$("#checkResult").attr('color', 'red');
					}else{
						console.log("success"); 
						console.log(result);
						// 결과를 아이디사용가능여부 input 태그의 value값으로 띄워 주기
						$("#checkResult").html('사용할 수 있는 아이디 입니다.');
						$("#checkResult").attr('color', 'blue');
					}
				}, 
				error: function(e){ 
					console.log(e); 
				}
			}); 
		}); 
	});
	</script>