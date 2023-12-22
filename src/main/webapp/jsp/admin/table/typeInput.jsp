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
	table{
		border-collapse: collapse;
		width: 600px;
		margin: auto;
	}
	table td{
		border: 1px solid black;
		padding: 4px;
		height: 50px;
		text-align: center;
	}
	.num{
		background-color: #cdcdcd;
	}
	#btn{
		display: inline-block;
		width: 100%;
		text-align: center;
		margin: 20px auto;
	}
	#btn>form>input{
		height: 40px;	
		border: none;
		width: 60px;
		font-size: 16px;
		color: #fff;
		border-radius: 3px;
	}
	#btn>form>input:first-child{
		background-color: #99ccff;
	}
</style>
</head>
<body>
	<header>과정타입 등록/수정</header>
	<div id="wrap">
		<article>
			<table id="t1">
				<colgroup>
					<col width="80px"/>
					<col width="*/2"/>
					<col width="80px"/>
					<col width="*/2"/>
				</colgroup>
				<tbody>
					<tr>
						<td class="num">1</td>
						<td><input type="text" name="type1"/></td>
						<td class="num">색상</td>
						<td><input type="text" name="color1"/></td>
					</tr>
					<tr>
						<td class="num">2</td>
						<td><input type="text" name="type2"/></td>
						<td class="num">색상</td>
						<td><input type="text" name="color2"/></td>
					</tr>
					<tr>
						<td class="num">3</td>
						<td><input type="text" name="type3"/></td>
						<td class="num">색상</td>
						<td><input type="text" name="color3"/></td>
					</tr>
					<tr>
						<td class="num">4</td>
						<td><input type="text" name="type4"/></td>
						<td class="num">색상</td>
						<td><input type="text" name="color4"/></td>
					</tr>
					<tr>
						<td class="num">5</td>
						<td><input type="text" name="type5"/></td>
						<td class="num">색상</td>
						<td><input type="text" name="color5"/></td>
					</tr>
					<tr>
						<td class="num">6</td>
						<td><input type="text" name="type6"/></td>
						<td class="num">색상</td>
						<td><input type="text" name="color6"/></td>
					</tr>
					<tr>
						<td class="num">7</td>
						<td><input type="text" name="type7"/></td>
						<td class="num">색상</td>
						<td><input type="text" name="color7"/></td>
					</tr>
				</tbody>
			</table>
		</article>
	</div>
	<div id="btn">
		<form>
			<input type="button" value="저장" onclick="save()"/>
			<input type="button" value="취소" onclick="cancel()"/>
		</form>
	</div>
	
	<script>
		function save() {
			
		}
		
		function cancel() {
			
		}
	</script>
</body>
</html>