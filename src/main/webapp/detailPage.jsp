<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.*" %>
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
.viewProject {
	justify-content: center;
	display: grid;
	grid-template-columns: repeat(3, 210px);
	grid-template-rows: repeat(4, 120px);
}

.viewpro {
	width: 200px;
	height: 100px;
	border: 1px solid black;
	border-radius: 20px 20px 20px 20px;
	box-shadow: 1px 1px 1px;
}

.progress {
	margin-left: 10px;
	margin-top: 5px;
	width: 40px;
	height: 15px;
	border: 1px solid yellowgreen;
	background-color: yellowgreen;
	border-radius: 40px 40px 40px 40px;
	font-size: 10px;
	font-weight: bold;
	text-align: center;
}

.end {
	margin-left: 10px;
	margin-top: 5px;
	width: 40px;
	height: 15px;
	border: 1px solid red;
	background-color: red;
	border-radius: 40px 40px 40px 40px;
	font-size: 10px;
	font-weight: bold;
	text-align: center;
}

.content {
	margin-left: 10px;
	margin-top: 5px;
}
</style>
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<% 
		Integer isAdminAttribute = (Integer) session.getAttribute("isadmin");
		int isadmin = (isAdminAttribute != null) ? isAdminAttribute : -1;
	%>
	
	<br>
	<form class="form-inline" style="text-align: center; justify-content: center;" method="post" action="searchPage.jsp" name="search">
		<div class="form-group">
			<!-- 아이콘 추가 -->
			<label class="sr-only" for="searchKey">Search Key</label>
			<div class="input-group">
				<input type="text" class="form-control" id="searchKey" placeholder="검색어를 입력하세요!" style="width: 500px;">
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Search</button>
	</form>
	<br>
	<br>
	<div class="viewProject">
	<%
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
    java.util.Date today = new java.util.Date();
    String dateString = formatter.format(today);
	
	Connection conn = null;
	Statement stmt = null;
	String sql = null;
	ResultSet rs = null;
	String content = null, endDate = null;
	int ref = 0;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "1234");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		sql = "select * from project_tbl";
		rs = stmt.executeQuery(sql);
/* 	} catch (Exception e) {
		out.println(e.getMessage());
	} */

	rs.last();
	rs.beforeFirst();
	while (rs.next()) {
		ref = rs.getInt("ref");
		content = rs.getString("outline");
		endDate = rs.getString("endDate");
		java.util.Date endDateAsDate = formatter.parse(endDate);
		
		if(endDateAsDate.after(today)){
			%>
		<div class="viewpro" onclick="document.location.href = 'readPage.jsp?ref=<%=ref%>'">
			<div class="progress">진행중</div>
			<div class="content"><%=content %></div>
		</div>
	<%
		} else{ %>
				<div class="viewpro" onclick="document.location.href = 'readPage.jsp?ref=<%=ref%>'">
			<div class="end">마감</div>
			<div class="content"><%=content %></div>
		</div>
		<% }
	}
	conn.close();
	} catch(Exception e){
		e.printStackTrace();
	}
	%>
	</div>
		<nav>
		<ul class="pager">
			<li><a href="#">이전</a></li>
			<li><a href="#">다음</a></li>
		</ul>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js">
		
	</script>
	<script src="js/bootstrap.js"></script>

	</nav>
</body>
</html>