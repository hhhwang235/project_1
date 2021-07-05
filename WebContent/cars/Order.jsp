<%@ page contentType = "text/html; charset=utf-8" %>
	<%@ page import = "java.sql.DriverManager" %>
	<%@ page import = "java.sql.Connection" %>
	<%@ page import = "java.sql.Statement" %>
	<%@ page import = "java.sql.ResultSet" %>
	<%@ page import = "java.sql.SQLException" %>
	<%@ page import="jsp.util.DBConnection" %>
	<html>
	<head><title>구매 목록</title>
	<link href='../css/font.css' rel='stylesheet' type='text/css'/>
	<style>
    	.box1{
  	text-align:right;
	}
    </style>
	<script type="text/javascript">
        function go_INSURNCE() {
            location.href="/insurnce/Insurnce.jsp";
        }    
        function logoutPro(){
            location.href="../member/pro/LogOutPro.jsp";
        }
        function go_main(){
            location.href="../order/test.jsp";
        }
        function go_production(){
            location.href="../order/production.jsp";
        }
        function go_no_goods(){
            location.href="../order/no_goods.jsp";
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
        <p id="font">구매하고자 하는 차량을 선택하세요</p>
        <br><br>
            <form action = "../insurnce/Insurnce.jsp" method = "post">
         <select name = "cartype"> 
	<%
		// 객체 참조 변수 준비
		Connection conn = null;
		Connection conn_2 = null;
		Statement stmt = null;
		Statement stmt_2 = null;
		ResultSet rs = null;
		ResultSet as = null;

		try {
			// 쿼리 준비			
			String query = "select * from goods";
			String query_2 = "select * from goods";
			// 커넥션 객체 생성
			conn = DBConnection.getConnection();
			conn_2 = DBConnection.getConnection();
			// Statement 객체 생성
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, 
		             ResultSet.CONCUR_UPDATABLE);
			stmt_2 = conn_2.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, 
		             ResultSet.CONCUR_UPDATABLE);
			// 문장 객체를 사용한 쿼리 실행
			rs = stmt.executeQuery(query);
			as = stmt_2.executeQuery(query_2);
		
			while(rs.next()) {
	%>
				<option><%= rs.getString("productions") %></option>
	
	<%} %>
	
	</select>
	<input type = "submit" value = "보험 가입하러 가기">
	<div class="box1">
	<input type="button" value="차량생산정보  보기" onclick="go_production()" />
	<input type="button" value="남은 재고차량 보기" onclick="go_no_goods()" />
	</div>
	<table width="100%" border="0" cellpadding = "5px">
	<tr style = "background-color:skyblue;">
	<td>차량명</td><td>남은 수량</td><td>판매가격(단위: 만원)</td>
	</tr>
	<% 
	rs.first();
	rs.previous();
	while(as.next()) {
	%>
	
	<tr>
	<td><%=as.getString("productions")%></td>
	<td><%=as.getString("Product_quantity")%></td>
	<td><%= as.getInt("GOODS_PRICE")%></td>
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
			if (as != null) try { rs.close(); } catch(SQLException ex) {}
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