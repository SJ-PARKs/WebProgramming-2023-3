<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="css/features.css">
<link rel="stylesheet" href = "css/bootstrap.css">
<meta charset="UTF-8">
<title>프로젝트 등록</title>
<script>
function moveToProjectPage(message, url){
	  alert(message);
	  location.href = url;
}
</script>
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
    <div class="projectRegist" style = "width: 1000px; margin: auto;">
              <h3><b>프로젝트 등록</b></h3>
    <hr>
    <form action = "registerAction.jsp" method = "post">
        프로젝트명 <input type="text" name="projectName" style="margin-left: 38px; width: 300px">
        <hr>
        주제영역
        <label><input type="checkbox" name="subject" value="생활" style="margin-left: 54px;">생활&nbsp;</label>
        <label><input type="checkbox" name="subject" value="업무">업무&nbsp;</label>
        <label><input type="checkbox" name="subject" value="공공, 교통">공공/교통&nbsp;</label>
        <label><input type="checkbox" name="subject" value="금용, 핀테크">금융/핀테크&nbsp;</label>
        <label><input type="checkbox" name="subject" value="의료">의료&nbsp;</label>
        <label><input type="checkbox" name="subject" value="교육">교육&nbsp;</label>
        <label><input type="checkbox" name="subject" value="유통, 쇼핑">유통/쇼핑&nbsp;</label>
        <label><input type="checkbox" name="subject" value="엔터테이먼트">엔터테이먼트&nbsp;</label>

        <hr>
        기술분야
        <label><input type="checkbox" name="technique" value="SW, AI" style="margin-left: 54px;">SW, AI&nbsp;</label>
        <label><input type="checkbox" name="technique" value="방송, 콘텐츠">방송/콘텐츠&nbsp;</label>
        <label><input type="checkbox" name="technique" value="블록체인, 융합">블록체인/융합&nbsp;</label>
        <label><input type="checkbox" name="technique" value="AI">AI&nbsp;</label>
        <label><input type="checkbox" name="technique" value="디바이스">디바이스&nbsp;</label>
        <label><input type="checkbox" name="technique" value="차세대보안">차세대보안&nbsp;</label>
        <label><input type="checkbox" name="technique" value="네트워크, 통신">네트워크/통신&nbsp;</label>
        <hr>
        프로젝트 개요
        <div style="font-size: 10px; width: 120px;">(제안배경 및 주요내용)</div>
        <input type="text" name = "outline" style="margin-left: 125px; margin-top: -35px; height: 80px; width: 300px;">
        <hr>
        수행 예상 기간 <input type="date" id="date" name="startDate" value="2023-11-15" min="2019-01-01" max="2023-12-31"
            style="margin-left: 10px;" />
        ~
        <input type="date" id="date" name="endDate" value="2023-11-15" min="2019-01-01" max="2023-12-31" />
        <hr>
        수행 예상 팀원 <input type="text" name="teamMate" style="margin-left: 11px; width: 40px">
        <hr>
        수행 난이도 <label style="margin-left: 28px;"><input type="radio" name="level" value = "상">상</label>
        <label><input type="radio" name="level" value = "상">중</label>
        <label><input type="radio" name="level" value = "상">하</label>
        <hr>

            <input class="btn btn-default" type="button" id = "listBtn" onclick="document.location.href = 'detailPage.jsp'" value="목록" >
            <input class="btn btn-default" type="reset" id = "listBtn" value="취소" >
            <input class="btn btn-default" type="submit" id = "listBtn" onclick="moveToProjectPage('등록 완료', 'detailPage.jsp')" value="등록" >
            <!-- <input class="btn btn-default" type="submit" id = "listBtn" onclick="document.location.href = 'detailPage.jsp'" value="등록" > -->
            <input type="hidden" name="ref" value="<%= request.getParameter("ref") %>">
        </form>
        <br>
    </div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js">
</script>
<script src="js/bootstrap.js"></script>
</body>
</html>