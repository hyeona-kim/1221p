<%@page import="mybatis.vo.CourseVO"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
th, td {
	 	margin: 0;
        padding: 0;
        border: 1px solid black;
        text-align: center;
    }
    table {
		border-collapse: collapse;
		width: 100%;
		border-spacing: 0;
	}
	#top{
		margin: 10px;
	}
	#t2head, #t1td{
		background-color: skyblue;
	}
	#ttop{
		 float: right;
		 margin-bottom: 10px;
	}
</style>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/center.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

</head>
<body>
<% 
	Object obj = request.getAttribute("ar");
	CourseVO[] cvo = null;
	if (obj != null) {
		cvo = (CourseVO[])obj;
	};
%>

	<article id="wrap">
		<jsp:include page="../../head.jsp"></jsp:include>
		<div id="center">
		<jsp:include page="./leftList.jsp"></jsp:include>
			<div class="right">
				<!--  여기서 표시될 테이블들 가지고오기 -->
	<div id="ttop">
			<button type="button" onclick="set()">과정등록</button>	
			<button type="button" onclick="set2()">과정타입수정</button>	
			<button type="button" onclick="set3()">강의실관리</button>	
	</div>
	
	<div id="top">
		<table id="t1">
			<thead>
				<tr>
					<td id="t1td">검색</td>
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
							<option>훈련강사</option>
							<option>과정타입</option>
							<option>강의실</option>
						</select>
						<input type="text"/>
						<button type="button">검 색</button>
					</td>
				</tr>
			</thead>
		</table>
	</div>
	
	<div id="bottom">
		<table id="t2">
			<thead id="t2head">
				<tr>
					<td>과정명</td>
					<td>과정코드</td>
					<td>과정타입</td>
					<td>담당교수</td>
					<td>개강일</td>
					<td>종료일</td>
					<td>요일</td>
					<td>회차</td>
					<td>인원</td>
					<td>강의실</td>
					<td>관리</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cvo" items="${ar }" >
					<tr>
						<td>${cvo.c_idx }</td>
						<td>W1805300001</td>
						<td>${cvo.ct_idx} </td>
						<td>${cvo.t_idx }</td>
						<td>${cvo.start_date }</td>
						<td>${cvo.end_date }</td>
						<td>월화수목금</td>
						<td>${cvo.c_round_num }</td>
						<td>${cvo.c_peo_num }</td>
						<td>${cvo.r_idx }</td>
						<td>
							<button type="button">교과목 등록/수정</button>
							<button type="button">학습안내서 등록/수정</button>
							<button type="button">수정</button>
							<button type="button">삭제</button>
						</td>
					</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
			</div>
		</div>
	</article>
	<div id="dialog" hidden="" title="교육과정등록">
		<div>
			<jsp:include page="../../basics.jsp"></jsp:include>
		</div>
	</div>
	
	<div id="dialog2" hidden="" title="과정타입수정">
		<div>
				<jsp:include page="../table/typeInput.jsp"></jsp:include>
		</div>
	</div>
	
	<div id="dialog3" hidden="" title="강의실관리">
		<div>
				<jsp:include page="../table/classApply.jsp"></jsp:include>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
		$(function() {
			//$().removeClass("selected");
			$(".selected").removeClass("selected")
			$("#secondmenu").addClass("selected");
		
		});
		function set() {
            $("#dialog").dialog("open");
        }
		function set2() {
            $("#dialog2").dialog("open");
        }
		function set3() {
            $("#dialog3").dialog("open");
        }
		$( "#dialog" ).dialog({
            autoOpen: false,
            width: 400,
            modal: true,
            buttons: {
                "닫기": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
		
		$( "#dialog2" ).dialog({
            autoOpen: false,
            width: 400,
            modal: true,
            buttons: {
                "닫기": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
		$( "#dialog3" ).dialog({
            autoOpen: false,
            width: 400,
            modal: true,
            buttons: {
                "닫기": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
		
	</script>
</body>

</html>