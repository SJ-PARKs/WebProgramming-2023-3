<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("userID");
	String pw = request.getParameter("userPassword");
	String pwcheck = request.getParameter("userPasswordCheck");
	
	// 비밀번호 체크
	if (!pw.contentEquals(pwcheck)) {
		response.sendRedirect("./join.jsp?error=1");
		return;
	}
	
	
	Connection conn = null;
	PreparedStatement pstmt1, pstmt2 = null;
	ResultSet rs= null;

	try {
		String url = "jdbc:mysql://localhost:3306/BookMarketDB";
		String user = "root";
		String password = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		
		
		String sql1 = "SELECT id FROM account WHERE id = ?";
		pstmt1 = conn.prepareStatement(sql1);
		pstmt1.setString(1, id);
		rs = pstmt1.executeQuery();
		
		//아이디 중복의 경우
		if(rs.next()){
			response.sendRedirect("./join.jsp?error=2");
			return;
		}
		

		String sql2 = "insert into account values(?,?)";
		pstmt2 = conn.prepareStatement(sql2);
		pstmt2.setString(1, id);
		pstmt2.setString(2, pw);
	
		pstmt2.executeUpdate();
		
		response.sendRedirect("./login.jsp");

	} catch (SQLException ex) {
		out.println("account 테이블에 삽입이 실패되었습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
		response.sendRedirect("./join.jsp?error=3");
	} finally {
		if (pstmt2 != null)
			pstmt2.close();
		if (conn != null)
			conn.close();
	}

	
%>
