<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul#menu{
		width:80%;
		height: 30px;
		margin: 10px auto;
		padding: 0px;
		list-style: none;
		display: flex;
		border-left: 1px solid skyblue;
	}
	#table caption{
		text-indent: -9999px;
	}
	
	ul#menu>li{
		width:160px;
		height: 100%;
		border: 1px solid blue;
		border-right: none;
		
	}
	
	ul#menu>li>a{
		display:block;
		width:100%;
		height: 100%;
		line-height: 30px;
		text-align: center;
		background-color: #00bfff;
		color:#fff;
		
	}
	
</style>
</head>
<body>
	<div id="wrap">
		<header>
			<ul id="menu">
				<li><a href="Controller?type=list">게시판</a></li>
				<li><a href="Controller?type=reg">회원가입</a></li>
				<li><a href="Controller?type=login">로그인</a></li>
				<li><a href="Controller?type=product">상품목록</a></li>
			</ul>
		</header>
	</div>
</body>
</html>