<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	
	<br/><br/><br/>
	<DIV align="center">
		<table style="width: 500px; white-space: nowrap; background-color: white;" class="borderColor">
			<tr style="background-color: Honeydew;">
				<td>&nbsp;&nbsp;<a href="#" onclick="history.go(-1)">뒤로가기</a>
				</td>
				<td align="right"><a href="/content/restaurantView?res_no=${reviewVO.res_no}">${restarauntVO.res_name}</a>&nbsp;&nbsp;</td>
			</tr>
			<tr style="border-top: 2px solid #fadef7; background-color: Honeydew;">
				<td>
					&nbsp;&nbsp;&nbsp;&nbsp;작성자 : <a href="/review/ReviewUserList?user_nicname=${reviewVO.user_nicname}" style="text-align:left;">${addUser.user_nicname}</a>
				</td>
				<td>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<a style="text-align:right; border:1px;" href="/review/reviewDel?re_no=${reviewVO.re_no}">삭제!</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<c:if test="${user_id eq reviewVO.user_id}">
						<a style="text-align:right; border:1px;" href="/review/reviewDel?re_no=${reviewVO.re_no}">삭제!</a>
					</c:if>
				</sec:authorize>
				</td>
			</tr>
			<tr>
				<td colspan="2">		
					<div class="slideshow-container">
	
						<div class="mySlides fade2" align="center">
						  <img src="/resources/save/${reviewVO.re_img1}" style="height:300px;">
						</div>
						<c:if test="${reviewVO.re_img2 != 'default'}">
							<div class="mySlides fade2" align="center">
							  <img src="/resources/save/${reviewVO.re_img2}" style="height:300px;">
							</div>
						
							<c:if test="${reviewVO.re_img3 != 'default'}">
								<div class="mySlides fade2" align="center">
								  <img src="/resources/save/${reviewVO.re_img3}" style="height:300px;">
								</div>
							</c:if>
						<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
						<a class="next" onclick="plusSlides(1)">&#10095;</a>
							
						</c:if>
					</div>
						<br/>
						
					<div style="text-align:center">
					
					  <span class="dot" onclick="currentSlide(1)"></span> 
					  <c:if test="${reviewVO.re_img2 != 'default'}">
					  <span class="dot" onclick="currentSlide(2)"></span>
					  <c:if test="${reviewVO.re_img3 != 'default'}"> 
					  <span class="dot" onclick="currentSlide(3)"></span>
					  </c:if>
					  </c:if> 
					</div>
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;별점 : <input type="number" value="${reviewVO.re_stars}" readonly="readonly" style="border:none;"/>
					</div>
					<br/>
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="8" cols="60" style="border:none; background-color:Snow;" readonly="readonly" >${reviewVO.re_content}</textarea>
					</div>
					
					<div>&nbsp;&nbsp;&nbsp;&nbsp;#Hash Tag<br/>
						&nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="1" cols="60" style="border:none; background-color:Snow;" readonly="readonly">${reviewVO.re_hashtag}</textarea>
					</div>
					<br/>
					<div id="heartsRelord">
						<sec:authorize access="isAnonymous()">
							&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="window.location='/user/login'" style="border: none; background-color: white;">🤍</button>&nbsp;<input type="number" class="heartsCount" value="${heartsCount}" readonly="readonly" style="border: none; width: 30px" />
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<c:if test="${getHeart == null}">
								&nbsp;&nbsp;&nbsp;&nbsp;<button id="heartAddBtn" style="border: none; background-color: white;">🤍</button>&nbsp;<input type="number" class="heartsCount" value="${heartsCount}" readonly="readonly" style="border: none; width: 30px" />
							</c:if>
							<c:if test="${getHeart != null}">
								&nbsp;&nbsp;&nbsp;&nbsp;<button id="heartDelBtn" style="border: none; background-color: white;">❤</button>&nbsp;<input type="number" class="heartsCount" value="${heartsCount}" readonly="readonly" style="border: none; width: 30px" />
							</c:if>
						</sec:authorize>
						&nbsp;&nbsp;&nbsp;댓글
					</div>
					<div id="replyRelord" style="border-top: 2px solid #fadef7">
						<table>
							<tr>
								<td align="center" style="width: 500px">
									댓글 작성<br/>
									<textarea rows="3" cols="50" id="r_content2"  placeholder="댓글을 입력하세요!" class="borderColor"></textarea>
									<sec:authorize access="isAnonymous()">
										<button onclick="window.location='/user/login'" class="borderColor" style="background-color: white">작성 완료!</button>
									</sec:authorize>
									<sec:authorize access="isAuthenticated()">
										<button id="r_comBtn" class="borderColor" style="background-color: white">작성 완료!</button>
									</sec:authorize>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<c:if test="${replyCount != 0}">
								<c:forEach var="replyVO" items="${replyList}">
									<tbody style="width: 500px; white-space: nowrap; border-top: 2px solid #fadef7" >
										<tr>
											<td>
												&nbsp;&nbsp;${replyVO.user_nicname}<br/>
												&nbsp;&nbsp;<textarea rows="2" cols="40" readonly="readonly" class="borderColor">${replyVO.r_content}</textarea><br/>
												&nbsp;&nbsp;<input type="text" readonly="readonly" style="border: none;" value="${replyVO.r_reg}"/>
											</td>
										</tr>
									</tbody>
								</c:forEach>
							</c:if>
							<c:if test="${replyCount == 0}">
								<tr class="borderColor">
									<td align="center" style="width: 500px">댓글이 없습니다!</td>
								</tr>
							</c:if>
						</table>
					</div>	
				</td>
			</tr>
		</table>
	</DIV>
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
	
	<script>
		
	        var slideIndex = 1;showSlides(slideIndex);
			function plusSlides(n) {  
				showSlides(slideIndex += n);
			}
			function currentSlide(n) {
				showSlides(slideIndex = n);
			}
			function showSlides(n) {
				var i;  
				var slides = document.getElementsByClassName("mySlides");  
				var dots = document.getElementsByClassName("dot");  
				if (n > slides.length) {
					slideIndex = 1;
				}  
				if (n < 1) {
					slideIndex = slides.length;
				}  
				for (i = 0; i < slides.length; i++) {      
					slides[i].style.display = "none";  
				}  
				for (i = 0; i < dots.length; i++) {      
					dots[i].className = dots[i].className.replace("active", "");  
				}  
				slides[slideIndex-1].style.display = "block";dots[slideIndex-1].className += " active";
			}
	</script>
	<script>
		$(document).ready(function(){
			
			$(document).on('click','#r_comBtn', function(){
				console.log("ajax3!!!!!!!");

				$.ajax({
					url: "/reply/replyAdd",
					type: "POST",
					data: {
						user_id: '${user_id}',
						user_nicname: '${user.user_nicname}',
						re_no: ${reviewVO.re_no},
						r_content: $('#r_content2').val()
					},
					success: function(data){
						if(data != 1){
							$('#replyRelord').load(location.href+" #replyRelord","");
							alert("댓글작성 완료!");
							
						}else{
							alert("에러 발생");
						}
					},error: function(e){ 
						console.log(e); 
					}
				});
			});
			
			$(document).on('click','#heartAddBtn', function(){
				console.log("ajax!!!!!!!");
				$.ajax({
					url: "/review/heartAdd",
					type: "POST",
					data: {
						user_id: '${user_id}',
						re_no: ${reviewVO.re_no}
					},
					success: function(data){
						if(data != 1){
							$('#heartAddBtn').html('❤');
							$('#heartAddBtn').attr('id', 'heartDelBtn');
							$('#heartsRelord').load(location.href+" #heartsRelord","");
						}else{
							alert("에러 발생");
						}
					},error: function(e){ 
						console.log(e); 
					}
				});
			});
			$(document).on('click','#heartDelBtn', function(){
				console.log("ajax2!!!!!!!");
				$.ajax({
					url: "/review/heartDel",
					type: "POST",
					data: {
						user_id: '${user_id}',
						re_no: ${reviewVO.re_no}
					},
					success: function(data){
						if(data != 1){
							$('#heartDelBtn').html('🤍');
							$('#heartDelBtn').attr('id', 'heartAddBtn');
							$('#heartsRelord').load(location.href+" #heartsRelord","");
							
						}else{
							alert("에러 발생");
						}
					},error: function(e){ 
						console.log(e); 
					}
				});
			});
		});
	</script>