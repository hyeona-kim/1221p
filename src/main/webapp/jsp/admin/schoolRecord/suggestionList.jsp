<%@page import="ictedu.util.Paging"%>
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
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
	.now {
	   padding:3px 7px;
	    border:1px solid #ff4aa5;
	    background:#ff4aa5;
	    color:white;
	    font-weight:bold;
	}
	.disable {
	    padding:3px 7px;
	    border:1px solid silver;
	    color:silver;
	}
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
	#addForm .input{
		width: 350px;
	}
	#addForm tfoot td{
		border: none;
	}
	#sugContent table caption{ text-indent: -9999px; }
	#sugContent table {
		width: 950px;
		height: 450px;
		border-collapse: collapse;
		position: absolute;
		
	}
	#sugContent table th, #sugContent table td{
		border: 1px solid #e9e9e6;
		padding: 5px;
	}
	#sugContent {
		text-align: center;
		margin: 0px auto;
		padding: 10px;
	}
	#sugContent .left {
		text-align: left;
	}
	#sugContent th{
		width: 20%;
	}
	#sugContent tfoot td{
		border: none;
	}
	#replyForm table caption{ text-indent: -9999px; }
	#replyForm table {
		width: 950px;
		height: 450px;
		border-collapse: collapse;
		position: absolute;
		
	}
	#replyForm table th, #replyForm table td{
		border: 1px solid #e9e9e6;
		padding: 5px;
	}
	#replyForm {
		text-align: center;
		margin: 0px auto;
		padding: 10px;
	}
	#replyForm .left {
		text-align: left;
	}
	#replyForm th{
		width: 20%;
	}
	#replyForm tfoot td{
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
	.sug_list_btn{ background-color: #f0f0ef; }
	.sug_reply_btn{ background-color: #cc1919; }
	.sug_print_btn{ background-color: #1876c7; }
	.sug_edit_btn{ background-color: #1876c7; }
	.sug_del_btn{ background-color: #cc1919; }
</style>

</head>
<c:if test="${tvo eq null }">
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
									<select id="search_tag">
										<option value="subject">제목</option>
										<option>작성자</option>
									</select>
									<input type="text" id="search_value" name="search_value"/>
									<button type="button" id="search_btn" onclick="searchSugg()">검색</button>
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
						<c:if test="${vo ne null}"> <%-- vo는 로그인 정보 --%>
						<%-- ===== 로그인 정보가 있다면 반복문을 통해
									건의사항 목록 출력 ===== --%>
							<c:forEach items="${requestScope.ar}" varStatus="vs" var="svo">
								<tr>
									<td>${vs.index+1}</td>
									<td align="left">
										<%-- 전체공지로 클릭되었다면(notice가 1일때)
											 공지 마크가 추가되어야함 --%>
										<c:if test="${svo.notice eq '1'}">
											<span id="notice">공지</span>
										</c:if>
										<a href="javascript:viewContent('${svo.sg_subject}','${svo.sg_write_date}'
																		,'${svo.sg_hit}','${svo.sg_content}')">
											${svo.sg_subject}
										</a>
									</td>										
									<td>${svo.sg_file}</td>
									<td>***</td>
									<td>${svo.sg_write_date}</td>
									<td>${svo.sg_hit}</td>
								</tr>
							</c:forEach>
						</c:if>
						</tbody>
						<%-- 화면 하단 page 번호 출력하는 부분 --%>
						<tfoot>
							<tr>
								<td colspan="6">
									<ol class="page">
										<%-- ========== 이전버튼 만드는 부분 시작 ========== --%>
										<%-- startPage가 5보다 작을 경우
											 이전page로 돌아가는 버튼 비활성화 후 생성 --%>
										<c:if test="${requestScope.page.startPage < requestScope.page.pagePerBlock }">
											<li class="disable">&lt;</li>
										</c:if>	
										<%-- startPage가 5보다 같거나 클 경우
											 이전page로 돌아가는 버튼 활성화 후 생성 --%>
										<c:if test="${requestScope.page.startPage >= requestScope.page.pagePerBlock }">
											<li><a href="Controller?type=suggestionList&cPage=${page.startPage-page.pagePerBlock }">&lt;</a></li>
										</c:if>
										<%-- ========== 이전버튼 만드는 부분 끝 ========== --%>
										
										<%-- ========== page 번호 만드는 부분 시작 ==========--%>
										<c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="vs">
											<c:if test="${vs.index eq page.nowPage }">
												<li class="now">${vs.index }</li>
											</c:if>
											<c:if test="${vs.index ne page.nowPage }">
												<li><a href="Controller?type=suggestionList&cPage=${vs.index}">${vs.index}</a></li>
											</c:if>
										</c:forEach>
										<%-- ========== page 번호 만드는 부분 끝 ==========--%>
										
										<%-- ========== 다음버튼 만드는 부분 시작 ========== --%>
										<%-- endPage가 마지막 끝나는 page보다 작을 경우
											 다음page로 가는 버튼 활성화 후 생성 --%>
										<c:if test="${page.endPage < page.totalPage }">
											<li><a href="Controller?type=suggestionList&cPage= ${page.startPage + page.pagePerblock }">&gt;</a></li>
										</c:if>
										<%-- endPage가 마지막 끝나는 page보다 크거나 같을 경우
											 다음page로 가는 버튼 비활성화 후 생성 --%>
										<c:if test="${page.endPage >= page.totalPage }">
											<li class="disable">&gt;</li>	
										</c:if>
										<%-- ========== 다음버튼 만드는 부분 끝 ========== --%>
									</ol>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<%-- ===== 고충 및 건의사항 작성 폼 시작 ===== --%>
				<div id="addForm">
				
				</div>
				<%-- ===== 고충 및 건의사항 작성 폼 끝 ===== --%>
				
				<%-- ===== 건의사항 내용 시작 ===== --%>
				<div id="sugContent">
				
				</div>
				<%-- ===== 건의사항 내용 끝 ===== --%>
				
				<%-- ===== 건의사항 답변 작성 폼 시작 ===== --%>
				<div id="replyForm">
				
				</div>
				<%-- ===== 건의사항 답변 작성 폼 끝 ===== --%>
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
		
		<%-- 글의 제목을 클릭했을 때 내용 보기 --%>
		function viewContent(subject, date, hit, content) {
			$.ajax({
				url: "${pageContext.request.contextPath}/jsp/admin/schoolRecord/view_ajax.jsp",
				type: "post",
				data: "subject="+encodeURIComponent(subject)+
					  "&date="+encodeURIComponent(date)+
					  "&hit="+encodeURIComponent(hit)+
					  "&content="+encodeURIComponent(content)
			}).done(function(result){
				$("#sugContent").html(result);
			});
			
			$("#sugContent").dialog({
				title : '고충 및 건의사항',
				modal : true,
				width : 1000,
				height : 600
			});
		};
		
		<%-- 건의사항 보기화면에서 [답변]을 눌렀을때 수행 --%>
		function reply(subject, content) {
			$.ajax({
				url: "${pageContext.request.contextPath}/jsp/admin/schoolRecord/reply_ajax.jsp",
				type: "post",
				data: "subject="+subject+
					  "&content="+content+
					  "&writer=${vo.sf_name}"
			}).done(function(result){
				$("#replyForm").html(result);
			});
			
			$("#replyForm").dialog({
				title : '고충 및 건의사항 답변 작성',
				modal : true,
				width : 1000,
				height : 600
			});
		};
		
		<%-- 답변 작성에서 [등록]을 눌렀을때 수행 --%>
		function addReply(frm) {
			frm.submit();
		};
		
		<%-- 건의사항 목록에서 [검색]을 눌렀을때 수행 --%>
		function searchSugg() {
			let tag = document.getElementById("search_tag").value;
			let value = document.getElementById("search_value").value;
			location.href = "Controller?type=searchSugg&tag="+encodeURIComponent(tag)+"&value="+encodeURIComponent(value);
		};
		
	</script>
</body>
</c:if>
<c:if test="${tvo ne null}">
	<c:redirect url="Controller">
	</c:redirect>
</c:if>
</html>