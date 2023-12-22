<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/center.css" />
<style>
	#staffWrap{
		width: 90%;
		margin: auto;
	}
	#staffList_top {
		background: black;
		color: white;
		height: 40px;
		line-height: 40px;
	}
	
	#searchTime, #makeTime{
		margin-top:10px;
		border-collapse: collapse;
		width: 100%;
	}
	#searchTime td, #searchTime th, #makeTime td, #makeTime th{
		border: 1px solid #ddd;
		height: 40px;
		padding-left: 10px;
	}
	#searchTime th, #makeTime th{background-color: #ddd;}
	
	#searchTime caption, #makeTime caption{
		text-indent: -9999px;
		height: 0;
	}
</style>

</head>
<c:if test="${tvo eq null }">
<body>
	<article id="wrap">
		<jsp:include page="../../head.jsp"></jsp:include>
		<div id="center">
			<jsp:include page="./leftList.jsp"></jsp:include>
			<div class="right">
				<div id="staffWrap">
					<article>
						<%-- ========== 교직원현황 테이블 시작 ========== --%>
						<div id="staffList_top">과정별시간표만들기</div>
						<table id="searchTime">
						<caption>시간표 검색</caption>
							<tr>
								<th>검색</th>
								<td>
									<select>
										<option value="년도선택">년도선택</option>
										<c:forEach begin="2000" end="2023" var="year">
											<option value="${year }">${year }</option>		
										</c:forEach>
									</select>
								</td>
								<td>
									<select>
										<option>과정타입</option>
									</select>
									<input type="text" size="14" />
									<button type="button">검색</button>
								</td>
							</tr>
						</table>
						<table id="makeTime">
							<colgroup>
								<col width="">
							</colgroup>
							<caption>과정별시간표만들기</caption>
							<thead>
								<tr>
									<th>과정명</th>
									<th>담당교수</th>
									<th>개강일</th>
									<th>종료일</th>
									<th>요일</th>
									<th>회차</th>
									<th>주차</th>
									<th>모집</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${ar ne null }">
								<c:forEach items="${ar }" var="tvo" varStatus="vs"></c:forEach>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td>
										 <button type="button">강사/시설/교과목 액셀등록</button>
										 <button type="button">HRD시간표 액셀등록</button>
										 <button type="button">주별시간표보기</button>
									</td>
								</tr>
								</c:if>
								<c:if test="${ar eq null}">
									<tr>
										<td colspan="9">시간표 리스트가 존재하지 않습니다.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</article>
				</div>
			</div>	
		</div>
	</article>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script>
		$(function() {
			//$().removeClass("selected");
			$(".selected").removeClass("selected")
			$("#secondmenu").addClass("selected");
		});
	</script>
</body>
</c:if>
<c:if test="${tvo ne null}">
	<c:redirect url="Controller">
	</c:redirect>
</c:if>
</html>