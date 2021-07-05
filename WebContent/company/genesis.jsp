<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>제네시스 차 소개</title>
<link href='../css/font.css' rel='stylesheet' type='text/css'/>
<script type="text/javascript">
        function go_company(){
        	location.href="Company.jsp";
        }
</script>        
</head>
<p id="font">제네시스의 대표 세그먼트<p>
<input type="button" value="뒤로 가기" onclick="go_company()" />
<body>
	<table width="100%" border="0" cellpadding = "10px">
	<tr style = "background-color:skyblue;">
		<td>사진</td><td>차종</td><td>설명</td>
	</tr>
	
	<tr>
	<td><img src="../img/g80.jpg" width= "300" height = "150"></td>
	<td>G80</td>
	<td>제네시스의 후륜구동/4륜구동 방식의 준대형 세단.</td>
	</tr>

</body>
</html>