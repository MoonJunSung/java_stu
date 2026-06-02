<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%@ include file="header.jsp" %>

<h2>과목별 성적 조회</h2>

<form name="frm" method="post" action="menu4DB.jsp">
	<table>
		<tr>
			<th>과목코드</th>
			<td>
				<input type="text" name="subcode" value="<%= request.getParameter("subcode") %>">
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

<%
request.setCharacterEncoding("UTF-8");
String subcode = request.getParameter("subcode");

try {
	String sql = "";
	sql += " SELECT ";
	sql += " st.stuid, st.sname, st.dept_name, sj.subname, ";
	sql += " sc.midscore, sc.finalscore, sc.attend, sc.report, sc.etc, ";
	sql += " ROUND(sc.midscore * 0.3 + sc.finalscore * 0.3 + sc.attend * 0.2 + sc.report * 0.1 + sc.etc * 0.1, 1) AS totalscore, ";
	sql += " CASE ";
	sql += " WHEN sc.midscore * 0.3 + sc.finalscore * 0.3 + sc.attend * 0.2 + sc.report * 0.1 + sc.etc * 0.1 >= 95 THEN 'A+' ";
	sql += " WHEN sc.midscore * 0.3 + sc.finalscore * 0.3 + sc.attend * 0.2 + sc.report * 0.1 + sc.etc * 0.1 >= 90 THEN 'A' ";
	sql += " WHEN sc.midscore * 0.3 + sc.finalscore * 0.3 + sc.attend * 0.2 + sc.report * 0.1 + sc.etc * 0.1 >= 85 THEN 'B+' ";
	sql += " WHEN sc.midscore * 0.3 + sc.finalscore * 0.3 + sc.attend * 0.2 + sc.report * 0.1 + sc.etc * 0.1 >= 80 THEN 'B' ";
	sql += " WHEN sc.midscore * 0.3 + sc.finalscore * 0.3 + sc.attend * 0.2 + sc.report * 0.1 + sc.etc * 0.1 >= 75 THEN 'C+' ";
	sql += " WHEN sc.midscore * 0.3 + sc.finalscore * 0.3 + sc.attend * 0.2 + sc.report * 0.1 + sc.etc * 0.1 >= 70 THEN 'C' ";
	sql += " WHEN sc.midscore * 0.3 + sc.finalscore * 0.3 + sc.attend * 0.2 + sc.report * 0.1 + sc.etc * 0.1 >= 65 THEN 'D+' ";
	sql += " WHEN sc.midscore * 0.3 + sc.finalscore * 0.3 + sc.attend * 0.2 + sc.report * 0.1 + sc.etc * 0.1 >= 60 THEN 'D' ";
	sql += " ELSE 'F' END AS grade ";
	sql += " FROM TBL_STUDENT_202210 st, TBL_SCORE_202210 sc, TBL_SUBJECT_202210 sj ";
	sql += " WHERE st.stuid = sc.sid ";
	sql += " AND sc.subcode = sj.subcode ";
	sql += " AND sc.subcode = ? ";
	sql += " ORDER BY st.stuid ";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, subcode);
	rs = pstmt.executeQuery();

	while(rs.next()) {
%>
	<tr>
		<td><%= rs.getString("stuid") %></td>
		<td><%= rs.getString("sname") %></td>
		<td><%= rs.getString("dept_name") %></td>
		<td><%= rs.getString("subname") %></td>
		<td><%= rs.getInt("midscore") %></td>
		<td><%= rs.getInt("finalscore") %></td>
		<td><%= rs.getInt("attend") %></td>
		<td><%= rs.getInt("report") %></td>
		<td><%= rs.getInt("etc") %></td>
		<td><%= rs.getDouble("totalscore") %></td>
		<td><%= rs.getString("grade") %></td>
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
