<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<br/><br/><br/>
	<DIV align="center">
		<table style="width: 500px; white-space: nowrap; border: 1px solid black;">
			<tr style="border: 1px solid black;">
				<td>&nbsp;&nbsp;<a href="#" onclick="history.go(-1)" style="border:1px solid black;">뒤로가기</a>
				</td>
				<td>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<a style="text-align:right; border:1px;" href="/admin/alcoholDel?alcol_no=${alcoholVO.alcol_no}">삭제!</a>
				</sec:authorize>
				</td>
			</tr>
			<tr style="border: 1px solid black;">
				<td>
					&nbsp;&nbsp;&nbsp;&nbsp;<a style="text-align:left; border:1px;">${alcoholVO.alcol_title}</a>
				</td>
				
			</tr>
			<tr>
				<td colspan="2">		
					<img src="/resources/save/${alcoholVO.alcol_img}" style="width:500px; height:600px;">
					<br/>	
					<br/>
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;주류 설명<br/>
						&nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="10" cols="60" style="border:none; background-color:Snow;" readonly="readonly" >${alcoholVO.alcol_content}</textarea>
					</div>
					<br/>
					<div>&nbsp;&nbsp;&nbsp;&nbsp;주류 판매처 및 가격정보<br/>
						&nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="3" cols="60" style="border:none; background-color:Snow;" readonly="readonly">${alcoholVO.alcol_etc}</textarea>
					</div>
					<br/>
				</td>
			</tr>
		</table>
	</DIV>
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>