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
                button {
             margin-left: 1009px;
            background-color: black;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

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
                <h3>High accessibility</h3>
                <p>누구나 손쉽게 가입할 수 있습니다.</p>
            </div>
            <div class="feature-card">
                <h3>Team Collaboration</h3>
                <p>다양한 사람들과 협업할 수 있습니다.</p>
            </div>
            <div class="feature-card">
                <h3>Intuitive Connection</h3>
                <p>직관적인 UI로 사이트를 쉽게 이용할 수 있습니다.</p>
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
<jsp:include page="footer.jsp"></jsp:include>
    </body>

</body>
</html>