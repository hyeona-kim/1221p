<%@page import="ictedu.util.LmsBean"%>
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
	#courseList_top {
		background: black;
		color: white;
		height: 40px;
		line-height: 40px;
	}
	
	#searchCourse, #makeCourse{
		margin-top:10px;
		border-collapse: collapse;
		width: 100%;
	}
	#searchCourse td, #searchCourse th, #makeCourse td, #makeCourse th{
		border: 1px solid #ddd;
		height: 20px;
		padding-left: 10px;
	}
	#searchCourse th, #makeCourse th{background-color: #ddd;}
	
	#searchCourse caption, #makeCourse caption{
		text-indent: -9999px;
		height: 0;
	}
	#ttop{
		margin-top:10px;
		text-align: right;
	}
</style>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/center.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

</head>
<body>
	<article id="wrap">
		<jsp:include page="../../head.jsp"></jsp:include>
		<div id="center">
			<jsp:include page="./leftList.jsp"></jsp:include>
			<div class="right">
				<!--  여기서 표시될 테이블들 가지고오기 -->
					
					<div id="staffWrap">
						<div id="courseList_top">교육과정리스트</div>
						<div id="ttop">
							<button type="button" onclick="set()">과정등록</button>	
							<button type="button" onclick="set2()">과정타입수정</button>	
							<button type="button" onclick="set3()">강의실관리</button>	
						</div>
						<form>
							<table id="searchCourse">
							<caption>과정검색</caption>
								<thead>
									<tr>
										<th>검색</th>
										<td>
											<select id="numPerPage">
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
											<input type="text" id="searchValue"/>
											<button type="button" id="search_bt">검 색</button>
										</td>
									</tr>
								</thead>
							</table>
						</form>
						<table id="makeCourse">
							<thead>
								<tr>
									<th>번호</th>
									<th>과정명</th>
									<th>과정코드</th>
									<th>과정타입</th>
									<th>담당교수</th>
									<th>개강일</th>
									<th>종료일</th>
									<th>요일</th>
									<th>회차</th>
									<th>모집인원</th>
									<th>강의실</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${ar ne null }">
							<c:forEach var="cvo" items="${ar }" varStatus="vs">
							<c:set var="num" value="${page.totalRecord - (page.numPerPage*(page.nowPage-1))}"/>
								<tr>
									<td>${num-vs.index}</td>
									<td>${cvo.c_name }</td>
									<td>W1805300001</td>
									<td>${requestScope.ct_names[vs.index]} </td>
									<td>${requestScope.sf_names[vs.index]} </td>
									<td>${cvo.start_date }</td>
									<td>${cvo.end_date }</td>
									<td>월화수목금</td>
									<td>${cvo.c_round_num }</td>
									<td>${cvo.c_peo_num }</td>
									<td>${requestScope.r_names[vs.index]} </td>
									<td>
										<button type="button">교과목 등록/수정</button>
										<button type="button">학습안내서 등록/수정</button>
										<input type="hidden" name="c_idx" value="${cvo.c_idx }"/>
										<button type="button" onclick="editC('${cvo.c_idx}')">수정</button>
										<button type="button" id="c_del_btn" onclick="del(this.form)">삭제</button>
									</td>
								</tr>
							</c:forEach>
							</c:if>
							<c:if test="${ar eq null }">
								<tr>
									<td colspan="12">검색 결과가 없습니다</td>
								</tr>
							</c:if>
							</tbody>
							<tfoot>
						<tr>
							<td colspan="12">
								<ol class="page">
			<c:if test="${requestScope.page.startPage < requestScope.page.pagePerBlock }">
				<li class="disable">&lt;</li>
			</c:if>	
	
			<c:if test="${requestScope.page.startPage >= requestScope.page.pagePerBlock }">
				<li><a href="Controller?type=searchCourse&cPage=${page.startPage-page.pagePerBlock }&listSelect=${param.listSelect}">&lt;</a></li>
			</c:if>

			<c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="vs">
				<c:if test="${vs.index eq page.nowPage }">
					<li class="now">${vs.index }</li>
				</c:if>
				<c:if test="${vs.index ne page.nowPage }">
					<li><a href="Controller?type=searchCourse&cPage=${vs.index}&listSelect=${param.listSelect}">${vs.index}</a></li>
				</c:if>
			</c:forEach>
	
			<c:if test="${page.endPage < page.totalPage }">
				<li><a href="Controller?type=searchCourse&cPage= ${page.startPage + page.pagePerblock }&listSelect=${param.listSelect}">&gt;</a></li>
			</c:if>
			<c:if test="${page.endPage >= page.totalPage }">
				<li class="disable">&gt;</li>	
			</c:if>
                              </ol>
                          </td>
						</tr>
					</tfoot>
						</table>

					</div>
				</div>
			</div>
		</article>
		
		<form name="frm" action="Controller" method="post">
			<input type="hidden" name="type"  value=""/> 
			<input type="hidden" name="c_idx" value="" />
		</form>
		
		
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
		
		<div id="dialog4" hidden="" title="과정수정">
			<div>
				<jsp:include page="../table/Editbasics.jsp"></jsp:include>
			</div>
		</div>
		
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
		$(function() {
			let select ="";
			let select_year = "";
			let numPerPage = "";
			//$().removeClass("selected");
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
			$("#selectYear").on("change",function(){
				select_year = this.value;
			});
			$("#numPerPage").on("change",function(){
				numPerPage = this.value;
			});
			$("#search_bt").click(function(){
				let value = $("#searchValue").val();
				location.href= "Controller?type=searchCourse&select="+select+"&value="+value+"&year="+select_year+"&num="+numPerPage+"&listSelect=${param.listSelect}";
			});	
		
			<%
			Object obj = request.getAttribute("select_vo");
			if(obj != null){
				%>
			$("#dialog4").dialog("open");
			<%
			}
			%>
		});
		
		function set() {
		
            $("#dialog").dialog("open",{
            	width:500,
            	height:600
            });
        }
		function set2() {
            $("#dialog2").dialog("open");
        }
		function set3() {
            $("#dialog3").dialog("open");
        }
		function editC(c_idx) {
			document.frm.type.value ="viewCourse"; 
			document.frm.c_idx.value =c_idx; 
			document.frm.submit();
        }
		
		
		
		$( "#dialog" ).dialog({
            autoOpen: false,
            width:1200,
            modal: true,
            buttons: {
                "닫기": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
		
		$( "#dialog2" ).dialog({
            autoOpen: false,
            width: 1200,
            modal: true,
            buttons: {
                "닫기": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
		$( "#dialog3" ).dialog({
            autoOpen: false,
            width: 700,
            modal: true,
            buttons: {
                "닫기": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
		$( "#dialog4" ).dialog({
            autoOpen: false,
            width: 1200,
            modal: true,
            buttons: {
                "닫기": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
		
	
		function del(frm){
			frm.action = "Controller?type=delCourse";
			
			frm.submit();
		}
		
	</script>
</body>
</html>