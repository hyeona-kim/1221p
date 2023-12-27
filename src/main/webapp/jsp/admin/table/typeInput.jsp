<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#hd{
		background-color: #2e2e2e;
		color: #fff;
		width: 600px;
		height: 30px;
		margin: 0px auto;
		margin-bottom: 10px;
		font-size: 20px;
	}
	#t1{
		border-collapse: collapse;
		width: 600px;
		margin: auto;
	}
	#t1 td{
		border: 1px solid black;
		padding: 4px;
		height: 50px;
		text-align: center;
	}
	.num, .color{
		background-color: #D6F0FF;
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
	#btn>form>input:first-child:hover{
		background-color: #88bbee;
	}
	#btn>form>input:last-child{
		background-color: #c0c0c0;
	}
	#btn>form>input:last-child:hover{
		background-color: #d1d1d1;
	}
</style>
</head>
<body>
	<header id="hd">과정타입 등록/수정</header>
	<div id="wrap">
		<article>
			<form action="Controller?type=addCourseType" method="post">
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
						<td>
							<input type="text" id="type1"  value=""/>
						</td>
						<td class="color">색상</td>
						<td>
							<input type="text" name ="text1"  value=""/>
							<input type="color" id="color1"  value=""/>
						</td>
					</tr>
					<tr>
						<td class="num">2</td>
						<td><input type="text" id="type2"  value=""/></td>
						<td class="color">색상</td>
						<td>
							<input type="text" name ="text2"  value="$"/>
							<input type="color" id="color2"  value=""/>
						</td>
					</tr>
					<tr>
						<td class="num">3</td>
						<td><input type="text" id="type3"  value=""/></td>
						<td class="color">색상</td>
						<td>
							<input type="text" name ="text3"  value=""/>
							<input type="color" id="color3"  value=""/>
						</td>
					</tr>
					<tr>
						<td class="num">4</td>
						<td><input type="text" id="type4"  value=""/></td>
						<td class="color">색상</td>
						<td>
							<input type="text" name ="text4"  value=""/>
							<input type="color" id="color4"  value=""/>
						</td>
					</tr>
					<tr>
						<td class="num">5</td>
						<td><input type="text" id="type5"  value=""/></td>
						<td class="color">색상</td>
						<td>
							<input type="text" name ="text5"  value=""/>
							<input type="color" id="color5"  value=""/>
						</td>
					</tr>
					<tr>
						<td class="num">6</td>
						<td><input type="text" id="type6"  value=""/></td>
						<td class="color">색상</td>
						<td>
							<input type="text" name ="text6"  value=""/>
							<input type="color" id="color6"  value=""/>
						</td>
					</tr>
					<tr>
						<td class="num">7</td>
						<td><input type="text" id="type7"  value=""/></td>
						<td class="color">색상</td>
						<td>
							<input type="text" name ="text7"  value=""/>
							<input type="color" id="color7"  value=""/>
						</td>
					</tr>
				</tbody>
			</table>
			</form>
		</article>
	</div>
	<div id="btn">
		<form>
			<input type="button" value="저장" id="save" onclick="save()"/>
			<input type="button" value="취소" id="cancel" onclick="cancel()"/>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	
	<script>
		function save() {
			document.forms[0].submit();
		}
		
		function cancel() {
			
		}
	</script>
</body>
</html>