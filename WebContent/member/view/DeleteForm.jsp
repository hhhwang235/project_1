<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>Ż�� ȭ��</title>
    <link href='../../css/font.css' rel='stylesheet' type='text/css'/>
    <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue;
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
        .box1{
  	text-align:right;
	}
    </style>
    
    <script type="text/javascript">
        // ��й�ȣ ���Է½� ���â
        function checkValue(){
            if(!document.deleteform.password.value){
                alert("��й�ȣ�� �Է����� �ʾҽ��ϴ�.");
                return false;
            }
        }
        function go_user() {
        	location.href="UserInfoForm.jsp";
        }
        function logoutPro(){
            location.href="../../member/pro/LogOutPro.jsp";
        }	
    </script>
    
</head>
<body>
 <div class="box1">
       <font color="red"><%=session.getAttribute("sessionID") %></font>
        �� �α��εǾ����ϴ�.
        <input type="button" value="�α׾ƿ�" onclick="logoutPro()" />
        </div>
    
    <b><p id="font">��� ��ȣ�� �Է��� �ּ���.</p></b>
    <br><br><br>
 
    <form name="deleteform" method="post" action="../pro/DeletePro.jsp"
        onsubmit="return checkValue()">
 
        <table>
            <tr>
                <td bgcolor="skyblue">��й�ȣ</td>
                <td><input type="password" name="password" maxlength="50"></td>
            </tr>
        </table>
        
        <br> 
        <input type="button" value="���" onclick="go_user()">
        <input type="submit" value="Ż��" /> 
    </form>
</body>
</html>