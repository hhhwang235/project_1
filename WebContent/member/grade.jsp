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
    <% int count = 0;%>
    <% String text;%>
	</head>
	<body>
	<div class="box1">
       <font color="red"><%=session.getAttribute("sessionID") %></font>
        님 로그인되었습니다.
        <input type="button" value="로그아웃" onclick="logoutPro()" />
        </div>
	<input type="button" value="메인으로 돌아가기" onclick="go_main()" />
	<table width="100%" border="0" cellpadding = "10px" style = "display:none">
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
			Connection conn2 = null;
			Statement stmt2 = null;
			ResultSet rs2 = null;
			
						// 쿼리 준비			
						String query = "select * from ORDERSSS";
						String query2 = "select * from GRADES";
						// 커넥션 객체 생성
						conn = DBConnection.getConnection();
						conn2 = DBConnection.getConnection();
						// Statement 객체 생성
						stmt = conn.createStatement();
						stmt2 = conn2.createStatement();
						// 문장 객체를 사용한 쿼리 실행
						rs = stmt.executeQuery(query);
						rs2 = stmt2.executeQuery(query2);
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
					
					<%//등급 측정을 위한 count 변수를 증가 시킨다.
					count++; %>
					<%}
					
							}%>
					</tr>
		<% 
		
				if(count > 3){
					text = "VIP";
				}
				else if(count ==3){		
					text = "플래티넘";
				}else if(count == 2){
					text = "골드";
				}else if(count == 1){
					text = "실버";
				}else{
					text = "브론즈";
				}
	%>
	</table>
	<h1><font color="red"><%=session.getAttribute("sessionID") %></font>
		님의 등급 : <font color="orange"><%= text %></font></h1>
		
		
	<table width="100%" border="0" cellpadding = "10px">
				<tr style = "background-color:skyblue;">
				<td>등급</td><td>등급 조건</td><td>등급 혜택</td>
				</tr>
	<% 				
							while(rs2.next()){ 
								
								%>
					<tr>
					<td><%= rs2.getString("GRADE_NAME") %></td>
					<td><%= rs2.getString("GRADE_MEMO") %></td>
					<td><%= rs2.getString("GRADE_SERVICE") %></td>
					</tr>
					
		<% 
			}	
	
		} catch(SQLException ex) {
			out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			// 사용한 ResultSet 종료
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (rs2 != null) try { rs2.close(); } catch(SQLException ex) {}
			// 사용한 Statement 종료
			if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
			if (stmt2 != null) try { stmt2.close(); } catch(SQLException ex) {}
			// 사용한 Connection 종료
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			if (conn2 != null) try { conn2.close(); } catch(SQLException ex) {}
		}%>
		</table>
	</body>
	</html>