<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 삭제</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8"); // 한글 처리
int ref = 0;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
ref = Integer.parseInt(request.getParameter("ref"));

try{
   Class.forName("com.mysql.cj.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
   conn = DriverManager.getConnection(url, "root", "1234");

   stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
   String sql = "select * from project_tbl;";
   rs = stmt.executeQuery(sql);
}
catch(Exception e){
	   e.printStackTrace();
	}
String sqlUpdate = "delete from project_tbl where ref= " + ref + ";";
try{
	stmt.executeUpdate(sqlUpdate);
} catch(Exception e){
	e.printStackTrace();
}

%>
삭제 완료
<a href = "detailPage.jsp">목록으로 돌아가기</a>
</body>
</html>