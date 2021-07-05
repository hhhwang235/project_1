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
 
    <title>회원정보 수정화면</title>
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
            var selectMail = document.getElementById('mail2'); // select 아이디를 가져온다.
            for (i = 0, j = selectMail.length; i < j; i++)  // select 하단 option 수만큼 반복문 돌린다.
            {
                if (selectMail.options[i].value == val)  // 입력된값과 option의 value가 같은지 비교
                {
                    selectMail.options[i].selected = true; // 같은경우라면 체크되도록 한다.
                    break;
                }
            }
        }
        
        // 비밀번호 입력여부 체크
        function checkValue() {
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
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
        님 로그인되었습니다.
        <input type="button" value="로그아웃" onclick="logoutPro()" />
        </div>
        <br><br>
         <b><p id="font">회원정보 수정</p></b>
        <br>
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식 -->
        <form method="post" action="../pro/ModifyPro.jsp" 
                name="userInfo" onsubmit="return checkValue()">
                
            
            <br><br>    
            <table>
 				
 				<tr>
                    <td id="title">아이디</td>
                    <td ><%=memberBean.getId() %></td>
                </tr>
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="password" maxlength="50">
                    </td>
                </tr>
 				
                <tr>
                    <td id="title">이름</td>
                    <td><%=memberBean.getName() %></td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td><%=memberBean.getGender()%></td>
                </tr>
                    
                <tr>
                    <td id="title">생일</td>
                    <td>
                        <%=memberBean.getBirthyy() %>년 
                        <%=memberBean.getBirthmm() %>월 
                        <%=memberBean.getBirthdd() %>일
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이메일</td>
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
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" name="phone" value="<%=memberBean.getPhone() %>"/>
                    </td>
                </tr>
                <tr>
                    <td id="title">주소</td>
                    <td>
                        <input type="text" size="50" name="address"
                            value="<%=memberBean.getAddress() %>"/>
                    </td>
                </tr>
            </table>
            
            <font color="red"><p class="box2">이메일, 휴대전화, 주소 변경시: &nbsp;&nbsp;현재 비밀번호 입력<br>
            	                                                                  비밀번호 변경시: &nbsp;&nbsp;새로 설정할 비밀번호 입력</p></font><br><br>
            <input type="button" value="취소" onclick="go_main()">
            <input type="submit" value="수정"/>  
        </form>
        
</body>
</html>