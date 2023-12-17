<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel = "stylesheet" href = "css/grid.css">
<!-- <link rel="stylesheet" href="css/custom.css"> -->
<title>프로젝트 모집 웹 사이트</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>프로젝트 모집 사이트</h1>
				<p>프로젝트 모집을 위한 웹 사이트 제작</p>
				<p><a class="btn btn-primary btn-pull" href="detailPage.jsp" role="button">자세히 알아보기</a></p>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/1.jpg">
				</div>
				<div class="item">
					<img src="images/2.jpg">
				</div>
				<div class="item">
					<img src="images/3.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js">
	</script>
	<script src="js/bootstrap.js"></script>
	
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
		teamMate = Integer.parseInt(rs.getString("teamMate"));
		quantity = rs.getInt("quantity");
		
		java.util.Date startDateAsDate = formatter.parse(startDate);
		java.util.Date endDateAsDate = formatter.parse(endDate);
		int progressValue = quantity/teamMate;
		
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
			<progress value = "<%=progressValue%>" max = "100"></progress>
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
</body>
</html>