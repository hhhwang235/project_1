<%@ page contentType = "text/html; charset=utf-8" %>
	<%@ page import = "java.sql.DriverManager" %>
	<%@ page import = "java.sql.Connection" %>
	<%@ page import = "java.sql.Statement" %>
	<%@ page import = "java.sql.ResultSet" %>
	<%@ page import = "java.sql.SQLException" %>
	<%@ page import="jsp.util.DBConnection" %>
	<% request.setCharacterEncoding("utf-8");  %>
	<html>
	<head><title>주문 내역</title>
	<link href='../css/font.css' rel='stylesheet' type='text/css'/>
	<style>
    	.box1{
  	text-align:right;
	}
    </style>
	<script type="text/javascript">
        function go_main(){
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
	<p id="font">나의 주문 내역</p>
	<table width="100%" border="0" cellpadding = "10px">
				<tr style = "background-color:skyblue;">
				<td>주문인</td><td>상품명</td><td>보험 번호</td>
				<td>할부 정보</td><td>현금 결제</td><td>배송 주소</td>
				<td>배송 방법</td><td>주문 일자</td>
				</tr>
				<tr>
	<% 
			// 객체 참조 변수 준비
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
						// 쿼리 준비			
						String query = "select * from ORDERSSS";
						
						// 커넥션 객체 생성
						conn = DBConnection.getConnection();
						// Statement 객체 생성
						stmt = conn.createStatement();
						// 문장 객체를 사용한 쿼리 실행
						rs = stmt.executeQuery(query);
						try {
							
							while(rs.next()){ 
								%>
					<%if(session.getAttribute("sessionID").equals(rs.getString("USER_ID"))){%>
					<td><%= rs.getString("USER_ID") %></td>
					<td><%= rs.getString("productions") %></td>
					<td><%= rs.getString("INSURNCE_ID") %></td>
					<td><%= rs.getString("Installment_ID") %></td>
					<td><%= rs.getString("Cash_payment") %></td>
					<td><%= rs.getString("Sipping_address") %></td>
					<td><%= rs.getString("WAYS_NAME") %></td>
					<td><%= rs.getString("Join") %></td>
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