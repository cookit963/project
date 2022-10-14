<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" value="${res_no}" name="res_no" />
	<table style="width: 500px; white-space: nowrap; border: 1px solid black;">
		<c:set var="doneLoop" value="false"/>
		<c:forEach var="reviewVO" items="${reviewList}">
			<tbody style="border: 1px solid #444444;">
				<tr>
					<td style="background-color: Honeydew;">
						&nbsp;&nbsp;&nbsp;&nbsp;작성자 : <a href="/review/ReviewUserList?user_nicname=${reviewVO.user_nicname}" style="text-align:left; border:1px; font-size: large;">${reviewVO.user_nicname}</a>
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
</div>