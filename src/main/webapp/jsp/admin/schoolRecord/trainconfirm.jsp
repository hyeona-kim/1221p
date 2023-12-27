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
table tfoot ol.page {
	    list-style:none;
	}
	
	table tfoot ol.page li {
	    float:left;
	    margin-right:8px;
	}
	
	table tfoot ol.page li a {
	    display:block;
	    padding:3px 7px;
	    border:1px solid #00B3DC;
	    color:#2f313e;
	    font-weight:bold;
	    text-decoration: none;
	}
	
	table tfoot ol.page li a:hover {
	    background:#00B3DC;
	    color:white;
	    font-weight:bold;
	}
	.disable {
	    padding:3px 7px;
	    border:1px solid silver;
	    color:silver;
	}
	
	.now {
	   padding:3px 7px;
	    border:1px solid #ff4aa5;
	    background:#ff4aa5;
	    color:white;
	    font-weight:bold;
	}
	#staffWrap{
		width: 95%;
		margin: auto;
		margin-top: 20px;
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
					<div id="staffList_top">훈련생확인서류</div>
					<table id="searchTime">
						<caption>훈련생확인서류검색</caption>
							<thead>
								<tr>
									<th>검색</th>
									<td>
										<select>
											<option>년도선택</option>
											<c:forEach begin="2000" end="2024" var="year">
				     							  <option value="${year}">${year}</option>
				    						</c:forEach>
										</select>
									</td>
									<td>
										<select>
												<option>과정타입</option>
												<option>담당교수</option>
												
										</select>
										<input type="text"/>
										<button type="button">검 색</button>
									</td>
								</tr>
							</thead>
						</table>
				<table id="makeTime">
				<caption>훈련생확인서류 리스트</caption>
					<thead>
						<tr>
							<th>번호</th>
							<th>과정명</th>
							<th>담당교수</th>
							<th>개강일</th>
							<th>종료일</th>
							<th>요일</th>
							<th>회차</th>
							<th>모집인원</th>
							<th>관리</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="10">
								<ol class="page">
			<c:if test="${requestScope.page.startPage < requestScope.page.pagePerBlock }">
		<li class="disable">&lt;</li>
	</c:if>	
	
	<c:if test="${requestScope.page.startPage >= requestScope.page.pagePerBlock }">
	<li><a href="Controller?type=list&cPage=${page.startPage-page.pagePerBlock }">&lt;</a></li>
	</c:if>

	<c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="vs">
		<c:if test="${vs.index eq page.nowPage }">
			<li class="now">${vs.index }</li>
		</c:if>
		<c:if test="${vs.index ne page.nowPage }">
			<li><a href="Controller?type=list&cPage=${vs.index}">${vs.index}</a></li>
		</c:if>
	</c:forEach>
	
	<c:if test="${page.endPage < page.totalPage }">
		<li><a href="Controller?type=list&cPage= ${page.startPage + page.pagePerblock }">&gt;</a></li>
	</c:if>
	<c:if test="${page.endPage >= page.totalPage }">
		<li class="disable">&gt;</li>	
	</c:if>
                              </ol>
                          </td>
						</tr>
					</tfoot>
					<tbody>
		
						<c:forEach var="vo4" items="${requestScope.ar }" varStatus="vs">
				<c:set var="num" value="${page.totalRecord - ((page.nowPage-1) * page.numPerPage) }"/>
					<tr>
						<td>${vs.index+1}</td>
						<td>${vo4.c_name}</td>
						<%-- 강사 코드에따른 강사를 가져오는 Bean을 만든다 --%>
						<td>${vo4.t_idx}</td>
						<td>${vo4.start_date }</td>
						<td>${vo4.end_date }</td>
						<td>${vo4.ti_idx}</td>
						<td>${vo4.c_round_num }</td>
						<td>${vo4.c_peo_num}</td>
						<td>
						<input type="button" value="확인서류설정" data-toggle="modal" data-target="#confirm">
						<input type="button" value="확인서류보기">
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
	</div>
</article>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script>
		$(function() {
			//$().removeClass("selected");
			$(".selected").removeClass("selected")
			$("#thirdmenu").addClass("selected");
		});
	</script>
</body>
</c:if>
<c:if test="${tvo ne null}">
	<c:redirect url="Controller">
	</c:redirect>
</c:if>
</html>