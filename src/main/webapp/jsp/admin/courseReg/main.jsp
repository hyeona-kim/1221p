<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/css/center.css" />

</head>
<c:if test="${tvo eq null }">
<body>
	<article id="wrap">
		<jsp:include page="../../head.jsp"></jsp:include>
		<div id="center">
			<div class="left">
				<ul id="list2">
					<li class="title"><a href="">&nbsp;&nbsp;&nbsp;과정등록</a></li>
					
					<li class="content"><a href="Controller?type=course">교육과정현황</a></li>
					<li class="content"><a href="">교수계획서 / 학습안내서</a></li>
					<li class="content"><a href="">시간표만들기(HRD)</a></li>
					<li class="title"><a href="">&nbsp;&nbsp;&nbsp;동영상 메뉴얼 보기</a></li>
				</ul>
			</div>
			<div class="right">
				<!--  여기서 표시될 테이블들 가지고오기 -->
				
			</div>
		</div>
	</article>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script>
		$(function() {
			//$().removeClass("selected");
			$(".selected").removeClass("selected")
			$("#secondmenu").addClass("selected");
		});
	</script>
</body>
</c:if>
<c:if test="${tvo ne null}">
	<c:redirect url="Controller">
	</c:redirect>
</c:if>
</html>