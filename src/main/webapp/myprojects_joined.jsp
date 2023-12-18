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
    .container2 {
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

<jsp:include page="header.jsp"></jsp:include>

	
<!-- <div class="container">
  <div class="container mt-5"> -->
    <h1 style = "text-align: center;">User Profile</h1>
    <br><br>
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
      <div class = "container2">
		 <span class = "text">project:</span>
		<div class = "box"> <%=project%></div>
		<br>
		</div>


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

<!--   </div>
</div> -->
				<br><br><br>
			<div style="display: flex; justify-content: center; align-items: center;">
			<button type="button" class="btn btn-primary" onclick = "document.location.href = 'myprojects_owner.jsp'">내가 등록한 프로젝트 확인</button>
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-primary" onclick = "document.location.href = 'main.jsp'">메인으로</button>
		</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js">
</script>
<script src="js/bootstrap.js"></script>
<br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>