<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="../../css/header.css" /> -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/center.css" />

</head>
<c:if test="${sessionScope.vo ne null}">
<body>
	<article id="wrap">
		<jsp:include page="../../head.jsp"></jsp:include>
		<div id="center">
			<div class="left 2">
				<ul id="list2">
					<li class="title"><a href="">&nbsp;&nbsp;&nbsp;입학상담 및 모집현황</a></li>
					<li class="content"><a href="">&nbsp;&nbsp;•&nbsp;면접평가표관리</a></li>
					<li class="content"><a href="">&nbsp;&nbsp;•&nbsp;입학상담내역</a></li>
					<li class="content"><a href="">&nbsp;&nbsp;•&nbsp;일일모집현황</a></li>
					<li class="content"><a href="">&nbsp;&nbsp;•&nbsp;교육생등록현황</a></li>
					<li class="content"><a href="">&nbsp;&nbsp;•&nbsp;수강생파일등록</a></li>
					<li class="title"><a href="">&nbsp;&nbsp;&nbsp;동영상메뉴얼보기</a></li>
					<li class="last"></li>	
				</ul>
			</div>
			<div class="right">
				
			</div>
		</div>
	</article>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script>
		$(function() {
			//$().removeClass("selected");
			$(".selected").removeClass("selected")
			$("#firstmenu").addClass("selected");
		});
	</script>
</body>
</c:if>
<c:if test="${sessionScope.vo eq null }">
	<c:redirect url="Controller">
	</c:redirect>
</c:if>
</html>