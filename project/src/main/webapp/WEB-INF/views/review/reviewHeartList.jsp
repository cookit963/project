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
			<table style="width: 500px; white-space: nowrap; border: 1px solid black;">
				<c:forEach var="reviewVO" items="${reviewList}">
					<tbody style="border: 1px solid #444444;">
						<tr>
							<td style="background-color: Honeydew;">
								&nbsp;&nbsp;&nbsp;&nbsp;작성자 : <a href="/Review/ReviewUserList?user_nicname=${reviewVO.user_nicname}" style="text-align:left; border:1px; font-size: large;">${reviewVO.user_nicname}</a>
							</td>
							<td align="right" style="background-color: Honeydew;"><a class="resNameGet" href="/content/restaurantView?res_no=${reviewVO.res_no}" style="border:1px solid black;" type="a" data-resno="${reviewVO.res_no}"></a>&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2">
								<a href="/review/reviewView?re_no=${reviewVO.re_no}">
									<div>
									  <img src="/resources/save/${reviewVO.re_img1}" style="width:500px; height:300px;">
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
											&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="window.location='/user/login'">좋아요</button>&nbsp;<input type="number" class="heartsCount" value="0" data-reno="${reviewVO.re_no}" readonly="readonly" style="border: none; width: 30px" />
										</sec:authorize>
										<sec:authorize access="isAuthenticated()">
												&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="heartAddBtn" data-reno="${reviewVO.re_no}">좋아요</button>&nbsp;<input type="number" class="heartsCount" value="0" data-reno="${reviewVO.re_no}" readonly="readonly" style="border: none; width: 30px" />
										</sec:authorize>
									</div>
								<br/>
							</td>
						</tr>
						<tr>
							<td style="border: 1px solid black" colspan="2">&nbsp;</td>
						</tr>
					</tbody>
				</c:forEach>	
			</table>
		</form>
	</div>
	
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
	<script>
		if(${reviewList} == ""){
			alert('좋아하는 리뷰가 없습니다! 좋아요를 눌러 주세요!!');
			window.location="/user/mypage";
		}
	</script>
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
							clickedBtn.html('안좋아요');
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
							clickedBtn.html('좋아요');
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
							hearts.html('안좋아요');
							hearts.attr('class', 'heartDelBtn');
						}else{
							
						}
					},error: function(e){ 
						console.log(e); 
					}
				});
			});
			
		});
	</script>
