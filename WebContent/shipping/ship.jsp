<%@ page contentType = "text/html; charset=utf-8" pageEncoding="utf-8"%>
	<%@ page import = "java.sql.DriverManager" %>
	<%@ page import = "java.sql.Connection" %>
	<%@ page import = "java.sql.Statement" %>
	<%@ page import = "java.sql.ResultSet" %>
	<%@ page import = "java.sql.SQLException" %>
	<%@ page import="jsp.util.DBConnection" %>
	<% request.setCharacterEncoding("utf-8");  %>
	<html>
	<head><title>배송 방법 페이지</title>
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
        location.href="../order/test.jsp";
    }
    </script>
	</head>
	<body>
	<div class="box1">
       <font color="red"><%=session.getAttribute("sessionID") %></font>
        님 로그인되었습니다.
        <input type="button" value="로그아웃" onclick="logoutPro()" />
        </div>
        <input type="button" value="구매 취소" onclick="go_main()" />
        <p id="font">배송 방법을 선택하세요</p>
        <br><br>
	<%String a; %>
	<% a = request.getParameter("test1"); %>
	<form action = "../shipping/shipping_address.jsp" method = "post">
         <select name = "ship">  
	<%
		// 객체 참조 변수 준비
		Connection conn = null;
		Connection conn2 = null;
		Statement stmt = null;
		Statement stmt2 = null;
		ResultSet rs = null;
		ResultSet as = null;

		try {
			// 쿼리 준비			
			String query = "select * from SHIPPING_WAYS";
			// 커넥션 객체 생성
			conn = DBConnection.getConnection();
			// Statement 객체 생성
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, 
		             ResultSet.CONCUR_UPDATABLE);
			// 문장 객체를 사용한 쿼리 실행
			rs = stmt.executeQuery(query);
			
			
			
			// 쿼리 실행 결과 출력
			while(rs.next()) {
	%>
				<option><%= rs.getString("WAYS_NAME") %></option>
						
	<%
		} 
	%>
	</select>
	<input type = "submit" value = "배송 주소 설정하기"><br><br>
	<%//@@@@@@@@@@@@@현금결제 저장 %>
	<%session.setAttribute("cash", request.getParameter("cash_payment")); %>

	<table width="100%" border="0" cellpadding = "5px">
	<tr style = "background-color:skyblue;">
		<td>배송방법</td><td>배송설명</td>
		<td>배송 요금</td>
	</tr>
	
	<% 
	rs.first();
	rs.previous();
	while(rs.next()) {
	%>
	
				<tr>
					<td><%= rs.getString("WAYS_NAME") %></td>
					<td><%= rs.getString("WAYS_MEMO") %></td>
					<td><%= rs.getString("WAYS_PRICE") %></td>
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
			if (as != null) try { rs.close(); } catch(SQLException ex) {}
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			// 사용한 Statement 종료
			if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
			// 사용한 Connection 종료
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	%>
	</table>
	</form>
	</body>
	</html>