<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<style>
		textarea.y{
			position: relative;
  			top: 165px;
		}
	</style>
	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<br/>
	<div align="center" >
        <a href="/content/main"><img src="/resources/bueno-master/img/core-img/logo.png" alt=""></a>
    </div>
    <br/>
    <div align="center" >
    	<table>
    		<tr>
		    	<td>
			    	<a href="/content/colkageMap">
			    		<img src="/resources/bueno-master/img/bg-img/colkage.png" style="height: 340px; border-radius: 10px;"/>
			    	</a>
			    	<textarea rows="6" cols="50" readonly="readonly" style="border: none; border-radius: 10px;  background-color:transparent; font-size: 1.4em; color: #949494;" class="y">콜키지란?  레스토랑이나 바 등에서 판매하지 않는 주류를 고객이 직접 가져왔을 경우 업장에서 병을 개봉하고 글라스를 제공하며 주류 서빙, 디켄팅(포도주의 찌꺼기를 걸러내고 약간 산화시켜서 맛을 끌어올리는 작업), 칠링(얼음 등으로 주류를 차갑게 만드는 작업) 등을 하는 서비스를 제공하는 형태를 말합니다.</textarea>
		    	</td>
	    	</tr>
    	</table>
    </div>
    <br/><br/><br/>
	    <!-- ##### Treading Post Area Start ##### -->
    

    <!-- ##### Hero Area Start ##### -->
    <h2 align="center" style="color: gold">Reviews</h2>
    <div class="hero-area">
        <!-- Hero Post Slides -->
        <div class="hero-post-slides owl-carousel">
            <!-- Single Slide -->
            <div class="single-slide">
                <!-- Blog Thumbnail -->
                <div class="blog-thumbnail">
                   	<div align="center">
						<table style="width: 500px; white-space: nowrap; border: 1px solid #fadef7; background-color: white;">
							<tbody class="borderColor">
								<tr>
									<td style="background-color: Honeydew;">
										&nbsp;&nbsp;&nbsp;&nbsp;작성자 : <a href="/review/ReviewUserList?user_nicname=${review1.user_nicname}" style="text-align:left; border:1px; font-size: large;">${review1.user_nicname}</a>
									</td>
									<td align="right" style="background-color: Honeydew;"><a class="resNameGet" href="/content/restaurantView?res_no=${review1.res_no}" type="a" data-resno="${review1.res_no}"></a>&nbsp;&nbsp;</td>
								</tr>
								<tr>
									<td colspan="2">
										<a href="/review/reviewView?re_no=${review1.re_no}">
											<div align="center">
											  <img src="/resources/save/${review1.re_img1}" style="height:300px; width: auto;"/>
											</div>
											<div>
												&nbsp;&nbsp;&nbsp;&nbsp;별점 : <input type="number" value="${review1.re_stars}" readonly="readonly" style="border:none;"/>
											</div>
											<div>
												&nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="3" cols="50" style="border:none; background-color:Snow;" readonly="readonly" >${review1.re_content}</textarea>
											</div>
										</a>
											<br/>
										
											<div class="heartsRelord">
												<sec:authorize access="isAnonymous()">
													&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="window.location='/user/login'" style="border: none; background-color: white;">🤍</button>&nbsp;<input type="number" class="heartsCount" value="0" data-reno="${review1.re_no}" readonly="readonly" style="border: none; width: 30px" />
												</sec:authorize>
												<sec:authorize access="isAuthenticated()">
														&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="heartAddBtn" data-reno="${review1.re_no}" style="border: none; background-color: white;">🤍</button>&nbsp;<input type="number" class="heartsCount" value="0" data-reno="${review1.re_no}" readonly="readonly" style="border: none; width: 30px" />
												</sec:authorize>
											</div>
										<br/>
									</td>
								</tr>
							</tbody>	
						</table>
					</div>
                </div>
            </div>
            <!-- Single Slide -->
            <div class="single-slide">
                <!-- Blog Thumbnail -->
                <div class="blog-thumbnail">
                    <div align="center">
						<table style="width: 500px; white-space: nowrap; border: 1px solid black; background-color: white;">
							<tbody class="borderColor">
								<tr>
									<td style="background-color: Honeydew;">
										&nbsp;&nbsp;&nbsp;&nbsp;작성자 : <a href="/review/ReviewUserList?user_nicname=${review2.user_nicname}" style="text-align:left; border:1px; font-size: large;">${review2.user_nicname}</a>
									</td>
									<td align="right" style="background-color: Honeydew;"><a class="resNameGet" href="/content/restaurantView?res_no=${review2.res_no}" type="a" data-resno="${review2.res_no}"></a>&nbsp;&nbsp;</td>
								</tr>
								<tr>
									<td colspan="2">
										<a href="/review/reviewView?re_no=${review2.re_no}">
											<div align="center">
											  <img src="/resources/save/${review2.re_img1}" style="height:300px; width: auto;">
											</div>
											<div>
												&nbsp;&nbsp;&nbsp;&nbsp;별점 : <input type="number" value="${review2.re_stars}" readonly="readonly" style="border:none;"/>
											</div>
											<div>
												&nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="3" cols="50" style="border:none; background-color:Snow;" readonly="readonly" >${review2.re_content}</textarea>
											</div>
										</a>
											<br/>
										
											<div class="heartsRelord">
												<sec:authorize access="isAnonymous()">
													&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="window.location='/user/login'" style="border: none; background-color: white;">🤍</button>&nbsp;<input type="number" class="heartsCount" value="0" data-reno="${review2.re_no}" readonly="readonly" style="border: none; width: 30px" />
												</sec:authorize>
												<sec:authorize access="isAuthenticated()">
														&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="heartAddBtn" data-reno="${review2.re_no}" style="border: none; background-color: white;">🤍</button>&nbsp;<input type="number" class="heartsCount" value="0" data-reno="${review2.re_no}" readonly="readonly" style="border: none; width: 30px" />
												</sec:authorize>
											</div>
										<br/>
									</td>
								</tr>
							</tbody>	
						</table>
					</div>
                </div>
            </div>
            <!-- Single Slide -->
            <div class="single-slide">
                <!-- Blog Thumbnail -->
                <div class="blog-thumbnail">
                    <div align="center">
						<table style="width: 500px; white-space: nowrap; border: 1px solid black; background-color: white;">
							<tbody class="borderColor">
								<tr>
									<td style="background-color: Honeydew;">
										&nbsp;&nbsp;&nbsp;&nbsp;작성자 : <a href="/review/ReviewUserList?user_nicname=${review3.user_nicname}" style="text-align:left; border:1px; font-size: large;">${review3.user_nicname}</a>
									</td>
									<td align="right" style="background-color: Honeydew;"><a class="resNameGet" href="/content/restaurantView?res_no=${review3.res_no}" type="a" data-resno="${review3.res_no}"></a>&nbsp;&nbsp;</td>
								</tr>
								<tr>
									<td colspan="2">
										<a href="/review/reviewView?re_no=${review3.re_no}">
											<div align="center">
											  <img src="/resources/save/${review3.re_img1}" style="height:300px; width: auto;">
											</div>
											<div>
												&nbsp;&nbsp;&nbsp;&nbsp;별점 : <input type="number" value="${review3.re_stars}" readonly="readonly" style="border:none;"/>
											</div>
											<div>
												&nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="3" cols="50" style="border:none; background-color:Snow;" readonly="readonly" >${review3.re_content}</textarea>
											</div>
										</a>
											<br/>
										
											<div class="heartsRelord">
												<sec:authorize access="isAnonymous()">
													&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="window.location='/user/login'" style="border: none; background-color: white;">🤍</button>&nbsp;<input type="number" class="heartsCount" value="0" data-reno="${review3.re_no}" readonly="readonly" style="border: none; width: 30px" />
												</sec:authorize>
												<sec:authorize access="isAuthenticated()">
														&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="heartAddBtn" data-reno="${review3.re_no}" style="border: none; background-color: white;">🤍</button>&nbsp;<input type="number" class="heartsCount" value="0" data-reno="${review3.re_no}" readonly="readonly" style="border: none; width: 30px" />
												</sec:authorize>
											</div>
										<br/>
									</td>
								</tr>
							</tbody>	
						</table>
					</div>
                </div>  
            </div>
            <!-- Single Slide -->
            <div class="single-slide">
                <!-- Blog Thumbnail -->
                <div class="blog-thumbnail">
                    <div align="center">
						<table style="width: 500px; white-space: nowrap; border: 1px solid black; background-color: white;">
							<tbody class="borderColor">
								<tr>
									<td style="background-color: Honeydew;">
										&nbsp;&nbsp;&nbsp;&nbsp;작성자 : <a href="/review/ReviewUserList?user_nicname=${review4.user_nicname}" style="text-align:left; border:1px; font-size: large;">${review4.user_nicname}</a>
									</td>
									<td align="right" style="background-color: Honeydew;"><a class="resNameGet" href="/content/restaurantView?res_no=${review4.res_no}" type="a" data-resno="${review4.res_no}"></a>&nbsp;&nbsp;</td>
								</tr>
								<tr>
									<td colspan="2">
										<a href="/review/reviewView?re_no=${review4.re_no}">
											<div align="center">
											 	<img src="/resources/save/${review4.re_img1}" style="height:300px; width: auto;">
											</div>
											<div>
												&nbsp;&nbsp;&nbsp;&nbsp;별점 : <input type="number" value="${review4.re_stars}" readonly="readonly" style="border:none;"/>
											</div>
											<div>
												&nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="3" cols="50" style="border:none; background-color:Snow;" readonly="readonly" >${review4.re_content}</textarea>
											</div>
										</a>
											<br/>
										
											<div class="heartsRelord">
												<sec:authorize access="isAnonymous()">
													&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="window.location='/user/login'" style="border: none; background-color: white;">🤍</button>&nbsp;<input type="number" class="heartsCount" value="0" data-reno="${review4.re_no}" readonly="readonly" style="border: none; width: 30px" />
												</sec:authorize>
												<sec:authorize access="isAuthenticated()">
														&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="heartAddBtn" data-reno="${review4.re_no}" style="border: none; background-color: white;">🤍</button>&nbsp;<input type="number" class="heartsCount" value="0" data-reno="${review4.re_no}" readonly="readonly" style="border: none; width: 30px" />
												</sec:authorize>
											</div>
										<br/>
									</td>
								</tr>
							</tbody>	
						</table>
					</div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Hero Area End ##### -->

    <!-- ##### Catagory Area Start ##### -->
    
    <div class="post-catagory section-padding-100-0 mb-70">
    	<h2 align="center" style="color: gold">Food Category</h2>
        <div class="container">
            <div class="row justify-content-center">
                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="/resources/bueno-master/img/bg-img/Beef.jpg" alt="" style="border-radius: 10px">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="/content/restaurantList?res_ca=고기" class="post-title">Beef</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="/resources/bueno-master/img/bg-img/Omakase.jpg" alt="" style="border-radius: 10px">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="/content/restaurantList?res_ca=오마카세" class="post-title">Omakase</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="/resources/bueno-master/img/bg-img/Sushi.jpg" alt="" style="border-radius: 10px">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="/content/restaurantList?res_ca=회" class="post-title">Sushi</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="/resources/bueno-master/img/bg-img/Restaurant.jpg" alt="" style="border-radius: 10px">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="/content/restaurantList?res_ca=레스토랑" class="post-title">Restaurant</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="/resources/bueno-master/img/bg-img/Buffet.jpg" alt="" style="border-radius: 10px">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="/content/restaurantList?res_ca=뷔페" class="post-title">Buffet</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Post Catagory -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-catagory mb-30">
                        <img src="/resources/bueno-master/img/bg-img/DifferentOrder.jpg" alt="" style="border-radius: 10px">
                        <!-- Content -->
                        <div class="catagory-content-bg">
                            <div class="catagory-content">
                                <a href="/content/restaurantList?res_ca=기타" class="post-title">Different Order</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Catagory Area End ##### -->

    <!-- ##### Big Posts Area Start ##### -->
    <h2 align="center" style=" color: gold">Alcohol Info</h2>
    <div class="big-posts-area mb-50">
        <div class="container">
            <!-- Single Big Post Area -->
            <div class="row align-items-center">
                <div class="col-12 col-md-6">
                    <div class="big-post-thumbnail mb-50">
                        <img src="/resources/save/${alcohol1.alcol_img}" alt="" style="width: 500px; height: 500px; border-radius: 10px">
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="big-post-content text-center mb-50">
                        <a href="/content/alcoholList" class="post-tag">Alcohol</a>
                        <a href="/content/alcoholView?alcol_no=${alcohol1.alcol_no}" class="post-title">${alcohol1.alcol_title}</a>
                        <p>${alcohol1.alcol_content}</p>
                        <a href="/content/alcoholView?alcol_no=${alcohol1.alcol_no}" class="btn bueno-btn">Read more</a>
                    </div>
                </div>
            </div>

            <!-- Single Big Post Area -->
            <div class="row align-items-center">
                <div class="col-12 col-md-6">
                    <div class="big-post-content text-center mb-50">
                        <a href="/content/alcoholList" class="post-tag">Alcohol</a>
                        <a href="/content/alcoholView?alcol_no=${alcohol2.alcol_no}" class="post-title">${alcohol2.alcol_title}</a>
                        <p>${alcohol2.alcol_content}</p>
                        <a href="/content/alcoholView?alcol_no=${alcohol2.alcol_no}" class="btn bueno-btn">Read more</a>
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="big-post-thumbnail mb-50">
                        <img src="/resources/save/${alcohol2.alcol_img}" alt="" style="width: 500px; height: 500px; border-radius: 10px">
                    </div>
                </div>
            </div>
        </div>
    </div>

		<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
	<script>
		$(document).ready(function(){
			var result = '<c:out value="${signResult}"/>';
	        if(result == "1"){
	            alert("회원가입 성공!");
	        }
		});	
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
			
		});
	</script>