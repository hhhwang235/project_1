<%@ page contentType = "text/html; charset=utf-8" pageEncoding="utf-8"%>
	<% request.setCharacterEncoding("utf-8");  %>
	<html>
	<head><title>배송 주소 페이지</title>
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
    </script>
	</head>
	<body>
	<div class="box1">
       <font color="red"><%=session.getAttribute("sessionID") %></font>
        님 로그인되었습니다.
        <input type="button" value="로그아웃" onclick="logoutPro()" />
        </div>
	
	<%//@@@@@@@@@@@@@@배송방법저장 %>
	<%session.setAttribute("shipping", request.getParameter("ship")); %>
	
	 <input type="button" value="구매 취소" onclick="go_main()" />
        <p id="font">배송 주소를 입력하세요</p><br>
	<form action = "../order/order_check.jsp" method = "post">
     <input type = "text" name = "shipping_address" value = "배송주소 입력"><br><br>
	<input type = "submit" value = "선택사항 확정">
	<br><br>
	</form>
	</body>
	</html>