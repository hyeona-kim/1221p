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
	#b1{
		 float: right;
		 padding-top: 10px;
		 margin-bottom: 10px;
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
					<div id="staffList_top">훈련생확인서류등록</div>
					<div id="b1">
						<input type="button" value="확인서류등록" onclick="javascript:location.href='Controller?type=uploadwrite'"/>
					</div>
				<table id="makeTime">
				<caption>훈련생확인서류등록 리스트</caption>
					<thead>
						<tr>
							<th>순번</th>
							<th>서류명</th>
							<th>첨부파일</th>
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
		
						<c:forEach var="vo3" items="${requestScope.ar }" varStatus="vs">
				<c:set var="num" value="${page.totalRecord - ((page.nowPage-1) * page.numPerPage) }"/>
					<tr>
						<td>${num+(vs.index)-2 }</td>
						<td><%-- <a href="Contoller?type=view&tn_idx=${vo3.tn_idx }&cPage=${page.nowPage }">
							${vo3.subject } --%> ${vo3.subject }</a></td>
						<td>${vo3.file_name }</td>
						<td>
						<input type="button" value="수정"
							onclick="edit('${vo3.tn_idx}')"/>
						<input type="button" value="삭제">
						<input type="button" value="확인서류보기">
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
	</div>
	<form action="Controller" method="post" name="frm">
		<input type="hidden" name="type" value=""/>
		<input type="hidden" name="tn_idx" value=""/>
		
		<input type="hidden" name="cPage" value="${param.cPage }"/>
	</form>
	
</article>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script>
		$(function() {
			//$().removeClass("selected");
			$(".selected").removeClass("selected")
			$("#secondmenu").addClass("selected");
		});

		function edit(tn_idx){
			console.log(tn_idx);
			document.frm.type.value="trainuploadedit";
			document.frm.tn_idx.value=tn_idx;
			console.log(document.frm.type.value);
			document.frm.submit();
	
		}

	</script>
</body>
</c:if>
<c:if test="${tvo ne null}">
	<c:redirect url="Controller">
	</c:redirect>
</c:if>
</html>