<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   #hd{
      background-color: #2e2e2e;
      color: #fff;
      width: 100%;
      margin: 0px auto;
      margin-bottom: 10px;
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
   <header id="hd"><h2>과정타입 등록/수정</h2></header>
   <div id="wrap">
      <article>
         <form action="Controller" method="post" name="fm">
         <input type="hidden" name="type"  value="addCourseType"/>
         <table id="t1">
            <colgroup>
               <col width="80px"/>
               <col width="*/2"/>
               <col width="80px"/>
               <col width="*/2"/>
            </colgroup>
            <tbody>
            <c:if test="${c_ar ne null}">
               <c:forEach var="tvo" items="${c_ar }">
               <tr>
                  <td class="num" >${tvo.ct_idx }</td>
                  
                  <td>
                     <input type="text" name="name"  value="${tvo.ct_name }"/>
                  </td>
                  <td class="color">색상</td>
                  <td>
                     <input type="text"  name ="text" value="${tvo.ct_color }"/>
                     <input type="color"  name ="color"  value="${tvo.ct_color }"/>
                  </td>
               </tr>
               </c:forEach>
            <c:forEach var="i" begin="${f:length(c_ar)+1}" end="7">
               <tr>
                  <td class="num">${i}</td>
                  <td>
                     <input type="text" name="name" />
                  </td>
                  <td class="color">색상</td>
                  <td>
                     <input type="text"  name ="text"/>
                     <input type="color"  name ="color" />
                  </td>
            
               </tr>
            </c:forEach>
            </c:if>
            <c:if test="${c_ar eq null }">
            <c:forEach var="i" begin="1" end="7">
               <tr>
                  <td class="num" >${i}</td>
                  <td>
                     <input type="text"  name="name" />
                  </td>
                  <td class="color">색상</td>
                  <td>
                     <input type="text"  name ="text"/>
                     <input type="color"  name ="color" />
                  </td>
            
               </tr>
            </c:forEach>
            </c:if>
            </tbody>
         </table>
         </form>
      </article>
   </div>
   <div id="btn">
      <form>
         <input type="button" value="저장" id="save" />
         <input type="button" value="취소" id="cancel" onclick="cancel()"/>
      </form>
   </div>
   <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
   
   <script>
      $(function(){
         $("#save").click(function(){

            document.fm.submit();
         });
      });

   </script>
</body>
</html>