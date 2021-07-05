<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- 자바빈 클래스 import --%>      
<%@ page import="jsp.member.model.MemberBean" %>  
<%-- DAO import --%>   
<%@ page import="jsp.member.model.MemberDAO" %> 
<%@ page import="jsp.member.model.Sha256" %> 
    
<html>
<head>
    <title>회원정보 수정처리</title>
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
        님 로그인되었습니다.
        <input type="button" value="로그아웃" onclick="logoutPro()" />
        </div>
		<%request.setCharacterEncoding("euc-kr");  %>
	<%String password = Sha256.encrypt(request.getParameter("password"));%>
    <%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="memberBean" class="jsp.member.model.MemberBean" />
    <jsp:setProperty property="*" name="memberBean"/>  
    <jsp:setProperty property="password" name="memberBean" value="<%=password%>"/>
  	<jsp:setProperty property="mail1" name="memberBean"/>  
  	<jsp:setProperty property="mail2" name="memberBean"/>  
  	<jsp:setProperty property="phone" name="memberBean"/>  
  	<jsp:setProperty property="address" name="memberBean"/>  
    <%
        // 세션에서 아이디를 가져와 MemberBean에 세팅한다.
        String id= (String)session.getAttribute("sessionID"); 
        memberBean.setId(id);
    
        // 수정할 회원정보를 담고있는 MemberBean을 DAO로 전달하여 회원정보 수정을 한다.
        MemberDAO dao = MemberDAO.getInstance();
        dao.updateMember(memberBean);
    %>
    
    <br><br>
    <font id="font">회원정보가 수정되었습니다!</font>
    <br><br>
    <input type="button" value="메인으로" onclick="go_main()"/>
    
</body>
</html>