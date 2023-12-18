<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/custom.css">
  <title>마이페이지</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>


<div class="container">
  <div class="container mt-5">
    <h1>User Profile</h1>
<%
  String userID = (String) session.getAttribute("id");
  if(userID == null){
    response.sendRedirect("./login.jsp");
  }

  String project = "";

  Connection conn = null;
  PreparedStatement pstmt1, pstmt2 = null;
  ResultSet rs= null;


  try {
    //#사용자 정보 가져오기
    //DB연결
    String url = "jdbc:mysql://localhost:3306/webproject";
    String user = "root";
    String password = "1234";

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);
    //DB연결

    //SQL문 삽입
    String sql1 = "SELECT project_id FROM proj_account WHERE account_id = ?";

    //SQL문 실행
    pstmt1 = conn.prepareStatement(sql1);
    pstmt1.setString(1, userID);

    //SQL 결과 저장
    rs = pstmt1.executeQuery();

    //저장된 튜플 탐색
    while(rs.next()){
      project = rs.getString("project_id");
%>
    <dl class="row">
      <dt class="col-sm-3">project:</dt>
      <dd class="col-sm-9"><%= project %></dd>
    </dl>

<%
    }

    //#사용자가 작성한 글 가져오기

  } catch (SQLException ex) {
    out.println("SQLException: " + ex.getMessage());
  } finally {
    if (pstmt2 != null)
      pstmt2.close();
    if (conn != null)
      conn.close();
  }

%>

  </div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js">
</script>
<script src="js/bootstrap.js"></script>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
