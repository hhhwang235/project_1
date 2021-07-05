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
    <title>회원 삭제 처리</title>
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
        님 로그인되었습니다.
        <input type="button" value="로그아웃" onclick="logoutPro()" />
        </div>
    <%
        String id= (String)session.getAttribute("sessionID"); 
        String pw = Sha256.encrypt(request.getParameter("password"));
        
        // 세션에서 아이디를, DeleteForm.jsp에서 입력받은 비밀번호를 가져온다.
        // 가져온 결과를 가지고 회원정보를 삭제한다. - 삭제결과를 반환
        MemberDAO dao = MemberDAO.getInstance();
        int check = dao.deleteMember(id, pw);
        
        if(check == 1){
            session.invalidate(); // 삭제했다면 세션정보를 삭제한다.
    %>
        <br><br>
        <font id="font">회원정보가 삭제되었습니다!</font>
        <br><br><br>
    
        <input type="button" value="확인" onclick="go_main()">
    
    <%    
         // 비밀번호가 틀릴경우 - 삭제가 안되었을 경우
        }else{
    %>
        <script>
            alert("비밀번호가 맞지 않습니다.");
            history.go(-1);
        </script>
    <%
        } 
    %>
</body>
</html>