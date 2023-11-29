<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="css/features.css">
<link rel="stylesheet" href = "css/bootstrap.css">
<meta charset="UTF-8">
<title>상세 페이지</title>
<style>
  .viewProject {
    justify-content: center;
    display: grid;
    grid-template-columns: repeat(3, 210px);
    grid-template-rows: repeat(4, 120px);
  }

  .viewpro {
    width: 200px;
    height: 100px;
    border: 1px solid black;
    border-radius: 20px 20px 20px 20px;
    box-shadow: 1px 1px 1px;
  }

  .진행중 {
    margin-left: 10px;
    margin-top: 5px;
    width: 40px;
    height: 15px;
    border: 1px solid yellowgreen;
    background-color: yellowgreen;
    border-radius: 40px 40px 40px 40px;
    font-size: 10px;
    font-weight: bold;
    text-align: center;
  }

  .마감 {
    margin-left: 10px;
    margin-top: 5px;
    width: 40px;
    height: 15px;
    border: 1px solid red;
    background-color: red;
    border-radius: 40px 40px 40px 40px;
    font-size: 10px;
    font-weight: bold;
    text-align: center;

  }

  .하 {
    margin-left: 10px;
    margin-top: 5px;
  }
</style>
</head>
<body>
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
		</div>
	</nav>
	<br>
	
<%
Connection conn = null;
Statement stmt = null;
String sql = null;
ResultSet rs = null;
int ref=0;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
	conn = DriverManager.getConnection(url, "root", "1234");
	stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	sql = "select * from project_tbl";
	rs = stmt.executeQuery(sql);
} catch(Exception e){
	out.println(e.getMessage());
}

rs.last();
rs.beforeFirst();
while(rs.next()){
	ref = rs.getInt("ref");
}
%>
	
<form class="form-inline" style = "text-align: center; justify-content: center;" method = "post" action = "searchPage.jsp" name = "search">
  <div class="form-group">
  <!-- 아이콘 추가 -->	
    <label class="sr-only" for="searchKey">Search Key</label>
    <div class="input-group">
      <input type="text" class="form-control" id="searchKey" placeholder="Give me your keyword!" style="width: 500px;">
    </div>
  </div>
  <button type="submit" class="btn btn-primary">Search</button>
</form>
<br><br>

  <div class="viewProject">
      <div class="viewpro" onclick = "document.location.href = 'readPage.jsp?ref=<%= ref%>'">
      <div class="진행중">진행중</div>
      <div class="하">내용 + 남은 인원</div>
    </div>
    <div class="viewpro">
      <div class="진행중">진행중</div>
      <div class="하">내용 + 남은 인원</div>
    </div>
    <div class="viewpro">
      <div class="진행중">진행중</div>
      <div class="하">내용 + 남은 인원</div>
    </div>
    <div class="viewpro">
      <div class="진행중">진행중</div>
      <div class="하">내용 + 남은 인원</div>
    </div>
    <div class="viewpro">
      <div class="진행중">진행중</div>
      <div class="하">내용 + 남은 인원</div>
    </div>
    <div class="viewpro">
      <div class="마감">마감</div>
      <div class="하">내용 + 남은 인원</div>
    </div>
    <div class="viewpro">
      <div class="진행중">진행중</div>
      <div class="하">내용 + 남은 인원</div>
    </div>
    <div class="viewpro">
      <div class="진행중">진행중</div>
      <div class="하">내용 + 남은 인원</div>
    </div>
    <div class="viewpro">
      <div class="진행중">진행중</div>
      <div class="하">내용 + 남은 인원</div>
    </div>
    <div class="viewpro">
      <div class="진행중">진행중</div>
      <div class="하">내용 + 남은 인원</div>
    </div>
    <div class="viewpro">
      <div class="마감">마감</div>
      <div class="하">내용 + 남은 인원</div>
    </div>
    <div class="viewpro">
      <div class="진행중">진행중</div>
      <div class="하">내용 + 남은 인원</div>
    </div>
  </div>


<nav>
  <ul class="pager">
    <li><a href="#">이전</a></li>
    <li><a href="#">다음</a></li>
  </ul>
</nav>
<script src="https://code.jquery.com/jquery-3.1.1.min.js">
</script>
<script src="js/bootstrap.js"></script>
</body>
</html>