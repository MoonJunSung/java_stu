<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%@ include file="header.jsp" %>

<h2>학생정보현황</h2>

<table>
	<tr>
		<th>학번</th>
		<th>이름</th>
		<th>주민번호</th>
		<th>학과명</th>
		<th>성별</th>
		<th>전화번호</th>
		<th>이메일</th>
	</tr>

<%
try {
	String sql = "";
	sql += " SELECT stuid, sname, ";
	sql += " SUBSTR(jumin, 1, 6) || '-' || SUBSTR(jumin, 7, 7) AS jumin, ";
	sql += " dept_name, ";
	sql += " CASE SUBSTR(jumin, 7, 1) ";
	sql += " WHEN '3' THEN '남자' ";
	sql += " WHEN '4' THEN '여자' ";
	sql += " ELSE '' END AS gender, ";
	sql += " phone, email ";
	sql += " FROM TBL_STUDENT_202210 ";
	sql += " ORDER BY stuid ";

	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	while(rs.next()) {
%>
	<tr>
		<td><%= rs.getString("stuid") %></td>
		<td><%= rs.getString("sname") %></td>
		<td><%= rs.getString("jumin") %></td>
		<td><%= rs.getString("dept_name") %></td>
		<td><%= rs.getString("gender") %></td>
		<td><%= rs.getString("phone") %></td>
		<td><%= rs.getString("email") %></td>
	</tr>
<%
	}
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
}
%>
</table>

<%@ include file="footer.jsp" %>
