<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- �ڹٺ� Ŭ���� import --%>      
<%@ page import="jsp.member.model.MemberBean" %>  
<%-- DAO import --%>   
<%@ page import="jsp.member.model.MemberDAO" %> 
<%@ page import="jsp.member.model.Sha256" %> 
    
<html>
<head>
    <title>ȸ������ ����ó��</title>
    <link href='../../css/font.css' rel='stylesheet' type='text/css'/>
    <script type="text/javascript">
    function go_main() {
        	location.href="../../MainForm.jsp";
        }
    function logoutPro(){
        location.href="../../member/pro/LogOutPro.jsp";
    }	
    </script>
    <style type="text/css">
    .box1{
  	text-align:right;
	}
	</style>
</head>
<body>
<div class="box1">
       <font color="red"><%=session.getAttribute("sessionID") %></font>
        �� �α��εǾ����ϴ�.
        <input type="button" value="�α׾ƿ�" onclick="logoutPro()" />
        </div>
		<%request.setCharacterEncoding("euc-kr");  %>
	<%String password = Sha256.encrypt(request.getParameter("password"));%>
    <%-- �ڹٺ� ���� �׼��±� ��� --%>
    <jsp:useBean id="memberBean" class="jsp.member.model.MemberBean" />
    <jsp:setProperty property="*" name="memberBean"/>  
    <jsp:setProperty property="password" name="memberBean" value="<%=password%>"/>
  	<jsp:setProperty property="mail1" name="memberBean"/>  
  	<jsp:setProperty property="mail2" name="memberBean"/>  
  	<jsp:setProperty property="phone" name="memberBean"/>  
  	<jsp:setProperty property="address" name="memberBean"/>  
    <%
        // ���ǿ��� ���̵� ������ MemberBean�� �����Ѵ�.
        String id= (String)session.getAttribute("sessionID"); 
        memberBean.setId(id);
    
        // ������ ȸ�������� ����ִ� MemberBean�� DAO�� �����Ͽ� ȸ������ ������ �Ѵ�.
        MemberDAO dao = MemberDAO.getInstance();
        dao.updateMember(memberBean);
    %>
    
    <br><br>
    <font id="font">ȸ�������� �����Ǿ����ϴ�!</font>
    <br><br>
    <input type="button" value="��������" onclick="go_main()"/>
    
</body>
</html>