<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="css/features.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel = "stylesheet" href = "css/grid.css">
<title>검색 결과</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
String searchKey = null;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
java.util.Date today = new java.util.Date();
String dateString = formatter.format(today);
String outline, level, startDate, endDate, projectName;
int quantity, team;
int ref = 0;

if(request.getParameter("searchKey")!=null){
	searchKey = (String) request.getParameter("searchKey");
/* 	System.out.println("searchword from parameter is :" + searchKey); */
	session.setAttribute("searchKey", searchKey);  // 세션에 searchKey 저장
}
if(session.getAttribute("searchKey")!=null){
	searchKey = (String) session.getAttribute("searchKey");
/* 	System.out.println("searchword from session is :" + searchKey); */
}

try{
	   Class.forName("com.mysql.cj.jdbc.Driver");
	   String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
	   conn = DriverManager.getConnection(url, "root", "1234");

	   stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	   String sql = "SELECT * FROM project_tbl WHERE projectName LIKE ? OR outline LIKE ?";
	   PreparedStatement pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, "%" + searchKey + "%");
	   pstmt.setString(2, "%" + searchKey + "%");
	   rs = pstmt.executeQuery();
	   
	   %>
	<form class="form-inline" style="text-align: center; justify-content: center;" method="post" action="searchPage.jsp" name="searchKey">
		<div class="form-group">
			<!-- 아이콘 추가 -->
			<label class="sr-only" for="searchKey">Search Key</label>
			<div class="input-group">
				<input type="text" class="form-control" id="searchKey" name = "searchKey" placeholder="<%=searchKey %>" style="width: 500px;">
			</div>
		</div>
		<button type="submit" class="btn btn-primary" >Search</button>
	</form>
	<br><br>
		<div class="viewProject">
		<%
	   
	   while(rs.next()){
			ref = rs.getInt("ref");
			projectName = rs.getString("projectName");
			startDate = rs.getString("startDate");
			endDate = rs.getString("endDate");
			quantity = rs.getInt("quantity");
			team = Integer.parseInt(rs.getString("teamMate"));
/* 			int progressValue = quantity/team; */
        java.util.Date startDateAsDate = formatter.parse(startDate);
		java.util.Date endDateAsDate = formatter.parse(endDate);
		long totalDuration = endDateAsDate.getTime() - startDateAsDate.getTime();
		long elapsedDuration = today.getTime() - startDateAsDate.getTime();
		int progressValue = (int) (elapsedDuration * 100.0 / totalDuration);
			
			if(endDateAsDate.after(today) || endDateAsDate.equals(today)){
				if (team != quantity){
					
				%>
			<div class="viewpro" onclick="document.location.href = 'readPage.jsp?ref=<%=ref%>'">
				<div class="progress">진행중</div>
				<div class="content"><%=projectName %><br>
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
				<div class="content"><%=projectName %><br>
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
<br>
	<div style="display: flex; justify-content: center; align-items: center;">
    	<button type="button" class="btn btn-primary" onclick = "document.location.href = 'detailPage.jsp'">돌아가기</button>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>