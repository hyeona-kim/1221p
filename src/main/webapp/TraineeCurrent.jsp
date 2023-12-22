<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div#wrap{
		width: 100%;
		border-bottom:1px solid #EAEAEA;
		
	}


body{
	margin:0;
	padding:0;
	
	}

h2{
		border: 1px solid black;
		color: #FFFFFF;
		background-color: #212121;
		margin:0;
		border-radius:5px;
		padding: 0;
		height: 100px;
		line-height: 100px;
		padding-left: 10px;
		
	}
	
	tbody th{
	
	background-color: #D6F0FF;
	

}
	
	
	
	th,td{
		border-bottom : 1px solid #EAEAEA;
		padding:10px;
		
	}




table{
		width:100%;
		border: 1px solid #EAEAEA;
		margin-top: 50px;
	
		
	}
	
	tbody>tr>th{
		font-size: 20px;
		
		
		
	
	}
	
	thead>tr{
		font-size: 20px;
	
	}


	
	
</style>
</head>
<body>
	<div id ="wrap">
		<header>
			<h2>훈련생 현황</h2>
		</header>
		<article>
			<table id="table">
			<colgroup>
				<col width="100px" >
				<col width="130px" >
				<col width="110px" >
				<col width="120px" >
				<col width="120px" >
				<col width="130px" >
				<col width="50px" >
				<col width="60px" >
				<col width="*" >
				
			</colgroup>
			<thead>
				<tr>
					<th><label>검색</label></th>
					<td>
						<select>
							<option value="0">년도 선택</option>
							<option value="1">1900년</option>
						</select>
					</td>
					<th>
						<select>
							<option value="type1">과정타입</option>
							<option value="type2">과정명</option>
						</select>					
					</th>
					<td colspan="3" align="left">
						<input type="text"/>
						<input type="button" value="검색">
					</td>
				</tr>
			</thead>
				<tbody>
					<tr>
						<th>번호</th>
						<th>과정명</th>
						<th>담당교수</th>
						<th>개강일</th>
						<th>종료일</th>
						<th>요일</th>
						<th>회차</th>
						<th>모집인원</th>
						<th>관리</th>
					</tr>
					<tr>
						<td>번호</td>
						<td>과정명</td>
						<td>담당교수이름</td>
						<td>개강일</td>
						<td>종료일</td>
						<td>요일수</td>
						<td>회차수</td>
						<td>모집인원수</td>
						<td>
							<input type="button" value="과정별 훈련생 현황">
						</td>
					</tr>
				</tbody>
			</table>
		</article>
	</div>
</body>
</html>