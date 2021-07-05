<%@ page contentType = "text/html; charset=utf-8" %>
	<%@ page import = "java.sql.DriverManager" %>
	<%@ page import = "java.sql.Connection" %>
	<%@ page import = "java.sql.Statement" %>
	<%@ page import = "java.sql.ResultSet" %>
	<%@ page import = "java.sql.SQLException" %>
	<%@ page import="jsp.util.DBConnection" %>
	<% request.setCharacterEncoding("utf-8");  %>
	<html>
	<head><title>회사 소개 페이지</title>
	
	<style>
    	.box1{
  	text-align:right;
	}
    </style>
	<script type="text/javascript">
	function go_main() {
		location.href="../MainForm.jsp";
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
	<input type="button" value="메인으로 돌아가기" onclick="go_main()" />
	<br><BR><BR>
   
	<%
		// 객체 참조 변수 준비
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			// 쿼리 준비			
			String query = "select * from MANUFACTURER";
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
		<td>로고(클릭하시면 대표차종이 나옵니다.)</td><td>부서(클릭하시면 부서소개로 넘어갑니다.)</td>
		<td>회사명</td><td>대표번호</td><td>주소</td>
	</tr>
	
	<% 
	while(rs.next()) {
	%>
		<%if(rs.getRow() == 1){ %>
				<tr>
					<td><a href = "hyundal.jsp">
            		<img src="../img/hyundal.jpg" width= "300" height = "150">
            		<td><a href = "hyundal_department.jsp">현대 자동차 부서</a></td>
            		</a></td>
            		<%} %>
        <%if(rs.getRow() == 2){ %>	
       			    <td><a href = "kia.jsp">
            		<img src="../img/kia.jpg" width= "300" height = "150">
            		<td><a href = "kia_department.jsp">기아 자동차 부서</a></td>
            		</a></td>
            		<%} %>
        <%if(rs.getRow() == 3){ %>	
       			    <td><a href = "genesis.jsp">
            		<img src="../img/genesis.jpg" width= "300" height = "150">
            		<td>현대 자동차에 통합되어 있음</td>
            		</a></td>
            		<%} %>
					<td><%= rs.getString("MANUFACTURER_NAME") %></td>
					<td><%= rs.getString("MANUFACTURER_MAINPHONE") %></td>
					<td><%= rs.getString("MANUFACTURER_ADDRESS") %></td>
				</tr>
	<%
		}
	%>
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
	</table>
	</body>
	</html>