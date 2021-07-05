<%@ page contentType = "text/html; charset=utf-8" %>
	<%@ page import = "java.sql.DriverManager" %>
	<%@ page import = "java.sql.Connection" %>
	<%@ page import = "java.sql.Statement" %>
	<%@ page import = "java.sql.ResultSet" %>
	<%@ page import = "java.sql.SQLException" %>
	<%@ page import="jsp.util.DBConnection" %>
	<html>
	<head><title>회원 정보 페이지</title>
	<link href='../css/font.css' rel='stylesheet' type='text/css'/>
	<style>
    	.box1{
  	text-align:right;
	}
    </style>
    <script type="text/javascript">
    function logoutPro(){
        location.href="../member/pro/LogOutPro.jsp";
    }
    function go_main(){
        location.href="../MainForm.jsp";
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
	<p id = "font">회원 정보</p>
			<!-- 이미지 추가 -->
			<br>
	<table width="100%" border="0" cellpadding = "10px">
	<tr style = "background-color:skyblue;">
			
		<td>회원 아이디</td><td>회원명</td><td>성별</td>
		<td>생일</td><td>이메일</td><td>전화번호</td>
		<td>주소</td><td>가입일자</td>
	</tr>
	<%
		// 객체 참조 변수 준비
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		

		try {
			// 쿼리 준비			
			String query = "select * from MEMBERS";
			
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
				<%if(session.getAttribute("sessionID").equals(rs.getString("USER_ID"))){%>
					<td><%= rs.getString("USER_ID") %></td>
					<td><%= rs.getString("NAME") %></td>
					<td><%= rs.getString("GENDER") %></td>
					<td><%= rs.getDate("BIRTHDAY") %></td>
					<td><%= rs.getString("EMAIL") %></td>
					<td><%= rs.getString("PHONE") %></td>
					<td><%= rs.getString("ADDRESS") %></td>
					<td><%= rs.getDate("REG") %></td>
					<%}%>
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