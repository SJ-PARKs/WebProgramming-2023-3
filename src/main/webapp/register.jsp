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
<jsp:include page="header.jsp"></jsp:include>
	<br>
    <div class="projectRegist" style = "width: 1000px; margin: auto; margin-left: 400px;">
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
        <input type="text" name = "outline" style="margin-left: 115px; margin-top: -35px; height: 80px; width: 300px;">
        <hr>
        수행 예상 기간 <input type="date" id="date" name="startDate" value="2023-11-15" min="2019-01-01" max="2024-12-31"
            style="margin-left: 17px;" />
        ~
        <input type="date" id="date" name="endDate" value="2023-11-15" min="2019-01-01" max="2024-12-31" />
        <hr>
        수행 예상 팀원 <input type="text" name="teamMate" style="margin-left: 17px; width: 40px">
        <hr>
        수행 난이도 <label style="margin-left: 31px;"><input type="radio" name="level" value = "상">상</label>
        <label><input type="radio" name="level" value = "상">중</label>
        <label><input type="radio" name="level" value = "상">하</label>
        <hr>

            <input class="btn btn-default" type="button" id = "listBtn" onclick="document.location.href = 'detailPage.jsp'" value="목록" >
            <input class="btn btn-default" type="reset" id = "listBtn" value="취소" >
            <input class="btn btn-default" type="submit" id = "listBtn" onclick="moveToProjectPage('등록하시겠습니까?', 'detailPage.jsp')" value="등록" >
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
