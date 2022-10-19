<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<br/><br/><br/>
	<div align="center">
		<form action="/review/reviewAdd" method="post" enctype="multipart/form-data">
			<input type="hidden" name="res_no" value="${res_no}" />
			<input type="hidden" name="user_id" value="${user.user_id}" />
			<input type="hidden" name="user_nicname" value="${user.user_nicname}" />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<table style="background-color: white;" class="borderColor">
				<tr>
					<td>
						<div>
							&nbsp;&nbsp;<a id="back1">뒤로가기</a>&nbsp;&nbsp;
							내가 갔던 식당 : <input type="text" value="${restarauntVO.res_name}" readonly="readonly" style="border:none"/>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div align="right">
							<input type="number" name="re_stars" placeholder="별점" min="1" max="5" required="required" class="borderColor"/>
						</div>
					</td>
				</tr>
				<div>
					<tr>
						<td>
							메인사진<input type="file" name="re_img01" required="required"/><br/>
							사진2<input type="file" name="re_img02"/><br/>
							사진3<input type="file" name="re_img03"/><br/><br/>
					<table>
						<tr>
							<td>
								<div>
									<textarea rows="15" cols="60" name="re_content" placeholder="내용" required="required" class="borderColor"></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>
									
									<textarea rows="1" cols="60" name="re_hashtag" placeholder="해시태그들" class="borderColor"></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div align="right">
									<input type="submit" value="작성완료" />
								</div>
							</td>
						</tr>
					</table>
				</div>
			</table>
		</form>
	</div>
	
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		$(document).ready(function(){
			$("#back1").click(function(){
				history.go(-1);
			});
			var result = '<c:out value="${result}"/>';
	        if(!(result=='')){
	            alert("게시물이 등록되었습니다!");
				window.location="/review/reviewView?re_no=${reviewReturn.re_no}";
	        }
		});	
		if(${user.user_reviewon} == 0){
			alert("권한이 없습니다!");
			window.location="/content/main";
		};
	</script>