<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/header.css" />
<link rel="stylesheet" type="text/css" href="../../css/center.css" />
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

</style>

</head>
<c:if test="${tvo eq null }">
<body>
	<article id="wrap">
		<jsp:include page="../../head.jsp"></jsp:include>
		<div id="center">
			<div class="left">
				<ul id="list2">
					<li class="title"><a href="">&nbsp;&nbsp;&nbsp;과정등록</a></li>
					<li class="content"><a href="teacher_list.jsp">교직원현황</a></li>
					<li class="content"><a href="">교육과정현황</a></li>
					<li class="content"><a href="">교수계획서 / 학습안내서</a></li>
					<li class="content"><a href="">시간표만들기(HRD)</a></li>
					<li class="title"><a href="">&nbsp;&nbsp;&nbsp;동영상 메뉴얼 보기</a></li>
				</ul>
			</div>
			<div class="right">
				<!--  여기서 표시될 테이블들 가지고오기 -->
				<table>
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
							<td colspan="6">
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
		
			<c:forEach var="vo" items="${ser }" varStatus="vs">
			<c:set var="num" value="${page.totalRecord - ((page.nowPage-1) * page.numPerPage) }"/>
			
				<tr>
					<td>${num+(vs.index)+1 }</td>
					<td>${vo.c_name }</td>
					<td>과정코드</td>
					<td>담당교수</td>
					<td>${vo.start_date }</td>
					<td>${vo.end_date }</td>
					<td>요일</td>
					<td>${vo.c_round_num }</td>
					<td>관리</td>
					
					
				</tr>
			
			</c:forEach>
			</tbody>
				</table>
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