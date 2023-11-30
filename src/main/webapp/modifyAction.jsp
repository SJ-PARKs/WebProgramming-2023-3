<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 수정</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8"); // 한글 처리
int ref = 0;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;String outline, teamMate, level, startDate, endDate, projectName;

ref = Integer.parseInt(request.getParameter("ref"));
projectName = request.getParameter("projectName");
String[] subject = request.getParameterValues("subject");
String saveSubject = "";
if(subject != null) {
	   
	   for(int i=0; i<subject.length; i++){
		   saveSubject += subject[i];
	        if (i < subject.length - 1) {  // 현재 인덱스가 마지막 인덱스가 아닐 경우
	            saveSubject += ", ";  // 쉼표 추가
	        }
	   }  
}
String[] technique = request.getParameterValues("technique");
String saveTechnique = "";
if(technique != null){
	   
	   for(int i=0; i<technique.length; i++){
	      saveTechnique += technique[i];
	      if(i<technique.length-1){
	    	  saveTechnique += ", ";
	      }
	   }
}

// xout.println("saveTechnique: " + saveTechnique);  // saveTechnique 값 출력
outline = request.getParameter("outline");
startDate = (String)request.getParameter("startDate");
endDate = (String)request.getParameter("endDate");
teamMate = request.getParameter("teamMate");
level = request.getParameter("level");

try{
   Class.forName("com.mysql.cj.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
   conn = DriverManager.getConnection(url, "root", "1234");

   stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
   String sql =  "update project_tbl set projectName = '" + projectName + "', subject = '"
			+ subject + "', technique = '" + technique + "', outline = '" + outline + "', startDate = '" + startDate + "', endDate = '" + endDate + 
			"', teamMate = '" + teamMate + "', level = '" + level + "' where ref = " + ref;
   stmt.executeUpdate(sql);
}
catch(Exception e){
	   e.printStackTrace();
	}

%>
수정 완료
</body>
</html>