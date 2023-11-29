<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
request.setCharacterEncoding("utf-8"); // 한글 처리

String outline, teamMate, level, startDate, endDate, projectName;
int ref = 0, cnt = 0;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try{
   Class.forName("com.mysql.cj.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
   conn = DriverManager.getConnection(url, "root", "1234");

   stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
   String sql = "select count(*) as cnt, MAX(ref) as ref from project_tbl";
   rs = stmt.executeQuery(sql);

   while(rs.next()){
      cnt = Integer.parseInt(rs.getString("cnt"));
      if(cnt != 0)
         ref = rs.getInt("ref");
   }
   ref++;
   
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
   // out.println("saveSubject: " + saveSubject);  // saveSubject 값 출력
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
   // out.println("level: " + level);  // level 값 출력

   // PreparedStatement를 사용하여 SQL 쿼리를 실행합니다.
   // String sqlUpdate = "insert into project_tbl (subject, technique, outline, teamMate, level, ref) values (?, ?, ?, ?, ?, ?)";
/*    String sqlUpdate = "insert into project_tbl (subject, technique, outline, teamMate, level, ref) values (" + saveSubject + ",'" 
		   + saveTechnique + "','" + outline + "','" + teamMate + "','" + level + "','" + ref + ")"; */

   String sqlUpdate = "INSERT INTO project_tbl (projectName, subject, technique, outline, startDate, endDate, teamMate, level, ref) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
   PreparedStatement pstmt = conn.prepareStatement(sqlUpdate); 
/*    System.out.println("PreparedStatement 생성 완료");
   
   System.out.println("saveSubject: " + saveSubject);
   System.out.println("saveTechnique: " + saveTechnique);
   System.out.println("outline: " + outline);
   System.out.println("teamMate: " + teamMate);
   System.out.println("level: " + level);
   System.out.println("ref: " + ref); */
   
   pstmt.setString(1, projectName);
   pstmt.setString(2, saveSubject); 
   pstmt.setString(3, saveTechnique); 
   pstmt.setString(4, outline); 
   pstmt.setString(5, startDate); 
   pstmt.setString(6, endDate); 
   pstmt.setString(7, teamMate);    
   pstmt.setString(8, level); 
   pstmt.setInt(9, ref); 
  // System.out.println("파라미터 설정 완료");
   int result = pstmt.executeUpdate();
   // System.out.println("쿼리 실행 결과: " + result);

   if(pstmt!=null) pstmt.close();
   if(conn!=null) conn.close(); 
}
catch(Exception e){
	   e.printStackTrace();
	}
/* catch(Exception e){
   out.println("에러 발생: " + e.getMessage());
} finally {
    try {
        if(stmt != null) stmt.close();
        if(rs != null) rs.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
} */

%>
<a href = "detailPage.jsp">수정해야함</a>
<input type = "hidden" type="submit" id = "listBtn" onclick="document.location.href = 'detailPage.jsp'" value="등록" >
</body>
</html>