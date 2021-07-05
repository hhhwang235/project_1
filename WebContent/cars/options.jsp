<%@ page contentType = "text/html; charset=utf-8" %>
	<%@ page import = "java.sql.DriverManager" %>
	<%@ page import = "java.sql.Connection" %>
	<%@ page import = "java.sql.Statement" %>
	<%@ page import = "java.sql.ResultSet" %>
	<%@ page import = "java.sql.SQLException" %>
	<%@ page import="jsp.util.DBConnection" %>
	<html>
	<head><title>옵션 설명</title>
	<style>
	.box1{
	text-align:right;
		}
	</style>
	<link href='../css/font.css' rel='stylesheet' type='text/css'/>
	<script type="text/javascript">
	function logoutPro(){
	        location.href="../member/pro/LogOutPro.jsp";
	    }
	function go_cars(){
        location.href="../cars/Car.jsp";
    }
	</script>
	</head>
	<body>
	<div class="box1">
       <font color="red"><%=session.getAttribute("sessionID") %></font>
        님 로그인되었습니다.
        <input type="button" value="로그아웃" onclick="logoutPro()" />
        </div>
		<input type="button" value="뒤로 가기" onclick="go_cars()" />       
	<p id="font">옵션표</p> 
	
			<BR><BR>
	<table width="100%" border="0" cellpadding = "10px">
	<tr style = "background-color:skyblue;">
			
		<td>옵션명</td><td>옵션등급</td><td>타이어 사이즈(단위: 인치)</td>
		
	</tr>
	<%
		// 객체 참조 변수 준비
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		

		try {
			// 쿼리 준비			
			String query = "select * from OPTIONS";
			
			// 커넥션 객체 생성
			conn = DBConnection.getConnection();
			// Statement 객체 생성
			stmt = conn.createStatement();
			// 문장 객체를 사용한 쿼리 실행
			rs = stmt.executeQuery(query);

			// 쿼리 실행 결과 출력
			while(rs.next()) {
	%>
				<tr>
					<td><%= rs.getString("GRADENUMBER") %></td>
					<td><%= rs.getString("GREADE") %></td>
					<td><%= rs.getInt("TIRESIZE") %></td>
				</tr>
	<%
			}


		} catch(SQLException ex) {
			out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			// 사용한 ResultSet 종료
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			// 사용한 Statement 종료
			if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
			// 사용한 Connection 종료
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	%>
	</table>
	</body>
	</html>