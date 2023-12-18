<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel = "stylesheet" href = "css/grid.css">
<!-- <link rel="stylesheet" href="css/custom.css"> -->
<title>프로젝트 모집 웹 사이트</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap');

        .features {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin-top: 20px;
        }

        .feature-card {
            flex: 1;
            padding: 10px;
            margin: 10px;
            text-align: center;
            background-color: #eee;
            border-radius: 5px;
        }
    
            section {
            max-width: 1136px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
/*         footer {
            background-color: #fff;
            color: black;
            text-align: center;
            padding: 10px;
            position: relative;
            bottom: 0;
            width: 100%;
            margin-top: 20px;
        }
                a {
            color: black;
            text-decoration: none;
        }
                button {
             margin-left: 1009px;
            background-color: black;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        } */

</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<!-- 	<div class="container" style = " background-color: #fff;">
		<div class="jumbotron">
			<div class="container">
        <h2>Welcome to Project Mate</h2>
        <p>Your go-to platform for project collaboration and management.</p>
        <p>Start collaborating today and make your projects a success!</p>
				<p><a class="btn btn-primary btn-pull" href="detailPage.jsp" role="button">자세히 알아보기</a></p>
			</div>
		</div>
	</div> -->

    <section id="home">
    <img src="images/logo.png" alt="Logo" width="50" height="50" class="d-inline-block align-text-top" style = "margin-bottom: auto;">
        <h2>Welcome to Project Mate!</h2>
        <p>프로젝트 협업 및 관리를 도와줄 웹 사이트</p>
        <p>협업을 시작하고 프로젝트를 성공으로 이끄세요!</p>
    </section>
    
    
    <section id="features">
    <img src="images/computer.jpg" alt="Logo" width="50" height="50" class="d-inline-block align-text-top" style = "margin-bottom: auto;">
        <h2>About Project Mate</h2>
        <div class="features">
            <div class="feature-card">
                <h3>Task Management</h3>
                <p>Effortlessly manage tasks and track progress.</p>
            </div>
            <div class="feature-card">
                <h3>Team Collaboration</h3>
                <p>Collaborate seamlessly with your team in real-time.</p>
            </div>
            <div class="feature-card">
                <h3>File Sharing</h3>
                <p>Share and access project files with ease.</p>
            </div>
        </div>
        <button type="submit" onclick="document.location.href = 'detailPage.jsp'">둘러보기</button>
    </section>
	
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/img1.jpg" style = "width: 20%">
				</div>
				<div class="item">
					<img src="images/img2.jpg" style = "width: 20%">
				</div>
				<div class="item">
					<img src="images/img3.jpg" style = "width: 20%">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js">
	</script>
	<script src="js/bootstrap.js"></script>
<!--     <footer>
    <hr style = "margin-top: 0;">
        &copy; 2023 Ace Three, 에이쓰리&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;All rights reserved&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href = "https://github.com/SJ-PARKs/WebProgramming-2023-3.git">Github</a>
    </footer> -->
<jsp:include page="footer.jsp"></jsp:include>
    </body>

</body>
</html>