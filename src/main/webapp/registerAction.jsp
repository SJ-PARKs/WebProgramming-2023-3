<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <script>
function moveToProjectPage(message, url){
	  alert(message);
	  location.href = url;
}
</script> -->
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8"); // 한글 처리

	String outline, teamMate, level, startDate, endDate, projectName;
	int ref = 0, cnt = 0;
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;

	String p_id = request.getParameter("projectName");
	String a_id = (String) session.getAttribute("id");

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "1234");

		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		String sql = "select count(*) as cnt, MAX(ref) as ref from project_tbl";
		rs = stmt.executeQuery(sql);

		while (rs.next()) {
			cnt = Integer.parseInt(rs.getString("cnt"));
			if (cnt != 0)
		ref = rs.getInt("ref");
		}
		ref++;

		projectName = request.getParameter("projectName");
		String[] subject = request.getParameterValues("subject");
		String saveSubject = "";
		if (subject != null) {

			for (int i = 0; i < subject.length; i++) {
		saveSubject += subject[i];
		if (i < subject.length - 1) { // 현재 인덱스가 마지막 인덱스가 아닐 경우
			saveSubject += ", "; // 쉼표 추가
		}
			}

		}
		String[] technique = request.getParameterValues("technique");
		String saveTechnique = "";
		if (technique != null) {

			for (int i = 0; i < technique.length; i++) {
		saveTechnique += technique[i];
		if (i < technique.length - 1) {
			saveTechnique += ", ";
		}
			}
		}

		// xout.println("saveTechnique: " + saveTechnique);  // saveTechnique 값 출력
		outline = request.getParameter("outline");
		startDate = (String) request.getParameter("startDate");
		endDate = (String) request.getParameter("endDate");
		teamMate = request.getParameter("teamMate");
		level = request.getParameter("level");

		sql = "select * from project_tbl where projectName = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, p_id);
		rs = pstmt.executeQuery();

		
		if (rs.next()) { // 이미 프로젝트명이 존재한다면
			out.println("<script>");
			out.println("alert('프로젝트명이 이미 존재합니다.');");
			out.println("location.href='detailPage.jsp';");
			out.println("</script>");
			return;
		} else {
			sql = "INSERT INTO project_tbl (projectName, subject, technique, outline, startDate, endDate, teamMate, level, ref) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, projectName);
			pstmt.setString(2, saveSubject);
			pstmt.setString(3, saveTechnique);
			pstmt.setString(4, outline);
			pstmt.setString(5, startDate);
			pstmt.setString(6, endDate);
			pstmt.setString(7, teamMate);
			pstmt.setString(8, level);
			pstmt.setInt(9, ref);
			// System.out.println("파라미터 설정 완료");
			int result = pstmt.executeUpdate();

			sql = "insert into admin_account(admin_id,project_id) values(?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a_id);
			pstmt.setString(2, projectName);
			pstmt.executeUpdate();
			// System.out.println("쿼리 실행 결과: " + result);

			if (pstmt != null)
		pstmt.close();
			if (conn != null)
		conn.close();

			out.println("<script>");
			out.println("alert('등록완료');");
			out.println("location.href='detailPage.jsp';");
			out.println("</script>");
			return;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	response.sendRedirect("detailPage.jsp");
	%>


</body>
</html>
