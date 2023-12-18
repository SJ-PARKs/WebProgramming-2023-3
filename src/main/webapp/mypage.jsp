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
    margin-left: 430px;
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
    box-shadow: 1px 1px 1px;
    margin-bottom: 35px;
    margin-left: 10px;	
    padding-left: 10px;
    margin-top: 30px;
  }
  
   .text {
    vertical-align: middle;  /* 수직 정렬 조절 */
    flex: 0.1;
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


    <h1 style = "text-align: center;">User Profile</h1>
    <br><br>
  		 <div class = "container">
		 <span class = "text">User ID:</span>
		<div class = "box"> <%=userID%></div>
		<br>
		</div>
  		 <div class = "container">
		 <span class = "text">Email:</span>
		<div class = "box"> <%=email%></div>
		<br>
		</div>
  		 <div class = "container">
		 <span class = "text">Nickname:</span>
		<div class = "box"> <%=nick%></div>
		<br>
		</div>
  		 <div class = "container">
		 <span class = "text">Age:</span>
		<div class = "box"> <%=age%></div>
		<br>
		</div>
		<br><br><br>

	<div style="display: flex; justify-content: center; align-items: center;">
    	<button type="button" class="btn btn-primary" onclick = "document.location.href = 'myprojects_owner.jsp'">내가 등록한 프로젝트 확인</button>
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<button type="button" class="btn btn-primary" onclick = "document.location.href = 'myprojects_joined.jsp'">내가 가입한 프로젝트 확인</button>
	</div>

<br><br><br><br>

<script src="https://code.jquery.com/jquery-3.1.1.min.js">
</script>
<script src="js/bootstrap.js"></script>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>