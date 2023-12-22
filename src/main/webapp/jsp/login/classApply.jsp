<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	header{
		  background-color: #2e2e2e;
      color: #fff;
      width: 600px;
      height: 30px;
      margin: 0px auto;
      margin-bottom: 10px;
      font-size: 20px;
	}
	#wrap{
		width: 600px;
		height: 270px;
		padding: 0;
		margin: 0 auto;
		text-align: center;
	}

	 th, td {
	 	margin: 0;
        padding: 0;
        border: 1px solid black;
        text-align: center;
    }
 
    #ad, #sa {
		width: 600px;
		margin: 0 auto;
		padding-top: 10px; 
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
	 
	 button{
	 	border-radius: 3px;
	 }
	table {
		border-collapse: collapse;
		width: 100%;
		border-spacing: 0;
	}
	
    
</style>
</head>
<body>
	<header>강의실 등록/수정</header>
	<div id="wrap">
		<table id="t1">
			<thead>
				<tr>
					<td>순번</td>
					<td>강의실명</td>
					<td>강의구분</td>
					<td>사용여부</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1 </br>
						<button type="button">삭제1</button>
					</td>
					<td><input type="text" name="className"> </td>
					<td>
						<select name="roomSep">
								<option value="1">실습</option>
								<option value="2">이론</option>
								<option value="3">겸용</option>
						</select>
					</td>
					<td>
						<select name="use">
							<option value="1">사용</option>
							<option value="2">미사용</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>1 </br>
						<button type="button">삭제</button>
					</td>
					<td><input type="text" name="className"> </td>
					<td>
						<select>
								<option>실습</option>
								<option>이론</option>
								<option>겸용</option>
						</select>
					</td>
					<td>
						<select>
							<option>사용</option>
							<option>미사용</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>1 </br>
						<button type="button">삭제</button>
					</td>
					<td><input type="text" name="className"> </td>
					<td>
						<select>
								<option>실습</option>
								<option>이론</option>
								<option>겸용</option>
						</select>
					</td>
					<td>
						<select>
							<option>사용</option>
							<option>미사용</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>1 </br>
						<button type="button">삭제</button>
					</td>
					<td><input type="text" name="className"> </td>
					<td>
						<select>
								<option>실습</option>
								<option>이론</option>
								<option>겸용</option>
						</select>
					</td>
					<td>
						<select>
							<option>사용</option>
							<option>미사용</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>1 </br>
						<button type="button">삭제</button>
					</td>
					<td><input type="text" name="className"> </td>
					<td>
						<select>
								<option>실습</option>
								<option>이론</option>
								<option>겸용</option>
						</select>
					</td>
					<td>
						<select>
							<option>사용</option>
							<option>미사용</option>
						</select>
					</td>
				</tr>
			</tbody>
		</table>	
	</div>
	
	<div id="ad">
		<button type="button">강의실추가</button>
	</div>
	
	<div id="sa">
		<button type="button" >저장</button>
		<button type="button">닫기</button>
	</div>
</body>
</html>