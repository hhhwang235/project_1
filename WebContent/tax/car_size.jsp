<%@ page contentType = "text/html; charset=utf-8" %>
	<%@ page import = "java.sql.DriverManager" %>
	<%@ page import = "java.sql.Connection" %>
	<%@ page import = "java.sql.Statement" %>
	<%@ page import = "java.sql.ResultSet" %>
	<%@ page import = "java.sql.SQLException" %>
	<%@ page import="jsp.util.DBConnection" %>
	<% request.setCharacterEncoding("utf-8");  %>
	<html>
	<head><title>차량크기 페이지</title>
	<link href='../css/font.css' rel='stylesheet' type='text/css'/>
	<style>
    	.box1{
  	text-align:right;
	}
    </style>
	<script type="text/javascript">
	function go_main() {
		location.href="bond_tax.jsp";
	}
	function logoutPro(){
        location.href="../member/pro/LogOutPro.jsp";
    }	
    </script>
	</head>
	<body>
<div class="box1">
       <font color="red"><%=session.getAttribute("sessionID") %></font>
        님 로그인되었습니다.
        <input type="button" value="로그아웃" onclick="logoutPro()" />
        </div>
        <input type="button" value="뒤로 가기" onclick="go_main()" />
	<p id="font">차량크기 소개</p>
   
	<%
		// 객체 참조 변수 준비
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	
		try {
			// 쿼리 준비			
			String query = "select * from CAR_SIZE";
			// 커넥션 객체 생성
			conn = DBConnection.getConnection();
			// Statement 객체 생성
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, 
		             ResultSet.CONCUR_UPDATABLE);
			// 문장 객체를 사용한 쿼리 실행
			rs = stmt.executeQuery(query);
			%>
		
	<table width="100%" border="0" cellpadding = "10px">
	<tr style = "background-color:skyblue;">
		<td>차량크기 번호</td><td>차량크기</td>
		<td>사이즈 정보</td>
	</tr>
	<%
	while(rs.next()) {
	%>
					<td><%= rs.getString("SIZE_NUMBER") %></td>
					<td><%= rs.getString("SIZE_NAME") %></td>
					<td><%= rs.getString("SIZE_MEMO") %></td>
				</tr>
	<%
		}
	
	%>
	</table>
	<% 
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
	
	</body>
	</html>