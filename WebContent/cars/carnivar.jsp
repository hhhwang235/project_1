<%@ page contentType = "text/html; charset=utf-8" %>
	<%@ page import = "java.sql.DriverManager" %>
	<%@ page import = "java.sql.Connection" %>
	<%@ page import = "java.sql.Statement" %>
	<%@ page import = "java.sql.ResultSet" %>
	<%@ page import = "java.sql.SQLException" %>
	<%@ page import="jsp.util.DBConnection" %>
	<html>
	<head><title>카니발</title></head>
	<body>

	<p>CARNIVAR 제원표</p> <br>
			<!-- 이미지 추가 -->
			<a href = "Car.jsp">
            <img src="../img/carnivar.jpg" width= "200" height = "150">
            </a><BR><BR>
	<table width="100%" border="0" cellpadding = "10px">
	<tr style = "background-color:skyblue;">
			
		<td>차번호</td><td>차명</td><td>전장(mm)</td>
		<td>전폭(mm)</td><td>전고(mm)</td><td>축간거리(mm)</td>
		<td>엔진형식</td><td>배기량(cc)</td><td>최고출력(ps/rpm)</td>
		<td>최대토크(kgf*m/rpm)</td><td>연료탱크 용량(L)</td><td>차급</td><td>옵션종류</td>
	</tr>
	<%
		// 객체 참조 변수 준비
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		

		try {
			// 쿼리 준비			
			String query = "select * from cars";
			
			// 커넥션 객체 생성
			conn = DBConnection.getConnection();
			// Statement 객체 생성
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, 
		             ResultSet.CONCUR_UPDATABLE);
			// 문장 객체를 사용한 쿼리 실행
			rs = stmt.executeQuery(query);

			// 쿼리 실행 결과 출력
			rs.absolute(28);
			while(rs.next()){
	%>
				<tr>
					<td><%= rs.getString("CAR_NUMBER") %></td>
					<td><%= rs.getString("CAR_NAME") %></td>
					<td><%= rs.getString("Length") %></td>
					<td><%= rs.getString("Width") %></td>
					<td><%= rs.getString("Height") %></td>
					<td><%= rs.getString("wheel_base") %></td>
					<td><%= rs.getString("Engine_type") %></td>
					<td><%= rs.getString("Displacement") %></td>
					<td><%= rs.getString("Peak_power") %></td>
					<td><%= rs.getString("Torque") %></td>
					<td><%= rs.getString("Fuel_tank") %></td>
					<td><%= rs.getString("SIZE_NUMBER") %></td>
					<td><%= rs.getString("GRADENUMBER") %></td>
				</tr>
	<%if(rs.getRow() == 32){
		break;
		}
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