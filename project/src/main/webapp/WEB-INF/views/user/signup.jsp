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
	<h1 align="center"> Register </h1>
	<div align="center">
	<form action="/user/signup" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="check1" id="check1" value="no"/>
		<input type="hidden" name="check2" id="check2" value="no"/>
		<input type="hidden" name="check3" id="check3" value="no"/>
		<input type="hidden" name="check4" id="check4" value="no"/>
		<input type="hidden" name="au" value="user" />
		<table style="width: 250px; background-color: #f6ceaa; border-radius: 10px;border-style: hidden;" >
			<tr align="center">
				
				<td>아이디*<br/><input type="text" name="user_id" id="user_id" required="required" style="border: none; border-radius: 10px;"/><div id="checkResult">&nbsp;</div></td>
			</tr>
			
			<tr align="center">
				
				<td>비밀번호*<br/><input type="password" name="user_pw" required="required" id="pw" style="border: none; border-radius: 10px;"/><br/></td>
			</tr>
			<tr align="center">
				
				<td>비밀번호 확인*<br/><input type="password" name="pwch" required="required" id="pwch" style="border: none; border-radius: 10px;"/><div id="checkResult2">&nbsp;</div></td>
			</tr>
			<tr align="center">
				
				<td>닉네임*<br/><input type="text" name="user_nicname" required="required" id="nicname" style="border: none; border-radius: 10px;"/><div id="checkResult4">&nbsp;</div></td>
			</tr>
			<tr align="center">
				
				<td>
					Email*<br/><input type="text" name="user_email" required="required" id="email" style="border: none; border-radius: 10px;"/><div id="checkResult3">&nbsp;</div>
				</td>
			</tr>
			<tr>
				<td align="right">
					<input type="submit" value="회원 가입" style="border-radius: 10px"/>&nbsp;
					<input type="reset" value="재작성" style="border-radius: 10px"/>&nbsp;
					<input type="button" value="취소" onclick="window.location='../content/main'" style="border-radius: 10px"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	<br/><br/><br/><br/>
	 
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
	<script>
		$(document).ready(function(){
			var result = '<c:out value="${signResult}"/>';
	        if(result == "1"){
	            alert("회원가입 실패! 입력사항을 다시 확인해 주세요");
	        }
		});	
	</script>
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
						$("#check1").attr('value', "yes");
					}
				}, 
				error: function(e){ 
					console.log(e); 
				}
			}); 
		});
		$("#pwch").change(function(){
			let pwVal = $("#pw").val();
			let pwchVal = $("#pwch").val();
			
			if(pwVal == pwchVal){
				$("#checkResult2").html('비밀번호가 맞습니다!.');
				$("#checkResult2").attr('color', 'blue');
				$("#check2").attr('value', "yes");
			}else{
				$("#checkResult2").html('비밀번호가 틀립니다! 비밀번호를 재확인 해주세요.');
				$("#checkResult2").attr('color', 'red');
			}
		});
		$("#email").change(function(){  // id 입력란에 값을 입력했을때, 
			// id 입력란에 사용자가 입력한 값이 필요 
			let emailVal = $("#email").val();
			//console.log(idVal); 출력해서 확인하기!! 
			
			// 꺼낸 입력값을 서버에 보내서 DB에 동일한 id가 있는지 체크
			$.ajax({
				type: "post", 
				url: "/user/emailAvail",
				data: {user_email : emailVal},
				dataType : 'json',
				success: function(result){
					if(result == 0){
						$("#checkResult3").html('이미 사용중인 이메일 입니다.');
						$("#checkResult3").attr('color', 'red');
					}else{
						console.log("success"); 
						console.log(result);
						// 결과를 아이디사용가능여부 input 태그의 value값으로 띄워 주기
						$("#checkResult3").html('사용할 수 있는 이메일 입니다.');
						$("#checkResult3").attr('color', 'blue');
						$("#check3").attr('value', "yes");
					}
				}, 
				error: function(e){ 
					console.log(e); 
				}
			}); 
		});
		$("#nicname").change(function(){  // id 입력란에 값을 입력했을때, 
			// id 입력란에 사용자가 입력한 값이 필요 
			let nicnameVal = $("#nicname").val();
			//console.log(idVal); 출력해서 확인하기!! 
			
			// 꺼낸 입력값을 서버에 보내서 DB에 동일한 id가 있는지 체크
			$.ajax({
				type: "post", 
				url: "/user/nicnameAvail",
				data: {user_nicname : nicnameVal},
				dataType : 'json',
				success: function(result){
					if(result == 0){
						$("#checkResult4").html('이미 사용중인 닉네임 입니다.');
						$("#checkResult4").attr('color', 'red');
					}else{
						console.log("success"); 
						console.log(result);
						// 결과를 아이디사용가능여부 input 태그의 value값으로 띄워 주기
						$("#checkResult4").html('사용할 수 있는 닉네임 입니다.');
						$("#checkResult4").attr('color', 'blue');
						$("#check4").attr('value', "yes");
					}
				}, 
				error: function(e){ 
					console.log(e); 
				}
			}); 
		});
		
	});
	</script>