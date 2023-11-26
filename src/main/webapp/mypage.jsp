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
    String url = "jdbc:mysql://localhost:3306/webprojectDB";
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

    <%
      if(userID == null){

    %>

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

    <%
    }
    else
    {

    %>

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

    <%
      }
    %>
  </div>
</nav>

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
  <button type="button">내가 쓴 게시글 확인</button>

</div>

<div class="container">

</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js">
</script>
<script src="js/bootstrap.js"></script>
</body>
</html>
