<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>

<%
request.setCharacterEncoding("UTF-8");

String sid = request.getParameter("sid");
String subcode = request.getParameter("subcode");
String midscore = request.getParameter("midscore");
String finalscore = request.getParameter("finalscore");
String attend = request.getParameter("attend");
String report = request.getParameter("report");
String etc = request.getParameter("etc");

try {
	String sql = "";
	sql += " INSERT INTO TBL_SCORE_202210 ";
	sql += " (sid, subcode, midscore, finalscore, attend, report, etc) ";
	sql += " VALUES (?, ?, ?, ?, ?, ?, ?) ";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, sid);
	pstmt.setString(2, subcode);
	pstmt.setInt(3, Integer.parseInt(midscore));
	pstmt.setInt(4, Integer.parseInt(finalscore));
	pstmt.setInt(5, Integer.parseInt(attend));
	pstmt.setInt(6, Integer.parseInt(report));
	pstmt.setInt(7, Integer.parseInt(etc));

	pstmt.executeUpdate();
%>
<script>
	alert("성적정보가 정상적으로 등록되었습니다!");
	location.href = "menu3DB.jsp";
</script>
<%
} catch(Exception e) {
	e.printStackTrace();
%>
<script>
	alert("성적 등록 중 오류가 발생했습니다!");
	history.back();
</script>
<%
} finally {
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
}
%>
