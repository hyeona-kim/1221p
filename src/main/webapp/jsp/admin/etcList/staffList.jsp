<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/center.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<title>Insert title here</title>
<style>
	#staffWrap{
		width: 95%;
		padding: 10px;
		margin: 0px auto;
	}
	table#staffList{
		border-collapse: collapse;
		width: 98%;
		margin: 0px auto;
		padding: 0px;
	}
	table#staffList tbody{
		text-align: center;
	}
	table#staffList tbody th, table#staffList tbody td{
		border: 1px solid #e9e9e6;
		padding: 5px;
	}
	table#staffList tbody th {
		background-color: #f0f0ef;
	}
	table#staffList tbody td {
		font-size: 13px;
	}
	table#staffList caption{
		text-indent: -9999px;
		height: 0px;
	}
	table#staffList thead td{
		text-align: right;
		border: none;
		padding: 8px 0px;
	}
	div#staffList_top{
		background-color: black;
		padding: 5px;
		padding-left: 10px;
		color: white;
		font-weight: bold;
	}
	#staff_add_btn{
		background-color: #4cdbcf;
		border-radius: 3px;
		border: none;
		padding: 5px 7px;
		font-weight: bold;
		font-size: 14px;
		color: white; 
		text-decoration: none;
	}
	.staff_btn{
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
	.staff_edit_btn{ background-color: #1876c7;	}
	.staff_del_btn{ background-color: #cc1919; }
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
		width: 150px;
	}
	#addForm tfoot td{
		border: none;
	}
	#director{
		background-color: #e14b4b;
		border-radius: 3px;
		padding: 5px 7px;
		font-weight: bold;
		font-size: 14px;
		color: white; 
	}
</style>
</head>
<body>
	<article id="wrap">
		<jsp:include page="../../head.jsp"></jsp:include>
		<div id="center">
		<jsp:include page="leftList.jsp"></jsp:include>
			<div class="right">
				<!--  여기서 표시될 테이블들 가지고오기 -->
				<div id="staffWrap">
					<article>
						<%-- ========== 교직원현황 테이블 시작 ========== --%>
						<div id="staffList_top">교직원현황</div>
						<table id="staffList">
							<caption>교직원현황 테이블</caption>
							<thead>
								<%-- ===== 교직원 등록 버튼 ===== --%>
								<tr><td colspan="12"><button type="button" id="staff_add_btn">교직원 등록</button></td></tr>
							</thead>
							<tbody>
								<%-- ===== 출력할 교직원 항목 ===== --%>
								<tr>
									<th>번호</th>
									<th>성명</th>
									<th>교수코드</th>
									<th>직급</th>
									<th>아이디</th>
									<th>암호</th>
									<th>연락처</th>
									<th>입사일</th>
									<th>퇴사일</th>
									<th>사용권한</th>
									<th>책임자</th>
									<th colspan="2">관리</th>
								</tr>
								<%-- ===== 교직원 목록 출력 ===== --%>
								<sf:if test="${vo ne null}"> <%-- vo는 로그인 정보 --%>
									<sf:forEach items="${requestScope.ar}" varStatus="vs" var="vo">
										<tr>
											<td>${vs.index+1}</td>
											<td>${vo.sf_name}</td>
											<td>${vo.sf_code}</td>
											<td>${vo.sf_job}</td>
											<td>${vo.sf_id}</td>
											<td>${vo.sf_pwd}</td>
											<td>${vo.sf_phone}</td>
											<td>${vo.sf_hire_date}</td>
											<td>${vo.sf_fire_date}</td>
											<%-- [수정필요]
												 사용권한 번호를 이용해서
												 사용권한명을 가져와야함 --%>
											<sf:if test="${vo.rt_idx ne null}">
												<td>${vo.rt_idx}</td>
											</sf:if>
											<sf:if test="${vo.rt_idx eq null}">
												<td></td>
											</sf:if>
											<%-- 사용권한이 9인 사람만 총책임자 마크 표시 --%>
											<sf:if test="${vo.sf_mgr eq '9'}">
												<td><span id="director">총책임자</span></td>
											</sf:if>
											<sf:if test="${vo.sf_mgr ne '9'}">
												<td></td>
											</sf:if>
											<td colspan="2">
												<a href="" class="staff_edit_btn staff_btn">수정</a>
												<a href="" class="staff_del_btn staff_btn">삭제</a>
											</td>
										</tr>
									</sf:forEach>
								</sf:if>
							</tbody>
						</table>
						<%-- ========== 교직원현황 테이블 끝 ========== --%>
					</article>
				</div>
			</div>
		</div>
		<%-- ========== 교직원 등록 폼 시작 ========== --%>
		<div id="addForm">
			
		</div>
		<%-- ========== 교직원 등록 폼 끝 ========== --%>
	</article>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
		$(function(){
			//$().removeClass("selected");
			$(".selected").removeClass("selected")
			$("#etclist").addClass("selected");
			
			$("#staff_add_btn").bind("click", function(){
				$.ajax({
					url: "${pageContext.request.contextPath}/jsp/admin/etcList/add_ajax.jsp",
					type: "post"
				}).done(function(result){
					$("#addForm").html(result);
				});
				
				$("#addForm").dialog({
					title : '교직원등록',
					modal : true,
					width : 1000,
					height : 600
				});
			});
		});
			
		function addStaff() {
			// 유효성 검사 해야함
			
			document.forms[0].submit();
		};
	</script>
</body>
</html>