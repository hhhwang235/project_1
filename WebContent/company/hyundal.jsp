<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>현대자동차 차 소개</title>
<link href='../css/font.css' rel='stylesheet' type='text/css'/>
<script type="text/javascript">
        function go_company(){
        	location.href="Company.jsp";
        }
</script>        
</head>
<p id="font">현대 자동차의 대표 세그먼트<p>
<input type="button" value="뒤로 가기" onclick="go_company()" />
<body>
	<table width="100%" border="0" cellpadding = "10px">
	<tr style = "background-color:skyblue;">
		<td>사진</td><td>차종</td><td>설명</td>
	</tr>
	
	<tr>
	<td><img src="../img/avante.jpg" width= "300" height = "150"></td>
	<td>아반떼</td>
	<td>현대자동차의 전륜구동 준중형 세단이다.<br>공식적으로는 엘란트라의 2세대 모델부터 대한민국 국내에서의 시판 차명을 모두 통칭한다.<br>
	현대자동차의 차량 중 최초로 2014년 10월 통산 판매량 1천만 대를 넘어섰다.<br>즉, 한국산 차량 중 세계에서 가장 많은 판매량을 자랑하는 차종이라고 할 수 있다.</td>
	</tr>
	
	<tr>
	<td><img src="../img/grandure.jpg" width= "300" height = "150"></td>
	<td>그랜저</td>
	<td>현대자동차의 고급 준대형 세단이자 현대차의 플래그십 세단이다.<br>1986년에 처음 출시된 이래 현재까지 그 이름을 이어가고 있다.<br>
아반떼, 쏘나타와 함께 현대자동차를 대표하는 3대 세단 라인업 중 하나이다.</td>
	</tr>
</body>
</html>