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
					<div id="staffList_top">과정별 교수계획서 및 학습 안내서</div>
					<form action="" method="post">
						<table id="searchTime">
						<caption>과정검색</caption>
							<thead>
								<tr>
									<th>검색</th>
									<td>
										<select>
											<%-- 이값에따라 page.numPerPage값을 수정 해 주어야한다 --%>
											<option>표시개수</option>
											<option>5</option>
											<option>10</option>
											<option>15</option>
										</select>
										<select id="selectYear">

										</select>
									</td>
									<td>
										<select id="searchType">
											<option value="1">훈련강사</option>
											<option value="2">과정타입</option>
											<option value="3">강의실</option>
										</select>
										<input type="text"/>
										<button type="button" id="search_bt">검 색</button>
									</td>
								</tr>
							</thead>
						</table>
					</form>
				<table id="makeTime">
				<caption>과정별 교수계획서 및 학습 안내서 리스트</caption>
					<thead>
						<tr>
							<th>번호</th>
							<th>과정명</th>
							<th>과정코드</th>
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
		
						<c:forEach var="vo2" items="${requestScope.ar }" varStatus="vs">
						<c:set var="num" value="${page.totalRecord - ((page.nowPage-1) * page.numPerPage) }"/>
						<tr>
							<td>${num+(vs.index)-2 }</td>
							<td>${vo2.c_name}</td>
							<td>${vo2.c_code}</td>
							<%-- 강사 코드에따른 강사를 가져오는 Bean을 만든다 --%>
							<td>${vo2.t_idx}</td>
							<td>${vo2.start_date }</td>
							<td>${vo2.end_date }</td>
							<td>${vo2.ti_idx}</td>
							<td>${vo2.c_round_num }</td>
							<td>${vo2.c_peo_num}</td>
							<td><button type="button">과정별 학습 안내서</button></td>
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
			let select ="";
			$(".selected").removeClass("selected")
			$("#secondmenu").addClass("selected");
			let now = new Date();	// 현재 날짜 및 시간
			let year = now.getFullYear();
			let str = "<option>년도선택</option>";
			for(let i=year+1; i>year-5; i--){
				str+= "<option value="+i+">"+i+"</option>";
			}
			$("#selectYear").html(str);
			
			$("#searchType").on("change",function(){
				select = this.value;
			});
			$("#search_bt").click(function() {
				
			});		
		});
		
	</script>
</body>
</c:if>
<c:if test="${tvo ne null}">
	<c:redirect url="Controller">
	</c:redirect>
</c:if>
</html>