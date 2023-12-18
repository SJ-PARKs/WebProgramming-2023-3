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
<!-- <link rel="stylesheet" href="css/features.css"> -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel = "stylesheet" href = "css/grid.css">
<meta charset="UTF-8">
<title>상세 페이지</title>
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<% 
		Integer isAdminAttribute = (Integer) session.getAttribute("isadmin");
		int isadmin = (isAdminAttribute != null) ? isAdminAttribute : -1;
	%>
	
	<br>
	<form class="form-inline" style="text-align: center; justify-content: center;" method="post" action="searchPage.jsp" name="searchKey">
		<div class="form-group">
			<!-- 아이콘 추가 -->
			<label class="sr-only" for="searchKey">Search Key</label>
			<div class="input-group">
				<input type="text" class="form-control" id="searchKey" name = "searchKey" placeholder="검색어를 입력하세요!" style="width: 500px;">
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
	String name = null, endDate = null, startDate = null;
	int teamMate, quantity;
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
		name = rs.getString("projectName");
		startDate = rs.getString("startDate");
		endDate = rs.getString("endDate");
		quantity = rs.getInt("quantity");
		teamMate = Integer.parseInt(rs.getString("teamMate"));
		
		java.util.Date startDateAsDate = formatter.parse(startDate);
		java.util.Date endDateAsDate = formatter.parse(endDate);
		/* int progressValue = quantity - teamMate; */
		long totalDuration = endDateAsDate.getTime() - startDateAsDate.getTime();
		long elapsedDuration = today.getTime() - startDateAsDate.getTime();
		int progressValue = (int) (elapsedDuration * 100.0 / totalDuration);
		
		if(endDateAsDate.after(today) || endDateAsDate.equals(today)){
			if (teamMate != quantity){
				
			%>
		<div class="viewpro" onclick="document.location.href = 'readPage.jsp?ref=<%=ref%>'">
			<div class="progress">진행중</div>
			<div class="content"><%=name %><br>
			<div class = "graph">
			<progress value = "<%=progressValue%>" max = "100" style = "margin: auto;"></progress>
			</div>
			<div class = "printDate">
			<%=startDate %> ~ <%=endDate %>
			</div>
			</div>
		</div>
	<%
			}
		} else{ %>
		<div class="viewpro" onclick="document.location.href = 'readPage.jsp?ref=<%=ref%>'">
			<div class="end">마 감</div>
			<div class="content"><%=name %><br>
			<div class = "graph">
			<progress value = "<%=progressValue%>" max = "100" style = "margin: auto;"></progress>
			</div>
			<div class = "printDate">
			<%=startDate %> ~ <%=endDate %>
			</div>
			</div>
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
<!-- 		<ul class="pager">
			<li><a href="#">이전</a></li>
			<li><a href="#">다음</a></li>
		</ul> -->
	<div style="display: flex; justify-content: center; align-items: center;">
    	<button type="button" class="btn btn-primary" onclick = "document.location.href = 'register.jsp'">등록하기</button>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js">
		
	</script>
	<script src="js/bootstrap.js"></script>
	</nav>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>