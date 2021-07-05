<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="jsp.member.model.MemberDAO" %>    
<%@ page import="jsp.member.model.MemberBean" %>
<html>
<head>
    <%
        String id = session.getAttribute("sessionID").toString();
    
        MemberDAO dao = MemberDAO.getInstance();
        MemberBean memberBean = dao.getUserInfo(id);
    %>
 
    <title>ȸ������ ����ȭ��</title>
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
	.box2{
  	text-align:center;
	}
    </style>
    
    <script type="text/javascript">
    
        function init(){
            setComboValue("<%=memberBean.getMail2()%>");
        }
 
        function setComboValue(val) 
        {
            var selectMail = document.getElementById('mail2'); // select ���̵� �����´�.
            for (i = 0, j = selectMail.length; i < j; i++)  // select �ϴ� option ����ŭ �ݺ��� ������.
            {
                if (selectMail.options[i].value == val)  // �ԷµȰ��� option�� value�� ������ ��
                {
                    selectMail.options[i].selected = true; // ��������� üũ�ǵ��� �Ѵ�.
                    break;
                }
            }
        }
        
        // ��й�ȣ �Է¿��� üũ
        function checkValue() {
            if(!document.userInfo.password.value){
                alert("��й�ȣ�� �Է��ϼ���.");
                return false;
            }
        }
        function logoutPro(){
            location.href="../../member/pro/LogOutPro.jsp";
        }	
    	function go_main(){
    		location.href="UserInfoForm.jsp"
        }
    </script>
    
</head>
<body onload="init()">
 <div class="box1">
       <font color="red"><%=session.getAttribute("sessionID") %></font>
        �� �α��εǾ����ϴ�.
        <input type="button" value="�α׾ƿ�" onclick="logoutPro()" />
        </div>
        <br><br>
         <b><p id="font">ȸ������ ����</p></b>
        <br>
        
        <!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
        <!-- ��(�Ķ����) ������ POST ��� -->
        <form method="post" action="../pro/ModifyPro.jsp" 
                name="userInfo" onsubmit="return checkValue()">
                
            
            <br><br>    
            <table>
 				
 				<tr>
                    <td id="title">���̵�</td>
                    <td ><%=memberBean.getId() %></td>
                </tr>
                <tr>
                    <td id="title">��й�ȣ</td>
                    <td>
                        <input type="password" name="password" maxlength="50">
                    </td>
                </tr>
 				
                <tr>
                    <td id="title">�̸�</td>
                    <td><%=memberBean.getName() %></td>
                </tr>
                    
                <tr>
                    <td id="title">����</td>
                    <td><%=memberBean.getGender()%></td>
                </tr>
                    
                <tr>
                    <td id="title">����</td>
                    <td>
                        <%=memberBean.getBirthyy() %>�� 
                        <%=memberBean.getBirthmm() %>�� 
                        <%=memberBean.getBirthdd() %>��
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">�̸���</td>
                    <td>
                        <input type="text" name="mail1" maxlength="50" 
                            value="<%=memberBean.getMail1() %>">
                        @
                        <select name="mail2" id="mail2">
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net" >daum.net</option>
                            <option value="nate.com">nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">�޴���ȭ</td>
                    <td>
                        <input type="text" name="phone" value="<%=memberBean.getPhone() %>"/>
                    </td>
                </tr>
                <tr>
                    <td id="title">�ּ�</td>
                    <td>
                        <input type="text" size="50" name="address"
                            value="<%=memberBean.getAddress() %>"/>
                    </td>
                </tr>
            </table>
            
            <font color="red"><p class="box2">�̸���, �޴���ȭ, �ּ� �����: &nbsp;&nbsp;���� ��й�ȣ �Է�<br>
            	                                                                  ��й�ȣ �����: &nbsp;&nbsp;���� ������ ��й�ȣ �Է�</p></font><br><br>
            <input type="button" value="���" onclick="go_main()">
            <input type="submit" value="����"/>  
        </form>
        
</body>
</html>