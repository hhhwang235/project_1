<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="jsp.member.model.MemberDAO" %>    
<%@ page import="jsp.member.model.MemberBean" %>
<%@ page import="jsp.member.model.Sha256" %>    
<html>
<head>
<style type="text/css">
.box1{
  	text-align:right;
	}
	</style>
    <title>ȸ�� ���� ó��</title>
    <link href='../../css/font.css' rel='stylesheet' type='text/css'/>
     <script type="text/javascript">
    function go_main() {
        	location.href="../../MainForm.jsp";
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
    <%
        String id= (String)session.getAttribute("sessionID"); 
        String pw = Sha256.encrypt(request.getParameter("password"));
        
        // ���ǿ��� ���̵�, DeleteForm.jsp���� �Է¹��� ��й�ȣ�� �����´�.
        // ������ ����� ������ ȸ�������� �����Ѵ�. - ��������� ��ȯ
        MemberDAO dao = MemberDAO.getInstance();
        int check = dao.deleteMember(id, pw);
        
        if(check == 1){
            session.invalidate(); // �����ߴٸ� ���������� �����Ѵ�.
    %>
        <br><br>
        <font id="font">ȸ�������� �����Ǿ����ϴ�!</font>
        <br><br><br>
    
        <input type="button" value="Ȯ��" onclick="go_main()">
    
    <%    
         // ��й�ȣ�� Ʋ����� - ������ �ȵǾ��� ���
        }else{
    %>
        <script>
            alert("��й�ȣ�� ���� �ʽ��ϴ�.");
            history.go(-1);
        </script>
    <%
        } 
    %>
</body>
</html>