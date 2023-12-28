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
	div#boList_top{
		background-color: black;
		padding: 5px;
		padding-left: 10px;
		color: white;
		font-weight: bold;
	}
	
	#boWrap{
		width: 95%;
		padding: 10px;
		margin: 0px auto;
	}
	table#boList{
		border-collapse: collapse;
		width: 98%;
		margin: 10px auto 0px auto;
		padding: 0px;
	}
	table#boList thead{
		text-align: center;
	}
	table#boList thead th, table#boList thead td{
		border: 1px solid #e9e9e6;
		padding: 5px;
	}
	table#boList thead th {
		background-color: #f0f0ef;
	}
	table#boList thead td {
		font-size: 13px;
	}
	table#boList caption{
		text-indent: -9999px;
		height: 0px;
	}
	table#boList thead tr:last-child td {
		border: none;
	}
	#bo_add_btn{
		background-color: #4cdbcf;
		border-radius: 3px;
		border: none;
		padding: 5px 7px;
		font-weight: bold;
		font-size: 14px;
		color: white; 
		text-decoration: none;
	}
	table#boList tbody{
		text-align: center;
	}
	table#boList tbody th, table#boList tbody td{
		border: 1px solid #e9e9e6;
		padding: 5px;
	}
	table#boList tbody th {
		background-color: #f0f0ef;
	}
	table#boList tbody td {
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
	#boContent table caption{ text-indent: -9999px; }
	#boContent table {
		width: 950px;
		height: 450px;
		border-collapse: collapse;
		position: absolute;
		
	}
	#boContent table th, #boContent table td{
		border: 1px solid #e9e9e6;
		padding: 5px;
	}
	#boContent {
		text-align: center;
		margin: 0px auto;
		padding: 10px;
	}
	#boContent .left {
		text-align: left;
	}
	#boContent th{
		width: 20%;
	}
	#boContent tfoot td{
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
	.bo_btn{
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
	.bo_list_btn{ background-color: #f0f0ef; }
	.bo_reply_btn{ background-color: #cc1919; }
	.bo_print_btn{ background-color: #1876c7; }
	.bo_edit_btn{ background-color: #1876c7; }
	.bo_del_btn{ background-color: #cc1919; }
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
				<div id="boWrap">
					<div id="boList_top">게시판</div>
					<table id="boList">
						<caption>게시판 테이블</caption>
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
							<tr><td colspan="6" align="right"><button type="button" id="bo_add_btn">글쓰기</button></td></tr>
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
							<c:forEach items="${ar }" varStatus="vs" var="bvo">
								<tr>
									<td>${vs.index+1}</td>
									<td align="left">
										<%-- 전체공지로 클릭되었다면(notice가 1일때)
											 공지 마크가 추가되어야함 --%>
										<c:if test="${bvo.bd_notice eq '1'}">
											<span id="notice">공지</span>
										</c:if>
										<a href="javascript:viewContent('${bvo.bd_subject}','${bvo.bd_write_date}'
																		,'${bvo.bd_hit}','${bvo.bd_content}')">
											${bvo.bd_subject}
										</a>
									</td>										
									<td>${bvo.bd_file}</td>
									<td>***</td>
									<td>${bvo.bd_write_date}</td>
									<td>${bvo.bd_hit}</td>
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
											<li><a href="Controller?type=boardList&cPage=${page.startPage-page.pagePerBlock }">&lt;</a></li>
										</c:if>
										<%-- ========== 이전버튼 만드는 부분 끝 ========== --%>
										
										<%-- ========== page 번호 만드는 부분 시작 ==========--%>
										<c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="vs">
											<c:if test="${vs.index eq page.nowPage }">
												<li class="now">${vs.index }</li>
											</c:if>
											<c:if test="${vs.index ne page.nowPage }">
												<li><a href="Controller?type=boardList&cPage=${vs.index}">${vs.index}</a></li>
											</c:if>
										</c:forEach>
										<%-- ========== page 번호 만드는 부분 끝 ==========--%>
										
										<%-- ========== 다음버튼 만드는 부분 시작 ========== --%>
										<%-- endPage가 마지막 끝나는 page보다 작을 경우
											 다음page로 가는 버튼 활성화 후 생성 --%>
										<c:if test="${page.endPage < page.totalPage }">
											<li><a href="Controller?type=board&cPage= ${page.startPage + page.pagePerblock }">&gt;</a></li>
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
				<%-- ===== 게시글 작성 폼 시작 ===== --%>
				<div id="addForm">
				
				</div>
				<%-- ===== 게시글 작성 폼 끝 ===== --%>
				
				<%-- ===== 게시글 내용 시작 ===== --%>
				<div id="boContent">
				
				</div>
				<%-- ===== 게시글 내용 끝 ===== --%>
				
				<%-- ===== 게시글답변 작성 폼 시작 ===== --%>
				<div id="replyForm">
				
				</div>
				<%-- ===== 게시글 답변 작성 폼 끝 ===== --%>
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
			
			$("#bo_add_btn").bind("click", function(){
				$.ajax({
					url: "${pageContext.request.contextPath}/jsp/admin/schoolRecord/addBoard_ajax.jsp",
					type: "post"
				}).done(function(result){
					$("#addForm").html(result);
				});
				
				$("#addForm").dialog({
					title : '게시글 작성',
					modal : true,
					width : 1000,
					height : 600
				});
			});
			
		});
		
		<%-- 게시글 작성 폼에서 [등록] 버튼을 눌렀을때 수행 --%>
		function addBoard() {
			// 유효성 검사 해야함
			
			document.forms[0].submit();
		};
		
		<%-- 글의 제목을 클릭했을 때 내용 보기 --%>
		function viewContent(subject, date, hit, content) {
			$.ajax({
				url: "${pageContext.request.contextPath}/jsp/admin/schoolRecord/boardView_ajax.jsp",
				type: "post",
				data: "subject="+encodeURIComponent(subject)+
					  "&date="+encodeURIComponent(date)+
					  "&hit="+encodeURIComponent(hit)+
					  "&content="+encodeURIComponent(content)
			}).done(function(result){
				$("#boContent").html(result);
			});
			
			$("#boContent").dialog({
				title : '고충 및 건의사항',
				modal : true,
				width : 1000,
				height : 600
			});
		};
		
		<%-- 건의사항 보기화면에서 [답변]을 눌렀을때 수행 --%>
		function reply(subject, content) {
			$.ajax({
				url: "${pageContext.request.contextPath}/jsp/admin/schoolRecord/boardReply_ajax.jsp",
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
	</script>
</body>
</c:if>
<c:if test="${tvo ne null}">
	<sg:redirect url="Controller">
	</sg:redirect>
</c:if>
</html>