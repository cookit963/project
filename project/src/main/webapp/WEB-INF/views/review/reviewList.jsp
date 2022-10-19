<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<br/><br/><br/>
	<div align="center">
		<br/>
		<form>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" value="${res_no}" name="res_no" />
			<table style="width: 500px; white-space: nowrap; background-color: white;" class="borderColor">
				<c:set var="i" value="1"/>
				
				<c:forEach var="reviewVO" items="${reviewList}">
				
					<c:if test="${res_no eq 0}">
					<c:set var="i" value="${i+1}"/>
					<tbody class="borderColor">
						<tr>
							<td style="background-color: Honeydew;">
								&nbsp;&nbsp;&nbsp;&nbsp;작성자 : <a href="/review/ReviewUserList?user_nicname=${reviewVO.user_nicname}" style="text-align:left; border:1px; font-size: large;">${reviewVO.user_nicname}</a>
							</td>
							<td align="right" style="background-color: Honeydew;"><a class="resNameGet" href="/content/restaurantView?res_no=${reviewVO.res_no}" type="a" data-resno="${reviewVO.res_no}"></a>&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2">
								<a href="/review/reviewView?re_no=${reviewVO.re_no}">
									<div align="center">
									  <img src="/resources/save/${reviewVO.re_img1}" style="height:300px;" />
									</div>
									<div>
										&nbsp;&nbsp;&nbsp;&nbsp;별점 : <input type="number" value="${reviewVO.re_stars}" readonly="readonly" style="border:none;"/>
									</div>
									<div>
										&nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="3" cols="50" style="border:none; background-color:Snow;" readonly="readonly" >${reviewVO.re_content}</textarea>
									</div>
								</a>
									<br/>
								
									<div class="heartsRelord">
										<sec:authorize access="isAnonymous()">
											&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="window.location='/user/login'" style="border: none; background-color: white;">🤍</button>&nbsp;<input type="number" class="heartsCount" value="0" data-reno="${reviewVO.re_no}" readonly="readonly" style="border: none; width: 30px" />
										</sec:authorize>
										<sec:authorize access="isAuthenticated()">
												&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="heartAddBtn" data-reno="${reviewVO.re_no}" style="border: none; background-color: white;">🤍</button>&nbsp;<input type="number" class="heartsCount" value="0" data-reno="${reviewVO.re_no}" readonly="readonly" style="border: none; width: 30px" />
										</sec:authorize>
									</div>
								<br/>
							</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
					</tbody>
					</c:if>
					
					<c:if test="${reviewVO.res_no eq res_no}">
					<c:set var="i" value="${i+1}"/>
					<tbody class="borderColor">
						<tr>
							<td style="background-color: Honeydew;">
								&nbsp;&nbsp;&nbsp;&nbsp;작성자 : <a href="/review/ReviewUserList?user_nicname=${reviewVO.user_nicname}" style="text-align:left; border:1px; font-size: large;">${reviewVO.user_nicname}</a>
							</td>
							<td align="right" style="background-color: Honeydew;"><a class="resNameGet" href="/content/restaurantView?res_no=${reviewVO.res_no}" type="a" data-resno="${reviewVO.res_no}"></a>&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2">
								<a href="/review/reviewView?re_no=${reviewVO.re_no}">
									<div align="center">
									  <img src="/resources/save/${reviewVO.re_img1}" style="height:300px;" />
									</div>
									<div>
										&nbsp;&nbsp;&nbsp;&nbsp;별점 : <input type="number" value="${reviewVO.re_stars}" readonly="readonly" style="border:none;"/>
									</div>
									<div>
										&nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="3" cols="50" style="border:none; background-color:Snow;" readonly="readonly" >${reviewVO.re_content}</textarea>
									</div>
								</a>
									<br/>
								
									<div class="heartsRelord">
										<sec:authorize access="isAnonymous()">
											&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="window.location='/user/login'" style="border: none; background-color: white;">🤍</button>&nbsp;<input type="number" class="heartsCount" value="0" data-reno="${reviewVO.re_no}" readonly="readonly" style="border: none; width: 30px" />
										</sec:authorize>
										<sec:authorize access="isAuthenticated()">
												&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="heartAddBtn" data-reno="${reviewVO.re_no}" style="border: none; background-color: white;">🤍</button>&nbsp;<input type="number" class="heartsCount" value="0" data-reno="${reviewVO.re_no}" readonly="readonly" style="border: none; width: 30px" />
										</sec:authorize>
									</div>
								<br/>
							</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
					</tbody>
					</c:if>
					
				</c:forEach>	
			</table>
		</form>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	</div>
	
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
	
	<script>
		$(document).ready(function(){
			
			$(document).on('click','.heartAddBtn', function(){
				console.log($(this));
				let clickedBtn = $(this);
				var hA = clickedBtn.data('reno');
				console.log(hA);
				console.log("ajax!!!!!!!");
				
				$.ajax({
					url: "/review/heartAdd.json",
					type: "POST",
					data: {
						user_id: '${user_id}',
						re_no: hA
					},
					success: function(data){
						console.log("success");
						console.log(data);
						if(data == '1'){
							clickedBtn.html('❤');
							clickedBtn.attr('class', 'heartDelBtn');
							$('.heartsCount').each(function(i,e){
								
								let hearts = $(this);
								let hC = hearts.data('reno');
								
								$.ajax({
									url: "/review/heartsCount2.json",
									type: "POST",
									data: {re_no: hC},
									success: function(data){
										if(data != -1){
											hearts.attr('value', data);
										}else{
											alert("에러 발생");
										}
									},error: function(e){ 
										console.log(e); 
									}
								});
							});
							$('.heartsCount').load(location.href+" .heartsCount","");
						}else{
							alert("에러 발생");
						}
					},error: function(e){ 
						console.log(e); 
					}
				});
				
			});
			$(document).on('click','.heartDelBtn', function(){
				console.log("ajax2!!!!!!!");
				console.log($(this));
				let clickedBtn = $(this);
				let hA = clickedBtn.data('reno');
				$.ajax({
					url: "/review/heartDel.json",
					type: "POST",
					data: {
						user_id: '${user_id}',
						re_no: hA
					},
					success: function(data){
						if(data == 1){
							clickedBtn.html('🤍');
							clickedBtn.attr('class', 'heartAddBtn');
							$('.heartsCount').each(function(i,e){
								
								let hearts = $(this);
								let hC = hearts.data('reno');
								
								$.ajax({
									url: "/review/heartsCount2.json",
									type: "POST",
									data: {re_no: hC},
									success: function(data){
										if(data != -1){
											hearts.attr('value', data);
										}else{
											alert("에러 발생");
										}
									},error: function(e){ 
										console.log(e); 
									}
								});
							});
							$('.heartsCount').load(location.href+" .heartsCount","");
							
						}else{
							alert("에러 발생");
						}
					},error: function(e){ 
						console.log(e); 
					}
				});
			});
			console.log("ajax6!!!!!!!");
			$('.resNameGet').each(function(i,e){
				
				let resNam = $(this);
				let resNo = resNam.data('resno');
				
				$.ajax({
					url: "/review/resGet.json",
					type: "POST",
					data: {res_no: resNo},
					success: function(data){
						if(data != null){
							resNam.html(data.res_name);
						}else{
							alert("에러 발생");
						}
					},error: function(e){ 
						console.log(e); 
					}
				});
			});
			
			console.log("ajax9!!!!!!!");
			$('.heartsCount').each(function(i,e){
				
				let hearts = $(this);
				let hC = hearts.data('reno');
				
				$.ajax({
					url: "/review/heartsCount2.json",
					type: "POST",
					data: {
						re_no: hC
					},
					success: function(data){
						if(data != -1){
							hearts.attr('value', data);
						}else{
							alert("에러 발생");
						}
					},error: function(e){ 
						console.log(e); 
					}
				});
			});
			$('.heartAddBtn').each(function(i,e){
				
				let hearts = $(this);
				let hC = hearts.data('reno');
				
				$.ajax({
					url: "/review/heartCheck.json",
					type: "POST",
					data: {
						re_no: hC,
						user_id: '${user_id}'	
					},
					success: function(data){
						if(data == '1'){
							hearts.html('❤');
							hearts.attr('class', 'heartDelBtn');
						}else{
							
						}
					},error: function(e){ 
						console.log(e); 
					}
				});
			});
			let nullCheck = '<c:out value="${i}"/>';
			console.log("asd"+nullCheck);
			if(nullCheck == 1){
				alert("해당 식당에 리뷰가 없습니다!");
				history.go(-1);
			};
		});
	</script>