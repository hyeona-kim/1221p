<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#header{
		  background-color: #2e2e2e;
      color: #fff;
      width: 600px;
      height: 30px;
      margin: 0px auto;
      margin-bottom: 10px;
      font-size: 20px;
	}
	#wrap1{
		width: 600px;
		padding: 0;
		margin: 0 auto;
		text-align: center;
	}

	#tr {
	 	margin: 0;
        padding: 0;
        border: 1px solid black;
        text-align: center;
    }
 
    #ad, #sa {
		width: 100%;
		margin: 0 auto;
		padding-top: 100px; 
	}
	
	#ad{
		text-align: right;
		margin-bottom: 10px;
	}
	#ad>button{
		background-color: #99ccff;
		border: none;
		color: white;
	}
	#sa{
		text-align: center;
	}
	 #sa>button:first-child{
	 	background-color: #99ccff;
		border: none;
		color: white;
	 }
	 #sa>button:nth-child(2){
		border: none;
		color: white;
	 }
	 
	 
	#t1 {
		border-collapse: collapse;
		width: 100%;
		border-spacing: 0;
	}
	
    
</style>
</head>
<body>
	<header id="header">강의실 등록/수정</header>
	<div id="wrap1">
		<form action="Controller" method="post" name="rm">
         <input type="hidden" name="type"  value="addRoom"/>
		<table id="t1">
			<thead>
				<tr id="tr">
					<td>순번</td>
					<td>강의실명</td>
					<td>강의구분</td>
					<td>사용여부</td>
				</tr>
			</thead>
			<tbody>
			<c:if test="${r_ar ne null}">
			<c:forEach var="rvo" items="${r_ar }">
				<tr id="tr">
					<td>${rvo.r_idx }</br>
						<button type="button">삭제</button>
					</td>
					<td><input type="text" name="className" value="${rvo.r_name }"> </td>
					<td>
						<select name="roomSep">
						<c:if test="${rvo.r_sep  eq 1}">
								<option value="1" selected>실습</option>
								<option value="2">이론</option>
								<option value="3">겸용</option>
						</c:if>
						<c:if test="${rvo.r_sep  eq 2}">
								<option value="1">실습</option>
								<option value="2" selected>이론</option>
								<option value="3">겸용</option>
						</c:if>
						<c:if test="${rvo.r_sep  eq 3}">
								<option value="1">실습</option>
								<option value="2">이론</option>
								<option value="3" selected>겸용</option>
						</c:if>
						</select>
					</td>
					<td>
						<select name="use">
						<c:if test="${rvo.r_status eq 1 }">
							<option value="1" selected>사용</option>
							<option value="0">미사용</option>
						</c:if>
						<c:if test="${rvo.r_status eq 0 }">
							<option value="1" >사용</option>
							<option value="0" selected>미사용</option>
						</c:if>
						</select>
					</td>
				</tr>
			</c:forEach>
			</c:if>
			</tbody>
		</table>	
		</form>
	</div>
	
	<div id="ad">
		<input type="button" value="강의실추가"/>
	</div>
	
	<div id="sa">
			<input type="button"  id="sav"  value="저장"/>
			<input type="button"  id="cl" value="닫기"/>
	</div>
   <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	
	<script>
		  $(function(){
		         $("#sav").click(function(){
	
		            document.rm.submit();
		         });
		   });
		  $(function() {
			$("#cl").click(function() {
				location.href="Controller?type=course&listSelect=1"
			});
		});
	</script>
</body>
</html>