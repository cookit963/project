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
					<c:if test="${res_no eq 0}">
					<tbody style="border: 1px solid #444444;">
						<tr>
							<td style="background-color: Honeydew;">
								&nbsp;&nbsp;&nbsp;&nbsp;작성자 : <a href="/Review/ReviewUserList?user_nicname=${reviewVO.user_nicname}" style="text-align:left; border:1px; font-size: large;">${reviewVO.user_nicname}</a>
							</td>
						</tr>
						<tr>
							<td>
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
								
									<div>
									<sec:authorize access="isAnonymous()">
										&nbsp;&nbsp;&nbsp;&nbsp;<button id="heartAddBtn" >좋아요</button>&nbsp;<input type="number" class="heartsCount" value="${heartsCount}" readonly="readonly" style="border: none; width: 30px" />
									</sec:authorize>
									<sec:authorize access="isAuthenticated()">
										<c:if test="${getHeart == null}">
											&nbsp;&nbsp;&nbsp;&nbsp;<button id="heartAddBtn" >좋아요</button>&nbsp;<input type="number" class="heartsCount" value="${heartsCount}" readonly="readonly" style="border: none; width: 30px" />
										</c:if>
										<c:if test="${getHeart != null}">
											&nbsp;&nbsp;&nbsp;&nbsp;<button id="heartDelBtn" >안좋아요</button>&nbsp;<input type="number" class="heartsCount" value="${heartsCount}" readonly="readonly" style="border: none; width: 30px" />
										</c:if>
									</sec:authorize>
								</div>
								<br/>
							</td>
						</tr>
						<tr>
							<td style="border: 1px solid black">&nbsp;</td>
						</tr>
					</tbody>
					</c:if>
					<c:if test="${reviewVO.res_no eq res_no}">
					<tbody style="border: 1px solid #444444;">
						<tr>
							<td style="background-color: Honeydew;">
								&nbsp;&nbsp;&nbsp;&nbsp;작성자 : <a href="/Review/ReviewUserList?user_nicname=${reviewVO.user_nicname}" style="text-align:left; border:1px; font-size: large;">${reviewVO.user_nicname}</a>
							</td>
						</tr>
						<tr>
							<td>
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
								
									<div>
									<sec:authorize access="isAnonymous()">
										&nbsp;&nbsp;&nbsp;&nbsp;<button id="heartAddBtn" >좋아요</button>&nbsp;<input type="number" class="heartsCount" value="${heartsCount}" readonly="readonly" style="border: none; width: 30px" />
									</sec:authorize>
									<sec:authorize access="isAuthenticated()">
										<c:if test="${getHeart == null}">
											&nbsp;&nbsp;&nbsp;&nbsp;<button id="heartAddBtn" >좋아요</button>&nbsp;<input type="number" class="heartsCount" value="${heartsCount}" readonly="readonly" style="border: none; width: 30px" />
										</c:if>
										<c:if test="${getHeart != null}">
											&nbsp;&nbsp;&nbsp;&nbsp;<button id="heartDelBtn" >안좋아요</button>&nbsp;<input type="number" class="heartsCount" value="${heartsCount}" readonly="readonly" style="border: none; width: 30px" />
										</c:if>
									</sec:authorize>
								</div>
								<br/>
							</td>
						</tr>
						<tr>
							<td style="border: 1px solid black">&nbsp;</td>
						</tr>
					</tbody>
					</c:if>	
				</c:forEach>	
			</table>
		</form>
	</div>
	
	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
	