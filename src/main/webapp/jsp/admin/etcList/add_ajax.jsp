<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="Controller?type=addStaff" method="post">
	<table>
		<colgroup>
			<col width="15%">
			<col width="35%">
			<col width="15%">
			<col width="35%">
		</colgroup>
		<caption>교직원 등록 테이블</caption>
		<tbody>
			<tr>
				<th>이름</th>
				<td class="left"><input class="input" type="text" placeholder="이름" name="sf_name"/></td>
				<th>직급</th>
				<td class="left"><input class="input" type="text" placeholder="직급" name="sf_job"/></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td class="left"><input class="input" type="text" placeholder="아이디" name="sf_id"/></td>
				<th>암호</th>
				<td class="left"><input class="input" type="text" placeholder="암호" name="sf_pwd"/></td>
			</tr>
			<tr>
				<th>입사일</th>
				<td class="left"><input class="input" type="text" placeholder="2023-01-01" name="sf_hire_date"/></td>
				<th>퇴사일</th>
				<td class="left"><input class="input" type="text" disabled="disabled" name="sf_fire_date"/></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td class="left">
					<input class="phone" type="text" placeholder="010" name="sf_phone"/>
					<input class="phone" type="text" placeholder="1234" name="sf_phone"/>
					<input class="phone" type="text" placeholder="5678" name="sf_phone"/>
				</td>
				<th>사용권한</th>
				<td align="left">
					<select name="rt_idx">
						<option value="0">기본(교직원)</option>
						<option value="1">임직원</option>
						<option value="9">총책임자</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>인증선택</th>
				<td colspan="3" align="left">
					<select>
						<option>사용안함</option>
						<option>사용</option>
					</select>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">
					<a href="javascript:addStaff()" class="staff_edit_btn staff_btn">저장</a>
					<a href="" class="staff_del_btn staff_btn">취소</a>
				</td>
			</tr>
		</tfoot>
	</table>
</form>