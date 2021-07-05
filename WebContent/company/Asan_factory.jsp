<%@ page contentType = "text/html; charset=utf-8" %>
	<%@ page import = "java.sql.DriverManager" %>
	<%@ page import = "java.sql.Connection" %>
	<%@ page import = "java.sql.Statement" %>
	<%@ page import = "java.sql.ResultSet" %>
	<%@ page import = "java.sql.SQLException" %>
	<%@ page import="jsp.util.DBConnection" %>
	<% request.setCharacterEncoding("utf-8");  %>
	<html>
	<head><title>아산 공장</title>
	<link href='../css/font.css' rel='stylesheet' type='text/css'/>
	<style>
    	.box1{
  	text-align:right;
	}
    </style>
	<script type="text/javascript">
		function go_department(){	
			location.href="hyundal_department.jsp";
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
        <input type="button" value="부서 소개 페이지" onclick="go_department()" />
	<p id="font">아산 공장 소개</p>
	<form action = "../installment/Installment.jsp" method = "post">
	<%
		// 객체 참조 변수 준비
		Connection conn = null;
		Connection conn2 = null;
		Statement stmt = null;
		Statement stmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;

		try {
			// 쿼리 준비			
			String query = "select * from Production_factory";
			String query2 = "select * from Production_warehouse";
			// 커넥션 객체 생성
			conn = DBConnection.getConnection();
			conn2 = DBConnection.getConnection();
			// Statement 객체 생성
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, 
		             ResultSet.CONCUR_UPDATABLE);
			stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, 
		             ResultSet.CONCUR_UPDATABLE);
			// 문장 객체를 사용한 쿼리 실행
			rs = stmt.executeQuery(query);
			rs2 = stmt2.executeQuery(query2);
			
	%>		
	
	<table width="100%" border="0" cellpadding = "10px">
	<tr style = "background-color:skyblue;">
		<td>공장명</td><td>부서명</td><td>대표번호</td><td>주소</td>
	</tr>
	
	<% 
	rs.absolute(1);
	while(rs.next()) {
	%>
				<tr>
					<td><%= rs.getString("FACTORY_NAME") %></td>
					<td><%= rs.getString("Production_NAME") %></td>
					<td><%= rs.getString("FACTORY_MAINPHONE") %></td>
					<td><%= rs.getString("FACTORY_ADDRESS") %></td>
				</tr>
	<%
	if(rs.getRow() == 2){
		break;
			}
		}
	%>
	</table>
	<p id="font">아산 재고창고 소개</p>	
	<table width="100%" border="0" cellpadding = "10px">
	<tr style = "background-color:skyblue;">
		<td>재고창고</td><td>담당 공장명</td><td>대표번호</td><td>주소</td>
	</tr>
	<% 
	rs2.absolute(1);
	while(rs2.next()) {
	%>
				<tr>
					<td><%= rs2.getString("warehouse_NAME") %></td>
					<td><%= rs2.getString("FACTORY_NAME") %></td>
					<td><%= rs2.getString("warehouse_MAINPHONE") %></td>
					<td><%= rs2.getString("warehouse_ADDRESS") %></td>
				</tr>
	<%
	if(rs2.getRow() == 2){
		break;
			}
		}
	%>
	</table>
	<% 
		} catch(SQLException ex) {
			out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			// 사용한 ResultSet 종료
			if (rs2 != null) try { rs2.close(); } catch(SQLException ex) {}
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			// 사용한 Statement 종료
			if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
			// 사용한 Connection 종료
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	%>
	
	</form>
	</body>
	</html>