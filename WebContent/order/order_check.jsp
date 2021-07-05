<%@ page contentType = "text/html; charset=utf-8" pageEncoding="utf-8"%>
	<% request.setCharacterEncoding("utf-8");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>확정 페이지</title>
<style>
    	.box1{
  	text-align:right;
	}
    </style>
<script type="text/javascript">
	function go_order(){
        location.href="Oreders.jsp";
    }	
	function go_cart(){
        location.href="cart.jsp";
    }
	
    </script>
</head>
<body>
<div class="box1">
       <font color="red"><%=session.getAttribute("sessionID") %></font>
        님 로그인되었습니다.
        <input type="button" value="로그아웃" onclick="logoutPro()" />
        </div>
	<%//@@@@@@@@@@@@ 배송주소 저장 %>
	<%session.setAttribute("address", request.getParameter("shipping_address")); %>
	
	<h1>둘 중 하나를 선택하세요</h1></font>
	<input type="button" value="주문 확정 하기" onclick="go_order()" />
	
	<input type="button" value="장바구니 담기" onclick="go_cart()" /><br><br><br>
	<font color="red"><p>한번 확정된 후 철회 할 수 없으니 신중히 골라주세요.</p></font>
</body>
</html>