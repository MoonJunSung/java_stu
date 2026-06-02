<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%@ include file="header.jsp" %>
<script src="script.js"></script>

<h2>성적입력</h2>

<form name="frm" method="post" action="menu2DB.jsp">
	<table>
		<tr>
			<th>학번</th>
			<td>
				<input type="text" name="sid" autofocus="autofocus">
			</td>
		</tr>
		<tr>
			<th>교과코드</th>
			<td>
				<select name="subcode">
<%
	String sql = "SELECT subcode, subname FROM TBL_SUBJECT_202210 ORDER BY subcode";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	while(rs.next()) {
%>
					<option value="<%=rs.getString("subcode") %>">
						<%=rs.getString("subcode") %>-<%=rs.getString("subname") %>
					</option>
<%
	}
	rs.close();
	pstmt.close();
	conn.close();
%>
				</select>
			</td>
		</tr>
		<tr>
			<th>중간</th>
			<td>
				<input type="text" name="midscore">
			</td>
		</tr>
		<tr>
			<th>기말</th>
			<td>
				<input type="text" name="finalscore">
			</td>
		</tr>
		<tr>
			<th>출석</th>
			<td>
				<input type="text" name="attend">
			</td>
		</tr>
		<tr>
			<th>레포트</th>
			<td>
				<input type="text" name="report">
			</td>
		</tr>
		<tr>
			<th>기타</th>
			<td>
				<input type="text" name="etc">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="등록" onclick="insertCheck()">
				<input type="button" value="취소" onclick="reset()">
			</td>
		</tr>
	</table>
</form>

<%@ include file="footer.jsp" %>
