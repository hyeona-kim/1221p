<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#head{
		position: relative;
	}
	
	#head #span1, #head a,#head #span2{
		position: absolute;
	}
	#head a{
		right: 0;
		top: 0;
		font-size: 12px;
	}
	
	#head #span1{
		right: 70px;
		top: 0;
		font-size: 12px;
	}
	
	#head #span2{
		right: 230px;
		top: 0;
		font-size: 12px;
	}
	
	
	#list{
		display: flex;
		padding: 0;
		margin: 0;
		
	}
	#list .menubar:first-child{border-left:  1px solid red;}
	
	#list .menubar{
		text-decoration: none;
		padding: 10px 10px;
		list-style: none;
		border-left: none;
		width: 140px;
		height: 35px;
		flex-wrap: nowrap;
		line-height: 35px;
		padding: 0;
		margin: 0;
		
	}
	#list .menubar a{
		color: white;
		text-decoration: none;
		display: block;
		width: 100%;
		height: 100%;
		background-color: #343434;
		padding: 0;
		margin: 0;
		text-align: center;
	}
	
	#list .menubar a:hover{
		background-color: black;
		color: yellow;
	}

	#center{
		width: 100%;
		height: 700px; 
		border: 1px solid blue;
		display: flex;
		
	}
	.left{
		width: 20%;
		border: 1px solid blue;
	}
	.right{
		width: 80%;
		border: 1px solid blue;
	}
	#list .selected a{
		background-color: black;
		color: yellow;
	}
</style>
</head>
<body>
	<article id="wrap">
		<header>
			<div id="head">
				<h1>한국 ICT기술협회</h1>
				<span id="span1">서비스종료일:2024-03-03</span>
				<span id="span2">접속자:[로그인한 이름]</span>
				<a href="">로그아웃</a>
			</div>
			<ul id="list">
				<li class="menubar 1 selected" ><a href="">상담 및 접수</a></li>
				<li class="menubar 2"><a href="">과정등록</a></li>
				<li class="menubar 3"><a href="">학적부</a></li>
				<li class="menubar 4"><a href="">상담관리</a></li>
				<li class="menubar 5"><a href="">훈련일지</a></li>
			</ul>
		</header>
		<div id="center">
			<div class="left 2">
				<ul>
					<li><a href="">입학상담 및 모집현황</a></li>
					<li><a href="">면접평가표관리</a></li>
					<li><a href="">입학상담내역</a></li>
					<li><a href="">일일모집현황</a></li>
					<li><a href="">교육생등록현황</a></li>
					<li><a href="">수강생파일등록</a></li>
					<li><a href="">동영상메뉴얼보기</a></li>
				</ul>
			</div>
			<div class="right">
				
			</div>
		</div>
	</article>
</body>
</html>