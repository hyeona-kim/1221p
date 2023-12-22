<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header>
   <div id="head">
      <h1>한국 ICT기술협회</h1>
      <span id="span1">서비스종료일:2024-03-03</span>
      <span id="span2">접속자:${vo.sf_name }</span>
      <a href="Controller?type=logout">로그아웃</a>
   </div>
   <ul id="list">
      <li class="menubar selected" id="firstmenu"><a href="Controller?type=menu&select=counselReceipt">상담 및 접수</a></li>
      <li class="menubar" id="secondmenu"><a href="Controller?type=menu&select=courseReg">과정등록</a></li>
      <li class="menubar" id="thirdmenu"><a href="Controller?type=menu&select=schoolRecord">학적부</a></li>
      <li class="menubar 4"><a href="Controller?type=menu&select=counselManage">상담관리</a></li>
      <li class="menubar 5"><a href="Controller?type=menu&select=trainingLog">훈련일지</a></li>
      <li class="menubar 6" id="etclist"><a href="Controller?type=menu&select=etcList">기타관리</a></li>
   </ul>
</header>