<%@ page contentType = "text/html; charset=utf-8" %>

	<%@ page import="jsp.util.DBConnection" %>
	<%@ page import = "java.sql.DriverManager" %>
	<%@ page import = "java.sql.Connection" %>
	<%@ page import = "java.sql.Statement" %>
	<%@ page import = "java.sql.SQLException" %>
	<%@ page import = "java.sql.ResultSet" %>
	
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = (String)session.getAttribute("cartp");
		int amount = 0;
		
		int updateCount = 0;
		int updateCount2 = 0;
		// 객체 참조 변수 준비
		Connection conn = null;
		Connection conn2 = null;
		Statement stmt = null;
		Statement stmt2 = null;
		ResultSet rs = null;
		try {
			
			// 쿼리 준비
			String query2 = "select Product_quantity from goods where productions = '"+id+"'";
			conn2 = DBConnection.getConnection();
			stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, 
		             ResultSet.CONCUR_UPDATABLE);
			rs = stmt2.executeQuery(query2);
			while(rs.next()) {
				%>
							<% amount = rs.getInt("Product_quantity"); %>					
				<%
					} 
				%>
				
				
			<% 
			String query = "update goods set Product_quantity = '"+(--amount)+"' "+
					   "where productions = '"+id+"'";
			// DriverManager 클래스를 사용하여 connection 객체 구함
			conn = DBConnection.getConnection();
			// Statement 생성
			stmt = conn.createStatement();
			// Statement 객체로 쿼리 실행
			updateCount = stmt.executeUpdate(query);
			%>	
					
			<%
		} catch(SQLException ex) {
			out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			// 사용했던 자원 반납
			if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	%>
	<html>
	<head><title>테스트</title></head>
	<body>
	<%response.sendRedirect("../MainForm.jsp"); %>
	</body>
	</html>

