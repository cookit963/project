<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<br/><br/><br/>
	<div align="center">
	<form action="/admin/alcoholAdd" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<table style=" background-color: white;" class="borderColor">
				<tr>
					<td>
						<div>
							&nbsp;&nbsp;&nbsp;&nbsp;<a href="history.go(-1)">뒤로가기</a>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							<input type="text" name="alcol_title" placeholder="주류 이름 입력" required="required" class="borderColor"/>
						</div>
					</td>
				</tr>
				<div>
					<tr>
						<td>
							<div align="center"><br/>메인사진<br/>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="file" name="alcol_img1" required="required"/><br/><br/></div>
							<table>
								<tr>
									<td>
										<div>
											<textarea rows="15" cols="60" name="alcol_content" placeholder="내용 입력" required="required" class="borderColor" ></textarea>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div>
											<br/><textarea rows="3" cols="60" name="alcol_etc" placeholder="판매처 및 가격정보 입력" required="required" class="borderColor"></textarea>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<div align="right"><input type="submit" value="작성 완료" />&nbsp;&nbsp;&nbsp;&nbsp;</div>
						</td>
					</tr>
				</div>
			</table>
		</form>
	</div>
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
	<script>
		var result = '<c:out value="${result}"/>';
		if(!(result=='')){
			alert("주류 소개 등록 완료!");
			window.location='/content/alcoholView?alcol_no='+${result};
		}
	</script>