<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<h2 id="table_h2">교육과정등록</h2>
	<form action="Controller" method="post" name="frm02">
		<input type="hidden" name="type"  value="addCourse"/>
			<table id="table">
			<thead>
				<tr>
					<td colspan="4">
						과정등록
					</td>
				</tr>
			</thead>
				<tbody>
					<tr>
						<th><label>과정명</label></th>
						<td>
							<input type="text" name="c_name" />
						</td>
						<th><label>과정구분</label></th>
						<td>
						<select>
							<option value="0">선택하세요</option>
							<c:forEach items="${requestScope.c_ar}" var="c_ar">
								<option value="1">${c_ar.ct_name }</option>
							</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<th><label>모집예정일</label></th>
						<td><input type="text">-
							<input type="text">
						</td>
						<th><label>담당교사</label></th>
						<td>
						<select>
							<option value="t1">선택하세요</option>
							<c:forEach items="${requestScope.s_ar}" var="s_ar">
								<option value="1">${s_ar.sf_name }</option>
							</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<th><label>개강일</label></th>
						<td><input type="text" name="start_date"></td>
						<th><label>종료일</label></th>
						<td><input type="text" name="end_date"></td>
					</tr>
					<tr>
						<th><label>교육시간</label></th>
						<td><input type="text"><div id="box">(* 숫자로만 입력해주세요)</div></td>
						<th><label>교시/수업시간</label></th>
						<td><input type="text">-<input type="text"></td>
					</tr>
					<tr>
						<th><label>교육비</label></th>
						<td><input type="text" name="course_fee"><div id="box">(* 콤마(,)없이 숫자로만 입력해주세요)</div></td>
						<th><label>총교육일수</label></th>
						<td><input type="text"><div id="box">(숫자만입력가능)</div></td>
					</tr>
					<tr>
						<th><label>모집인원</label></th>
						<td><input type="text" name="c_peo_num"></td>
						<th><label>요일</label></th>
						<td>
						<input type="checkbox" name="monday" value="월">월
						<input type="checkbox" name="tuesday" value="화">화
						<input type="checkbox" name="wednesday" value="수">수
						<input type="checkbox" name="thursday" value="목">목
						<input type="checkbox" name="friday" value="금">금
						<input type="checkbox" name="saturday" value="토">토
						<input type="checkbox" name="sunday" value="일">일
						</td>
					</tr>
					<tr>
						<th><label>NCS세분류</label></th>
						<td><input type="text"></td>
						<th><label>회차</label></th>
						<td>
						<input type="text" name="c_round_num">
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3" align="left">
							<label>* 교육시간, 교시, 요일은 시간표 만들때 사용됩니다. 시간표를 만들려면 꼭 입력해주세요</label><br/>
							<label>* 총 교육일수는 훈련일지에서 사용됩니다.</label>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right" id="course_add_btn">
							<input type="submit" value="등록">
						</td>
						<td colspan="2" align="left">
							<input type="button" value="목록" id="cc_cancle">
						</td>
					</tr>
				</tfoot>	
			</table>
		</form>
		