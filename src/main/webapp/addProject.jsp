<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

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
		
		
		if(rs.next()){ //이미 책이 장바구니에 존재한다면 수량값만 1증가
			{%><script>
				alert("이미 가입했습니다.");
				location.href="detailPage.jsp";
			</script><%}
		}
		else{ //proj_acc에 정보가 없다면 책 id가 book DB에 존재하는지 확인
			sql = "select * from project_tbl where projectName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {	//장바구니에 책 추가
				sql = "UPDATE project_tbl SET quantity=? where projectName = ? ";
				int quantity = rs.getInt("quantity");
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, quantity+1);
				pstmt.setString(2, p_id);
				pstmt.executeUpdate();
				
				sql = "insert into proj_account(account_id,project_id) values(?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, a_id);
				pstmt.setString(2, p_id);
				pstmt.executeUpdate();
			}
			else{	//(예외처리)book DB에 해당 책 id가 없는 경우
				response.sendRedirect("exceptionNoProject.jsp");
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