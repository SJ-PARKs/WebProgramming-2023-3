<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>JSP 게시판 웹 사이트</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="container">
	<%
		String error = request.getParameter("error");
		if (error != null) {
			out.println("<div class='alert alert-danger'>");
			if(error.contentEquals("1")){
				out.println("비밀번호 확인이 다릅니다.");

			}
			else if(error.contentEquals("2")){
				out.println("중복되는 아이디가 존재합니다.");
			}
			else if(error.contentEquals("4")){
				out.println("나이는 최대 두자리수입니다.");
			}
			else{
				out.println("얘기치 못한 오류가 발생하였습니다.");
			}
			out.println("</div>");
		}
	%>
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<div class="jumbtron" style="padding-top:20px;">
			<form method="post" action="joinAction.jsp">
				<h3 style="text-align: center">회원가입 화면</h3>
				<div class="form-group">
					<input id="id" type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
				</div>
				<div class="form-group">
					<input id="pw" type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
				</div>
				<div class="form-group">
					<input id="pwcheck" type="password" class="form-control" placeholder="비밀번호확인" name="userPasswordCheck" maxlength="20">
				</div>
				<div class="form-group">
					<input id="email" type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
				</div>
				<div class="form-group">
					<input id="nick" type="text" class="form-control" placeholder="닉네임" name="userNickName" maxlength="20">
				</div>
				<div class="form-group">
					<input id="age" type="text" class="form-control" placeholder="나이" name="userAge" maxlength="2">
				</div>
				<input type="submit" class="btn btn-primary form-control" value="회원가입">

			</form>
		</div>
	</div>
	<div class="col-lg-4"></div>
</div>


<script src="https://code.jquery.com/jquery-3.1.1.min.js">
</script>
<script src="js/bootstrap.js"></script>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
