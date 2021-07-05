<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
<html>
<head>
    <title>메인 화면</title>
    
    
    <style>
		.nav{
			display:flex;
			}
		.nav2{
			text-align:center;
			font-size:40px;
		}
		.nav3{
			text-align:center;
			font-size:20px;
		}
		.container {
  			width: 100%;
  			height: 100%;
  			text-align: center;
  			position: relative;
  			background-repeat: no-repeat;
  			background-size : cover;
  			z-index: 1;
			}
		.container::after {
  			width: 100%;
  			height: 100%;
  			content: "";
  			background: url("img/back.jpg");
  			position: absolute;
  			background-repeat: no-repeat;
  			background-size : cover;
  			top: 0;
  			left: 0;
  			z-index: -1;
  			opacity: 0.1;
			}
		
    </style>
    <script type="text/javascript">
        function logoutPro(){
            location.href="member/pro/LogOutPro.jsp";
        }
        function go_car(){
            location.href="cars/Car.jsp";
        }
        function go_order(){
            location.href="cars/Order.jsp";
        }
        function go_info(){
            location.href="order/Information.jsp";
        } 
        function go_company(){
            location.href="company/Company.jsp";
        }
        function go_infom(){
            location.href="member_info/member_info.jsp";
        }
        function go_cart(){
        	location.href="order/member_cart.jsp";
        }
        function go_bond(){
        	location.href="tax/bond_tax.jsp";
        }
        function go_enrollment_tax(){
        	location.href="tax/enrollment_tax.jsp";
        } 
        function go_grade(){
        	location.href="member/grade.jsp";
        } 
        function test(){
        	location.href="/Project/member/view/UserInfoForm.jsp";
        } 
    </script>
</head>
<body>
<div class = 'container'>
    <%
        if(session.getAttribute("sessionID") == null) // 로그인이 안되었을 때
        { 
            // 로그인 화면으로 이동
            response.sendRedirect("member/view/LoginForm.jsp");
        }
        else // 로그인 했을 경우
        {
    %>
    
    <span style="display: inline-block; width: 100%; text-align: right;">
       <font color="red"><%=session.getAttribute("sessionID") %></font>
        님 로그인되었습니다.
        <input type="button" value="로그아웃" onclick="logoutPro()" />
        </span>
    
    <div class = 'nav'>
    <input type="button" value="차량회사 소개" onclick="go_company()" />
    <input type="button" value="제원 보기" onclick="go_car()" />
    <input type="button" value="주문/장바구니" onclick="go_order()" />
    <input type="button" value="주문 내역 보기" onclick="go_info()" />
    <input type="button" value="회원정보수정/삭제" onclick="test()" />
    <input type="button" value="장바구니 보기" onclick="go_cart()" />
    <input type="button" value="공채 매입비 알아보기" onclick="go_bond()" />
    <input type="button" value="취 등록세 알아보기" onclick="go_enrollment_tax()" />
    <input type="button" value="나의 등급" onclick="go_grade()" />
    <%} %> 
    </div>
    <div class = 'nav2'>
    	<br><br>H카 에서 마음껏 쇼핑을 하고 골라보세요!<br>
    	</div>
    <div class = 'nav3'>
     	H카는 구매하고자 하는 여러분께 언제나 열려 있습니다!
    </div>
   </div>
</body>
</html>