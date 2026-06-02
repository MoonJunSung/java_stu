<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script src="script.js"></script>

<h2>과목별 성적 조회</h2>

<form name="frm" method="post" action="menu4DB.jsp" onsubmit="return menu4Check()">
	<table>
		<tr>
			<th>과목코드</th>
			<td>
				<input type="text" name="subcode" autofocus="autofocus">
			</td>
			<td>
				<input type="submit" value="조회">
			</td>
		</tr>
	</table>
</form>

<br><br>

<table>
	<tr>
		<th>학번</th>
		<th>성명</th>
		<th>학과</th>
		<th>과목</th>
		<th>중간</th>
		<th>기말</th>
		<th>출석</th>
		<th>레포트</th>
		<th>기타</th>
		<th>총점</th>
		<th>학점</th>
	</tr>
</table>

<%@ include file="footer.jsp" %>
