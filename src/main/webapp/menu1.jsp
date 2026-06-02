<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>학생현황</h2>

<form name="frm" method="post" action="menu1DB.jsp">
	<table>
		<tr>
			<th>학생현황을 조회합니다.</th>
		</tr>
		<tr>
			<td>
				<input type="submit" value="조회">
				<input type="button" value="홈으로" onclick="location.href='index.jsp'">
			</td>
		</tr>
	</table>
</form>

<%@ include file="footer.jsp" %>
