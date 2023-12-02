<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("userID");
	String pw = request.getParameter("userPassword");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		String url = "jdbc:mysql://localhost:3306/webproject";
		String user = "root";
		String password = "1234";

		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);

		String sql = "select * from account where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			if(rs.getString("password").equals(pw)){
				if(id.equals("admin")){
					session.setAttribute("isadmin",1);
				}
				else{
					session.setAttribute("isadmin",0);
				}
				session.setAttribute("id", id);
				response.sendRedirect("main.jsp");
			}
			else{
				response.sendRedirect("./login.jsp?error='true'");
			}

		}
		else{
			response.sendRedirect("./login.jsp?error='true'");
		}
			

	} catch (SQLException ex) {
		out.println("SQLException: " + ex.getMessage());
		response.sendRedirect("./login.jsp?error='true'");
	} finally {
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}

%>
