<%@page import="mybatis.vo.StaffVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/center.css" />
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
		padding: 3px;
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
	.staff_del_btn{ background-color: #cc1919;	}
</style>
</head>
<body>
<% 
	Object obj = request.getAttribute("ar");
	StaffVO[] svo = null;
	if (obj != null) {
		svo = (StaffVO[])obj;
	};
%>
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
							<colgroup>
								<col width="">
							</colgroup>
							<caption>교직원현황 테이블</caption>
							<thead>
								<%-- ===== 교직원 등록 버튼 ===== --%>
								<tr><td colspan="12"><a href="" id="staff_add_btn">교직원 등록</a></td></tr>
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
										<a href="" class="staff_edit_btn staff_btn">수정</a>
										<a href="" class="staff_del_btn staff_btn">삭제</a>
									</td>
								</tr>
								<%if(svo!= null){
									for(int i=0; i<svo.length; i++) {
										StaffVO vo = svo[i];
								%>
								<tr>
									<td><%=vo.getSf_name()%></td>
									<td><%=vo.getSf_code()%></td>
									<td><%=vo.getSf_job()%></td>
									<td><%=vo.getSf_id()%></td>
									<td><%=vo.getSf_pwd()%></td>
									<td><%=vo.getSf_phone()%></td>
									<td><%=vo.getSf_hire_date()%></td>
									<td><%=vo.getSf_fire_date()%></td>
									<%-- 이 부분은 수정해야함
										 사용권한 번호를 이용해서
										 사용권한명을 가져와야함 --%>
									<td><%=vo.getRt_idx()%></td>
									<%-- 이것도 if문을 사용해서 총책임자만 표시하기 --%>
									<td><%=vo.getSf_mgr()%></td>
									<td colspan="2">
										<a href="" class="staff_edit_btn staff_btn">수정</a>
										<a href="" class="staff_del_btn staff_btn">삭제</a>
									</td>
								</tr>
								<%
										} // for의 끝
									}
								%>
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