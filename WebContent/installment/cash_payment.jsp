<%@ page contentType = "text/html; charset=utf-8" pageEncoding="utf-8"%>
	<% request.setCharacterEncoding("utf-8");  %>
	<!DOCTYPE html>
	<html>
	<head><title>현금결제 여부 페이지</title>
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
	function checkValue(){
		var a = document.getElementById("aaa");
        if(a.value == "")
        {
            alert("값을 입력하세요");    
            return false;
        }else{
        	return true;
        }
    }
	
    </script>
	</head>
	<body>
	<%//@@@@@@@@@@@@@할부정보 저장 %>
	<%session.setAttribute("installments", request.getParameter("installment")); %>
	<div class="box1">
       <font color="red"><%=session.getAttribute("sessionID") %></font>
        님 로그인되었습니다.
        <input type="button" value="로그아웃" onclick="logoutPro()" />
        </div>
	<%String a; %>
	 <input type="button" value="구매 취소" onclick="go_main()" />
        <p id="font">결제하실 현금량을 입력하세요</p><br>
	<form action = "../shipping/ship.jsp" method = "post"
	onsubmit="return checkValue()">
	
     <input type = "text" id = "aaa" name = "cash_payment" value = "">&nbsp;&nbsp;만원<br><br>
     
	<input type = "submit" value = "배송 방법 고르기"><br><br>
	</form>
	</body>
	</html>