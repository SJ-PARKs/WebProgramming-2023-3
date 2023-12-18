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

  .container {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    width: 100%;
    margin-left: 450px;
    padding-up: 15px;
    align-items: center;
    height: 60px;
  }
  
  .box {
    display: flex;
    align-items: center;
    width: 500px;
    height: 35px;
    border: 1px solid black;
    border-radius: 20px 20px 20px 20px;
    box-shadow: 1px 1px 1px;
    margin-bottom: 35px;
    margin-left: 10px;	
    padding-left: 10px;
    margin-top: 30px;
  }
  
   .text {
    vertical-align: middle;  /* 수직 정렬 조절 */
    flex: 0.12;
  }

</style>

<script type="text/javascript">
	function addProject() {

		if (confirm("프로젝트에 참가하겠습니까?")) {
			document.addForm.submit();
		} else {

			document.addForm.reset();
		}
	}
</script>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<br>
	<br>
	<br>

	<%
	int ref = 0;
	String subject = "", technique = "", outline = "", teamMate = "", quantity = "", level = "";
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
		quantity = rs.getString("quantity");
		level = rs.getString("level");
	}
	%>
		 <div class = "container">
		 <span class = "text">프로젝트 이름:</span>
		<div class = "box"> <%=projectName%></div>
		<br>
		</div>
		<div class = "container">
		 <span class = "text">프로젝트 주제:</span>
		<div class = "box"> <%=subject%></div>
		<br>
		</div>
				 <div class = "container">
		 <span class = "text">프로젝트 개요:</span>
		<div class = "box"> <%=outline%></div>
		<br>
		</div>
				 <div class = "container">
		 <span class = "text">프로젝트 난이도:</span>
		<div class = "box"> <%=level%></div>
		<br>
		</div>
				 <div class = "container">
		 <span class = "text">예상 수행 인원:</span>
		<div class = "box"> <%=quantity%> / <%=teamMate %></div>
		<br>
		</div>
				 <div class = "container">
		 <span class = "text">예상 수행 기간:</span>
		<div class = "box"> <%=startDate%> ~ <%=endDate %></div>
		<br>
		</div>
		

		<br>
		<br>
		<br> 
<div class="showProject" style="text-align: center; justify-content: center;">		
		<form name="addForm" 
					action="./addProject.jsp?projectName=<%=projectName%>"
					method="post">
					<a href="#" class="btn btn-info" onclick="addProject()"> 가입
						&raquo;</a> <a href="detailPage.jsp" class="btn btn-secondary">
						목록 &raquo;</a>
		</form>
		
	</div>
	<%
	stmt.close();
	conn.close();
	%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>