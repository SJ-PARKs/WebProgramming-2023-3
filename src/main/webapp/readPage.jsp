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
<title>상세 페이지</title>
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
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">Project Mate</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">프로젝트</a></li>
				<li><a href="bbs.jsp">Q&A</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>


			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
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
		projectName = rs.getString("projectName");
		subject = rs.getString("subject");
		technique = rs.getString("technique");
		outline = rs.getString("outline");
		startDate = rs.getString("startDate");
		endDate = rs.getString("endDate");
		teamMate = rs.getString("teamMate");
		level = rs.getString("level");
	}
	%>
	<div class="showProject" style="text-align: center; justify-content: center;">
		<table>
			<tr>
				<td width="150">프로젝트명</td>
				<td width="400"><%=projectName%></td>
			</tr>
			<tr>
				<td width="150">주제영역</td>
				<td width="400"><%=subject%></td>
			</tr>
			<tr>
				<td width="150">기술분야</td>
				<td width="400"><%=technique%></td>
			</tr>
			<tr>
				<td width="150">프로젝트 개요</td>
				<td width="400"><%=outline%></td>
			</tr>
			<tr>
				<td width="150">개시일</td>
				<td width="400"><%=startDate%></td>
			</tr>
			<tr>
				<td width="150">마감일</td>
				<td width="400"><%=endDate%></td>
			</tr>
			<tr>
				<td width="150">수행 예상 팀원</td>
				<td width="400"><%=teamMate%></td>
			</tr>
			<tr>
				<td width="150">수행 난이도</td>
				<td width="400"><%=level%></td>
			</tr>
		</table>
		<br>
		<br>
		<br> <input class="btn btn-default" type="button" id="listBtn" onclick="document.location.href = 'detailPage.jsp'" value="목록">  
		<input class="btn btn-default" type="submit" id="listBtn" onclick="javascript:alert('등록하시겠습니까?')" value="가입"> <input type="hidden" name="ref" value="<%=request.getParameter("ref")%>">
	</div>
	삭제/수정 테스트
	<a href = "deleteAction.jsp?ref=<%=ref%>">삭제하기</a><br>
	<a href = "modifyPage.jsp?ref=<%=ref %>">수정하기</a>
	<%
	stmt.close();
	conn.close();
	%>
</body>
</html>