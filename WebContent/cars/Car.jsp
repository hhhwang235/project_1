<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ڵ��� �׸�</title>
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
        function go_options(){
            location.href="options.jsp";
        }
    </script>
</head>
<body>
<div class="box1">
       <font color="red"><%=session.getAttribute("sessionID") %></font>
        �� �α��εǾ����ϴ�.
        <input type="button" value="�α׾ƿ�" onclick="logoutPro()" />
        </div>
        <input type="button" value="����ȭ��" onClick="go_main()" />
        <BR><BR><BR>
        
        <table width="100%" border="0">
        <tr><td>ALL_NEW_AVANTE</td><td>THE_NEW_GRANDURE</td><td>K7</td><td>K5</td></tr>
			<!-- �̹��� �߰� -->
			<tr><td>
			<a href = "Avante.jsp">
            <img src="../img/avante.jpg" width= "200" height = "150">
            </a></td>
            <td><a href = "Grandure.jsp">
            <img src="../img/grandure.jpg" width= "200" height = "150">
             </a></td>
             <td><a href = "k7.jsp">
            <img src="../img/k7.jpg" width= "200" height = "150">
             </a></td>
             <td><a href = "k5.jsp">
            <img src="../img/k5.jpg" width= "200" height = "150">
             </a></td></tr>
             <tr><td>G80</td><td>SORENTO</td><td>CARNIVAR</td><td></td></tr>
             <tr><td>
             <a href = "g80.jsp">
            <img src="../img/g80.jpg" width= "200" height = "150">
             </a></td>
          
              <td><a href = "sorento.jsp">
            <img src="../img/sorento.jpg" width= "200" height = "150">
             </a></td>
              
             <td><a href = "carnivar.jsp">
            <img src="../img/carnivar.jpg" width= "200" height = "150">
             </a></td>
             <td>
            <input type="button" value="�ɼǼ���" onclick="go_options()" />
           </td>
             </tr>
             </table>
</body>
</html>