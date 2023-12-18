<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%
String a_id = (String) session.getAttribute("id");
String p_id = request.getParameter("projectName");

if (p_id == null || p_id.trim().equals("")) {
	response.sendRedirect("detailPage.jsp");
	return;
}

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
	String url = "jdbc:mysql://localhost:3306/webproject";
	String user = "root";
	String password = "1234";

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);

	String sql;

	//먼저 해당 유저가 프로젝트에 가입했는지 확인
	sql = "select * from proj_account WHERE account_id = ? AND project_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, a_id);
	pstmt.setString(2, p_id);
	rs = pstmt.executeQuery();

	if (rs.next()) { //이미 project에 가입했다면
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter o = response.getWriter();
        o.println("<script>");
        o.println("alert('이미 가입했습니다.');");
        o.println("location.href='detailPage.jsp';");
        o.println("</script>");
	} else { //proj_acc에 정보가 있다면 인원수 +1
		sql = "select * from project_tbl where projectName = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, p_id);
		rs = pstmt.executeQuery();
		if (rs.next()) { //장바구니에 책 추가
	sql = "UPDATE project_tbl SET quantity=? where projectName = ? ";
	int quantity = rs.getInt("quantity");
	String teamMateString = rs.getString("teamMate");
	int teamMateInt = Integer.parseInt(teamMateString);
	if (quantity <= teamMateInt) {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, quantity + 1);
		pstmt.setString(2, p_id);
		pstmt.executeUpdate();

		sql = "insert into proj_account(account_id,project_id) values(?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, a_id);
		pstmt.setString(2, p_id);
		pstmt.executeUpdate();
	}
	else{
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter o = response.getWriter();
        out.println("<script>");
        out.println("alert('이미 가입했습니다.');");
        out.println("location.href='detailPage.jsp';");
        out.println("</script>");
	}
		}

	}
} catch (SQLException ex) {
	out.println("DB 탐색이 실패하였습니다.<br>");
	out.println("SQLException: " + ex.getMessage());
} finally {
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
}

response.sendRedirect("detailPage.jsp");
%>