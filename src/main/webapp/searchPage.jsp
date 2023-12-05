<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<style>
.viewProject {
	justify-content: center;
	display: grid;
	grid-template-columns: repeat(3, 210px);
	/* grid-template-rows: repeat(4, 120px); */
}

.viewpro {
	width: 200px;
	height: 100px;
	border: 1px solid black;
	border-radius: 20px 20px 20px 20px;
	box-shadow: 1px 1px 1px;
	margin-bottom: 15px;
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
<%
String searchKey = null;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String outline, teamMate, level, startDate, endDate, projectName;
int ref = 0;

if(request.getParameter("searchKey")!=null){
	searchKey = (String) request.getParameter("searchKey");
	// System.out.println("searchword from parameter is :" + search);
}
if(session.getAttribute("searchKey")!=null){
	searchKey = (String) session.getAttribute("searchKey");
	// System.out.println("searchword from session is :" + search);
}

try{
	   Class.forName("com.mysql.cj.jdbc.Driver");
	   String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
	   conn = DriverManager.getConnection(url, "root", "1234");

	   stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	   String sql = "select * from project_tbl where outline like ?";
	   PreparedStatement pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, "%" + searchKey + "%");  // 검색어를 포함한 모든 결과를 찾습니다.
	   rs = pstmt.executeQuery();
	   
	   
} catch(Exception e){
	   e.printStackTrace();
	}
while(rs.next()){
	ref = rs.getInt("ref");
	outline = rs.getString("outline");
	%>
			<div class="viewpro" onclick="document.location.href = 'readPage.jsp?ref=<%=ref%>'">
			<div class="content"><%=outline %></div>
		</div>
		<%
}
%>
<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">Project Mate</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">프로젝트</a></li>
				<li><a href="bbs.jsp">Q&A</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>	
				</li>
			</ul>
			
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>	
				</li>
			</ul>
		</div>
	</nav>
	<br>
</body>
</html>