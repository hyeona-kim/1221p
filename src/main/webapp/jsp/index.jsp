<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.text-center {
	text-align: center;
}

.direct {
	display: inline-block;
	width: 100px;
	height: 200px;
	margin: 50px;
	border: 1px solid black;
}

.direct h2 {
	text-indent: -9999px;
	height: 0;
}

.direct a {
	display: inline-block;
	width: 100%;
	height: 100%;
	background: gray;
}
</style>
</head>
<body>
	<div class="text-center loginscreen2">
		<h1 style="margin-top: 50px">한국ICT 기술협회</h1>
		<div class="text-center" style="margin: 20px auto 0;">
			<div class="direct facebook">
				<a href="Controller?type=login&select=admin"> <img alt="관리자 이미지" src="" width="110px">
					<h2>관리자 모드</h2>
				</a>
			</div>
			<div class="direct twitter">
				<a href="Controller?type=login&select=train"> <img alt="수강생이미지" src="" width="110px">
					<h2>수강생 모드</h2>
				</a>
			</div>
			<div class="direct green">
				<a href="Controller?type=login&select=teacher"> <img alt="교.강사모드" src="" width="110px">
					<h2>교·강사 모드</h2>
				</a>
			</div>
		</div>
		<div class="clear"></div>
		<p class="m-t">
			<small>Copyright &copy; 한국ict인재개발원. All rights reserved.</small>
		</p>
	</div>
</body>
</html>