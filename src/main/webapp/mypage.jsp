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
  <style>
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
  </style>
</head>
<body>
<%
  String userID = (String) session.getAttribute("id");
  if(userID == null){
    response.sendRedirect("./login.jsp");
  }

  String email = "", nick="";
  int age=0;

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
    String sql1 = "SELECT email, nick, age FROM account WHERE id = ?";

    //SQL문 실행
    pstmt1 = conn.prepareStatement(sql1);
    pstmt1.setString(1, userID);

    //SQL 결과 저장
    rs = pstmt1.executeQuery();

    //저장된 튜플 탐색
    if(rs.next()){
      email = rs.getString("email");
      nick = rs.getString("nick");
      age =  Integer.parseInt(rs.getString("age"));
    }

    //#사용자가 작성한 글 가져오기

  } catch (SQLException ex) {
    out.println("account 테이블에 삽입이 실패되었습니다.<br>");
    out.println("SQLException: " + ex.getMessage());
    response.sendRedirect("./join.jsp?error=3");
  } finally {
    if (pstmt2 != null)
      pstmt2.close();
    if (conn != null)
      conn.close();
  }

%>

<jsp:include page="header.jsp"></jsp:include>

<div class="container">
  <div class="container mt-5">
    <h1>User Profile</h1>
    <dl class="row">
      <dt class="col-sm-3">User ID:</dt>
      <dd class="col-sm-9"><%= userID %></dd>

      <dt class="col-sm-3">Email:</dt>
      <dd class="col-sm-9"><%= email %></dd>

      <dt class="col-sm-3">Nickname:</dt>
      <dd class="col-sm-9"><%= nick %></dd>

      <dt class="col-sm-3">Age:</dt>
      <dd class="col-sm-9"><%= age %></dd>
    </dl>
  </div>
  <input type="submit" class="btn btn-primary form-control" value = "작성"><a href="myprojects_owner.jsp">내가 작성한 게시글 목록</a>
  <input type="submit" class="btn btn-primary form-control" value = "신청"><a href="myprojects_joined.jsp">신청 목록</a>

</div>

<div class="container">

</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js">
</script>
<script src="js/bootstrap.js"></script>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
