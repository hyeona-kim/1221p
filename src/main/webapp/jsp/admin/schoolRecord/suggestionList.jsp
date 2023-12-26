<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sg" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/center.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<style>
	div#sugList_top{
		background-color: black;
		padding: 5px;
		padding-left: 10px;
		color: white;
		font-weight: bold;
	}
	
	#sugWrap{
		width: 95%;
		padding: 10px;
		margin: 0px auto;
	}
	table#sugList{
		border-collapse: collapse;
		width: 98%;
		margin: 10px auto 0px auto;
		padding: 0px;
	}
	table#sugList thead{
		text-align: center;
	}
	table#sugList thead th, table#sugList thead td{
		border: 1px solid #e9e9e6;
		padding: 5px;
	}
	table#sugList thead th {
		background-color: #f0f0ef;
	}
	table#sugList thead td {
		font-size: 13px;
	}
	table#sugList caption{
		text-indent: -9999px;
		height: 0px;
	}
	table#sugList thead tr:last-child td {
		border: none;
	}
	#sug_add_btn{
		background-color: #4cdbcf;
		border-radius: 3px;
		border: none;
		padding: 5px 7px;
		font-weight: bold;
		font-size: 14px;
		color: white; 
		text-decoration: none;
	}
	table#sugList tbody{
		text-align: center;
	}
	table#sugList tbody th, table#sugList tbody td{
		border: 1px solid #e9e9e6;
		padding: 5px;
	}
	table#sugList tbody th {
		background-color: #f0f0ef;
	}
	table#sugList tbody td {
		font-size: 13px;
	}
	#addForm table caption{ text-indent: -9999px; }
	#addForm table {
		width: 950px;
		height: 450px;
		border-collapse: collapse;
		position: absolute;
		
	}
	#addForm table th, #addForm table td{
		border: 1px solid #e9e9e6;
		padding: 5px;
	}
	#addForm {
		text-align: center;
		margin: 0px auto;
		padding: 10px;
	}
	#addForm .left {
		text-align: left;
	}
	#addForm th{
		width: 20%;
	}
	#addForm .phone{
		width: 50px;
	}
	#addForm .input{
		width: 350px;
	}
	#addForm tfoot td{
		border: none;
	}
	#notice{
		background-color: #e14b4b;
		border-radius: 3px;
		padding: 5px 7px;
		font-weight: bold;
		font-size: 14px;
		color: white; 
	}
	.sug_btn{
		display: inline-block;
		background-color: #cc1919;
		border-radius: 3px;
		border: none;
		padding: 5px 7px;
		font-weight: bold;
		font-size: 14px;
		color: white; 
		text-decoration: none;
	}
	.sug_edit_btn{ background-color: #1876c7; }
	.sug_del_btn{ background-color: #cc1919; }
</style>

</head>
<sg:if test="${tvo eq null }">
<body>
	<article>
		<jsp:include page="../../head.jsp"></jsp:include>
		<div id="center">
			<jsp:include page="./leftList.jsp"></jsp:include>
			<div class="right">
				<!--  여기서 표시될 테이블들 가지고오기 -->
				<div id="sugWrap">
					<div id="sugList_top">고충 및 건의사항</div>
					<table id="sugList">
						<caption>고충 및 건의사항 검색 테이블</caption>
						<%-- ===== 검색하는 부분 ===== --%>
						<thead>
							<tr>
								<th>검색</th>
								<td>
									<select>
										<option>제목</option>
										<option>작성자</option>
									</select>
									<input type="text"/>
									<button type="button" id="search_btn">검색</button>
								</td>
								<th colspan="2">전체공지</th>
								<td colspan="2">
									<input type="checkbox"/>숨김
								</td>
							</tr>
							<tr><td colspan="6" align="right"><button type="button" id="sug_add_btn">글쓰기</button></td></tr>
						</thead>
						<tbody>
						<%-- ===== 출력할 건의사항 항목 ===== --%>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>첨부파일</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						<sg:if test="${vo ne null}"> <%-- vo는 로그인 정보 --%>
						<%-- ===== 로그인 정보가 있다면 반복문을 통해
									건의사항 목록 출력 ===== --%>
							<sg:forEach items="${requestScope.ar}" varStatus="vs" var="svo">
								<tr>
									<td>${vs.index+1}</td>
									<td align="left">
										<%-- 전체공지로 클릭되었다면(notice가 1일때)
											 공지 마크가 추가되어야함 --%>
										<sg:if test="${svo.notice eq '1'}">
											<span id="notice">공지</span>
										</sg:if>
										<a href="" id="sug_subject">${svo.sg_subject}</a>
									</td>										
									<td>${svo.sg_file}</td>
									<td>***</td>
									<td>${svo.sg_write_date}</td>
									<td>${svo.sg_hit}</td>
								</tr>
							</sg:forEach>
						</sg:if>
						</tbody>
					</table>
				</div>
				<%-- ===== 고충 및 건의사항 작성 폼 ===== --%>
				<div id="addForm">
				
				</div>
				<%-- ===== 고충 및 건의사항 작성 폼 ===== --%>
			</div>
		</div>
	</article>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
		$(function() {
			//$().removeClass("selected");
			$(".selected").removeClass("selected")
			$("#thirdmenu").addClass("selected");
			
			$("#sug_add_btn").bind("click", function(){
				$.ajax({
					url: "${pageContext.request.contextPath}/jsp/admin/schoolRecord/add_ajax.jsp",
					type: "post"
				}).done(function(result){
					$("#addForm").html(result);
				});
				
				$("#addForm").dialog({
					title : '고충 및 건의사항 작성',
					modal : true,
					width : 1000,
					height : 600
				});
			});
		});
		
		<%-- 건의사항 작성 폼에서 [등록] 버튼을 눌렀을때 수행 --%>
		function addSuggestion() {
			// 유효성 검사 해야함
			
			document.forms[0].submit();
		};
	</script>
</body>
</sg:if>
<sg:if test="${tvo ne null}">
	<sg:redirect url="Controller">
	</sg:redirect>
</sg:if>
</html>