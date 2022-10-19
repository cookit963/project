<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<br/>
	<div align="center" >
        <a href="/content/main"><img src="/resources/bueno-master/img/core-img/logo.png" alt=""></a>
    </div>
	<div align="center">
		<h2>관리자 페이지</h2>
		<br/>
		<table>
			<tr>
				<td>
					<a href="/admin/restaurantAdd"><img src="/resources/bueno-master/img/bg-img/ad1.png" style="height:125px;" class="aIn"/></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="/admin/alcoholAdd"><img src="/resources/bueno-master/img/bg-img/ad2.png" style="height:125px;" class="aIn"/></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="/admin/userManagement"><img src="/resources/bueno-master/img/bg-img/ad3.png" style="height:125px;" class="aIn"/></a>
				</td>
			</tr>
		</table>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
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