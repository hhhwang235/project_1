<%@ page contentType = "text/html; charset=utf-8" pageEncoding="utf-8"%>
	<%@ page import = "java.sql.DriverManager" %>
	<%@ page import = "java.sql.Connection" %>
	<%@ page import = "java.sql.PreparedStatement" %>
	<%@ page import = "java.sql.Statement" %>
	<%@ page import = "java.sql.SQLException" %>
	<%@ page import="jsp.util.DBConnection" %>
	<% request.setCharacterEncoding("utf-8");  %>
	<%
		String idValue = request.getParameter("id");
		Connection conn = null;
		Statement st = null;
		PreparedStatement pst = null;
		Throwable occuredException = null;
		try {
			
			conn = DBConnection.getConnection();
			// transaction을 시작한다.
			conn.setAutoCommit(false);
			// 요청 파라미터가 가리키는 레코드를 삭제한다.
			// idValues를 둘러싸는 작은따옴표 표기에 주의해라.
			st = conn.createStatement();
			st.executeUpdate("DELETE FROM ordersss WHERE productions = '" + 
					idValue + "'");
			// transaction이 걸려있어 다음 명령을 수행하다가 오류가 발생하면 
			// 이전 명령의 처리 결과도 취소된다.
			// 위에서 부터 아이디 상품명 가입보험 할부 현금결제 배송주소 배송 방법 주문일 
			String str1 = (String)session.getAttribute("sessionID");
			String str2 = (String)session.getAttribute("cartp");
			String str3 = (String)session.getAttribute("insurances");
			String str4 = (String)session.getAttribute("installments");
			String str5 = (String)session.getAttribute("cash");
			String str6 = (String)session.getAttribute("address");
			String str7 = (String)session.getAttribute("shipping");
			pst = conn.prepareStatement(
				"INSERT INTO ordersss values (?, ?, ?, ?, ?, ?, ?, sysdate)");
			pst.setString(1,str1);
			pst.setString(2,str2);
			pst.setString(3, str3);
			pst.setString(4, str4);
			pst.setString(5, str5);
			pst.setString(6, str6);
			pst.setString(7, str7);
			pst.executeUpdate();
			// transaction을 commit한다.
			conn.commit();
		} catch(Throwable e) {
			if (conn != null) {
				try {
					// transaction을 rollback한다.
					conn.rollback();
				} catch(SQLException ex) {}
			}
			occuredException = e;
		} finally {
			// 사용했던 자원은 반납한다.
			// 자원 반납도 익셉션이 발생할 수 있어 try-catch 처리한다. 
			if (st != null)
				try { st.close(); } catch(SQLException ex) {}
			if (pst != null)
				try { pst.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	%>
	<html>
	<head><title>주문 완료</title>
	<script type="text/javascript">
        function go_main(){
            location.href="../order/test.jsp";
        }
    </script>
	</head>
	<body>
		<h1>주문완료</h1><BR><BR>
		<table width="100%" border="0" cellpadding = "5px">
		<tr style = "background-color:skyblue;">
		<td>주문 아이디</td><td>주문 차종</td><td>주문 보험번호</td>
		<td>할부종류</td><td>현금결제</td><td>배송주소</td><td>배송방법</td>
		</tr>
		<tr>
		<td><%= session.getAttribute("sessionID")%></td>
		<td><%= session.getAttribute("cartp") %></td>
		<td><%= session.getAttribute("insurances") %></td>
		<td><%= session.getAttribute("installments") %></td>
		<td><%= session.getAttribute("cash") %>
		<td><%= session.getAttribute("address") %></td>
		<td><%= session.getAttribute("shipping") %>
		</tr></table>
		<input type="button" value="메인화면으로 돌아가기" onclick="go_main()" />
	</body>
	</html>