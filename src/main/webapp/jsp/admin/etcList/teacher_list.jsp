<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/header.css" />
<link rel="stylesheet" type="text/css" href="../../css/center.css" />
<title>Insert title here</title>
<style>
	#wrap2{
		width: 100%;
		padding: 0px;
		margin: 0px auto;
	}
	table#list{
		border-collapse: collapse;
		width: 950px;
		margin: 0px auto;
		padding: 0px;
		text-align: center;
	}
	table#list tbody th, table#list tbody td{
		border: 1px solid red;
		padding: 4px;
	}
	table#list tbody th {
		background-color: #dfdfdf;
	}
	table#list caption{
		text-indent: -9999px;
		height: 0px;
	}
	table#list thead td{
		text-align: right;
		border: none;
		padding: 8px 0px;
	}
	div#list_top{
		background-color: black;
		padding: 5px;
		padding-left: 10px;
		color: white;
		font-weight: bold;
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
				<div id="wrap2">
					<article>
						<%-- ========== 교직원현황 테이블 시작 ========== --%>
						<div id="list_top">교직원현황</div>
						<table id="list">
							<colgroup>
								<col width="">
							</colgroup>
							<caption>교직원현황 테이블</caption>
							<thead>
								<%-- ===== 교직원 등록 버튼 ===== --%>
								<tr><td colspan="12"><button id="reg_tea_btn">교직원 등록</button></td></tr>
							</thead>
							<tbody>
								<tr>
								<%-- ===== 출력할 교직원 항목 ===== --%>
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
								<tr>
									<td>김헤어</td>
									<td>3001</td>
									<td>헤어전문강사</td>
									<td>강사</td>
									<td>1234</td>
									<td>010-1234-1234</td>
									<td>2018-04-02</td>
									<td></td>
									<td>1</td>
									<td></td>
									<td colspan="2">
										<button id="list_edit_btn">수정</button>
										<button id="list_del_btn">삭제</button>
									</td>
								</tr>
								<tr>
									<td>김상담</td>
									<td>3002</td>
									<td>사원</td>
									<td>김상담</td>
									<td>1234</td>
									<td>010-5678-5678</td>
									<td>2018-04-02</td>
									<td></td>
									<td>2</td>
									<td></td>
									<td colspan="2">
										<button id="list_edit_btn">수정</button>
										<button id="list_del_btn">삭제</button>
									</td>
								</tr>
							</tbody>
						</table>
						<%-- ========== 교직원현황 테이블 끝 ========== --%>
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
			$("#etclist").addClass("selected");
		});
	</script>
	
</body>
</html>