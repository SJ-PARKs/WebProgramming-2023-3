<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<% 
		Integer isAdminAttribute = (Integer) session.getAttribute("isadmin");
		int isadmin = (isAdminAttribute != null) ? isAdminAttribute : -1;
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
  <div class="container-fluid">
    <a class="navbar-brand" href="main.jsp">
      <img src="images/logo.png" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
    </a>
    <a class="navbar-brand" href="main.jsp">
      Project Mate
    </a>
      <a class="navbar-brand" href="register.jsp" style = "font-size: 15px;">
      프로젝트 등록
    </a>
     <a class="navbar-brand" href="addProject.jsp " style = "font-size: 15px;">
      프로젝트 가입
    </a>
    
  </div>
  </div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<!-- 			<ul class="nav navbar-nav">
				<li><a href="detailPage.jsp">프로젝트</a></li>
				<li><a href="detailPage.jsp">Q&A</a></li>
			</ul> -->
			
			<%
				if (isadmin == -1)
				{
			%>
			
			<ul class="nav navbar-nav navbar-right">
			     <a class="navbar-brand" href="mypage.jsp " style = "font-size: 15px;">
			     마이 페이지</a>
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
			if (isadmin != -1)
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
	
	<%-- 	<% 
		Integer isAdminAttribute = (Integer) session.getAttribute("isadmin");
		int isadmin = (isAdminAttribute != null) ? isAdminAttribute : -1;
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
				<li><a href="detailPage.jsp">프로젝트</a></li>
				<li><a href="detailPage.jsp">Q&A</a></li>
			</ul>
			
			<%
				if (isadmin == -1)
				{
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
			if (isadmin != -1)
			{
				
			%>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
						<li><a href="mypage.jsp">마이페이지</a></li>
					</ul>	
				</li>
			</ul>
			
			<%
			}
			%>
		</div>
	</nav> --%>