<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
	<br/><br/><br/>
	<div align="center">
		
		<form action="/admin/restaurantAdd" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<table border="1" style=" background-color: white;">
				<tr>
					<td>
						<div>
							&nbsp;&nbsp;<a id="back1">뒤로가기</a>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<input type="text" name="res_name" placeholder="식당 이름 입력" required="required"/>
						</div>
					</td>
				</tr>
				<div>
					<tr>
						<td>
							메인사진<input type="file" name="res_img01" required="required"/><br/>
							사진2<input type="file" name="res_img02"/><br/>
							사진3<input type="file" name="res_img03"/><br/><br/>
							<table>
								<tr>
									<td>
										<div>
											<input type="text" name="res_call" placeholder="식당 전화번호 입력" required="required"/>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div>
											
											<input type="text" name="res_address" id="res_address" placeholder="식당 주소 입력" required="required"/>
											<input type="button" onclick="address_ser()" value="식당주소찾기" />
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div>
											<input type="text" name="res_content" placeholder="식당 설명 입력" required="required"/>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div>
											<table border="1">
												<tr>
													<td>
														식당 종류 선택<br/>
														<input type="radio" name="res_genre" value="고기" />고기
														<input type="radio" name="res_genre" value="오마카세" />오마카세
														<input type="radio" name="res_genre" value="회" />회<br/>
														<input type="radio" name="res_genre" value="레스토랑" />레스토랑
														<input type="radio" name="res_genre" value="뷔페" />뷔페
														<input type="radio" name="res_genre" value="기타" checked="checked"/>기타
													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div>
											식당의 메뉴 및 가격<input type="file" name="res_menuu" required="required"/>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<h6 align="center">콜키지 정보</h6>
								<input type="text" name="res_colCon" placeholder="콜키지 가격 정보 입력" required="required"/><br/>
								전용잔<input type="checkbox" name="res_colGlass" value="1"/>&nbsp;&nbsp;&nbsp;
								서버<input type="checkbox" name="res_colSer" value="1"/>&nbsp;&nbsp;&nbsp;
								오프너<input type="checkbox" name="res_colOpen" value="1"/>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<h6 align="center">편의시설</h6>
								프라이빗 룸<input type="checkbox" name="res_amenPrivate" value="1"/>&nbsp;&nbsp;&nbsp;
								주차장<input type="checkbox" name="res_amenPaking" value="1"/>&nbsp;&nbsp;&nbsp;
								단체석<input type="checkbox" name="res_amenParty" value="1"/><br/>
								발렛파킹<input type="checkbox" name="res_amenValet" value="1"/>&nbsp;&nbsp;&nbsp;
								대관<input type="checkbox" name="res_amenRental" value="1"/>&nbsp;&nbsp;&nbsp;
								소믈리에<input type="checkbox" name="res_amenSoml" value="1"/>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="작성 완료" />
						</td>
					</tr>
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
				window.location="/admin/main";
	        }
		});	
	</script>
	<script>
	 function address_ser() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                
	                } else {
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('res_address').value = addr;
	            }
	        }).open();
	    }	
	</script>
	