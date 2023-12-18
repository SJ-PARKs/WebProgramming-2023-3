<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="css/features.css">
<link rel="stylesheet" href="css/bootstrap.css">
<meta charset="UTF-8">
<title>수정 페이지</title>
<style>
.showProject {
	justify-content: center;
	margin: auto;
}

table {
	border: 1px solid;
	text-align: center;
	justify-content: center;
	margin: auto;
	box-shadow: 1px 1px 1px;
}

tr, td {
	box-shadow: 1px 1px 1px;
	border: 1px solid;
	padding: 10px;
}
</style>
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<br>
	<br>
	<br>

	<%
	int ref = 0;
	String subject = "", technique = "", outline = "", teamMate = "", level = "";
	String projectName = "", startDate = "", endDate = "";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	ref = Integer.parseInt(request.getParameter("ref"));

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "1234");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		String sql = "select * from project_tbl where ref= " + ref;
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		out.println("DB 연동 오류입니다: " + e.getMessage());
	}
	while (rs.next()) {
	%>
	<form action = "modifyAction.jsp" method = "post">
	<div class="showProject" style="text-align: center; justify-content: center;">
		<table>
			<tr>
				<td width="150">프로젝트명</td>
				<td width="400"><input type = "text" name = "projectName" value = "<%=rs.getString("projectName") %>" style = "border:none; text-align: center"></td>
			</tr>
			<tr>
				<td width="150">주제영역</td>
				<td width="400"><%=rs.getString("subject")%></td>
			</tr>
			<tr>
				<td width="150">기술분야</td>
				<td width="400"><%=rs.getString("technique")%></td>
			</tr>
			<tr>
				<td width="150">프로젝트 개요</td>
				<td width="400"><input type = "text" name = "outline" value = "<%=rs.getString("outline") %>" style = "border:none; text-align: center"></td>
			</tr>
			<tr>
				<td width="150">개시일</td>
				<td width="400"><%=rs.getString("startDate")%></td>
			</tr>
			<tr>
				<td width="150">마감일</td>
				<td width="400"><%=rs.getString("endDate")%></td>
			</tr>
			<tr>
				<td width="150">수행 예상 팀원</td>
				<td width="400"><input type = "text" name = "teamMate" value = "<%=rs.getString("teamMate") %>" style = "border:none; text-align: center"></td>
			</tr>
			<tr>
				<td width="150">수행 난이도</td>
				<td width="400"><%=rs.getString("level")%></td>
			</tr>
		</table>
		<br>
		<br>
		<br>  
		<input class="btn btn-default" type="reset" id="listBtn"  value="취소">
		<input class="btn btn-default" type="submit" id="listBtn" value="수정"><br>
		<input type="hidden" name="ref" value="<%=request.getParameter("ref")%>">
	</div>
	</form>
	<%
	}
	%>
	<%
	stmt.close();
	conn.close();
	%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>