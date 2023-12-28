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
												<option value="5">표시개수</option>
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
						<div id="courseLog_Table">
						
						</div>
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
	
		let select ="";
		let select_year = "";
		let numPerPage = "";
		let value ="";
		
		$(function() {
		
			$.ajax({
				url: "Controller?type=courseMain&listSelect=1",
				type: "post",
				data:"type="+encodeURIComponent("courseMain")+"&listSelect="+encodeURIComponent("1")+"&cPage="+encodeURIComponent(${param.cPage})
			}).done(function(result){
				$("#courseLog_Table").html(result);
			});
			
			
			//$().removeClass("selected");
			$(".selected").removeClass("selected");
			$(".l_select").removeClass("l_selected");
			$("#secondmenu").addClass("selected");
			$("#l_first").addClass("l_select");
			
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
				console.log("dd");
				$.ajax({
					url: "Controller",
					type: "post",
					data:"type="+encodeURIComponent("searchCourse")+"&select="+encodeURIComponent(select)+"&value="+encodeURIComponent(value)+"&year="+encodeURIComponent(select_year)
						+"&num="+encodeURIComponent(numPerPage)+"&listSelect="+encodeURIComponent(${param.listSelect})+"&cPage="+encodeURIComponent(${param.cPage})
				}).done(function(result){
					$("#courseLog_Table").html(result);
				});
			});
			$("#numPerPage").on("change",function(){
				numPerPage = this.value;
				$.ajax({
					url: "Controller",
					type: "post",
					data:"type="+encodeURIComponent("searchCourse")+"&select="+encodeURIComponent(select)+"&value="+encodeURIComponent(value)+"&year="+encodeURIComponent(select_year)
						+"&num="+encodeURIComponent(numPerPage)+"&listSelect="+encodeURIComponent(${param.listSelect})+"&cPage="+encodeURIComponent(${param.cPage})
				}).done(function(result){
					$("#courseLog_Table").html(result);
				});
			});
			$("#search_bt").click(function(){
				let value = $("#searchValue").val();
				
				$.ajax({
					url: "Controller",
					type: "post",
					data:"type="+encodeURIComponent("searchCourse")+"&select="+encodeURIComponent(select)+"&value="+encodeURIComponent(value)+"&year="+encodeURIComponent(select_year)
						+"&num="+encodeURIComponent(numPerPage)+"&listSelect="+encodeURIComponent(${param.listSelect})+"&cPage="+encodeURIComponent(${param.cPage})
				}).done(function(result){
					$("#courseLog_Table").html(result);
				});
			});	
			
			<%Object obj = request.getAttribute("select_vo");
			if(obj != null){%>
			$("#dialog4").dialog("open");
			<%}%>
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

		function del(c_idx){
			frm.action = "Controller?type=delCourse";
			document.frm.c_idx.value =c_idx; 
			
			document.frm.submit();
		}
		
		function paging(str) {
			console.log(str);
			$.ajax({
				url: "Controller",
				type: "post",
				data:"type="+encodeURIComponent("searchCourse")+"&select="+encodeURIComponent(select)+"&value="+encodeURIComponent(value)+"&year="+encodeURIComponent(select_year)
					+"&num="+encodeURIComponent(numPerPage)+"&listSelect="+encodeURIComponent(${param.listSelect})+"&cPage="+encodeURIComponent(str),
			}).done(function(result){
				$("#courseLog_Table").html(result);
			});
		}
	</script>
</body>
</html>