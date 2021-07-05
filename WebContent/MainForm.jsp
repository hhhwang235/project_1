<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
<html>
<head>
    <title>���� ȭ��</title>
    
    
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
        if(session.getAttribute("sessionID") == null) // �α����� �ȵǾ��� ��
        { 
            // �α��� ȭ������ �̵�
            response.sendRedirect("member/view/LoginForm.jsp");
        }
        else // �α��� ���� ���
        {
    %>
    
    <span style="display: inline-block; width: 100%; text-align: right;">
       <font color="red"><%=session.getAttribute("sessionID") %></font>
        �� �α��εǾ����ϴ�.
        <input type="button" value="�α׾ƿ�" onclick="logoutPro()" />
        </span>
    
    <div class = 'nav'>
    <input type="button" value="����ȸ�� �Ұ�" onclick="go_company()" />
    <input type="button" value="���� ����" onclick="go_car()" />
    <input type="button" value="�ֹ�/��ٱ���" onclick="go_order()" />
    <input type="button" value="�ֹ� ���� ����" onclick="go_info()" />
    <input type="button" value="ȸ����������/����" onclick="test()" />
    <input type="button" value="��ٱ��� ����" onclick="go_cart()" />
    <input type="button" value="��ä ���Ժ� �˾ƺ���" onclick="go_bond()" />
    <input type="button" value="�� ��ϼ� �˾ƺ���" onclick="go_enrollment_tax()" />
    <input type="button" value="���� ���" onclick="go_grade()" />
    <%} %> 
    </div>
    <div class = 'nav2'>
    	<br><br>Hī ���� ������ ������ �ϰ� ��󺸼���!<br>
    	</div>
    <div class = 'nav3'>
     	Hī�� �����ϰ��� �ϴ� �����в� ������ ���� �ֽ��ϴ�!
    </div>
   </div>
</body>
</html>