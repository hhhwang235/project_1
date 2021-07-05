<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>기아 자동차 차 소개</title>
<link href='../css/font.css' rel='stylesheet' type='text/css'/>
<script type="text/javascript">
        function go_company(){
        	location.href="Company.jsp";
        }
</script>        
</head>
<p id="font">기아 자동차의 대표 세그먼트<p>
<input type="button" value="뒤로 가기" onclick="go_company()" />
<body>
	<table width="100%" border="0" cellpadding = "10px">
	<tr style = "background-color:skyblue;">
		<td>사진</td><td>차종</td><td>설명</td>
	</tr>
	
	<tr>
	<td><img src="../img/k7.jpg" width= "300" height = "150"></td>
	<td>K7</td>
	<td>기아자동차의 전륜구동 고급 준대형 세단. 기아자동차의 부활을 일으킨 K 시리즈 중 가장 먼저 출시된 선발주자이자 주력 모델이다.<br>
	그랜저가 50대의 중년층 구매가 많은 것과 달리, K7은 출시 초기부터 3~40대의, 상대적으로 젊은층 구매가 많다.<br>
	 이는 오랫동안 중장년층에게 사랑받아와 아빠차, 아저씨차 이미지가 강한 그랜저와 달리 조금 더 젊은 이미지를 가지고 있기 때문인 것으로 보인다.</td>
	</tr>
	
	<tr>
	<td><img src="../img/k5.jpg" width= "300" height = "150"></td>
	<td>K5</td>
	<td>기아자동차의 전륜구동 중형 세단. 로체의 후속 모델이다.</td>
	</tr>
	
	<tr>
	<td><img src="../img/sorento.jpg" width= "300" height = "150"></td>
	<td>쏘렌토</td>
	<td>현기아자동차의 전륜구동/4륜구동 중형 SUV.<br>2002년 2월 27일에 출시되었으며, 경기도 화성시 우정읍에 있는 기아자동차 화성공장에서 생산된다.<br>
	1세대부터 지금까지 기아자동차의 SUV 라인업을 지탱하는 모델 가운데 하나이다.</td>
	</tr>
	
	<tr>
	<td><img src="../img/carnivar.jpg" width= "300" height = "150"></td>
	<td>카니발</td>
	<td>기아자동차의 전륜구동 대형 MPV로, 기아자동차의 차세대 장수 브랜드 차량이다.<br>
	 1998년 1월 28일에 출시되어 경기도 광명시 소하동(기아자동차 소하리 공장)에서 생산된다.<br> 
	 기아자동차를 오랫동안 지탱해 왔던 3대장(봉고, 프라이드, 스포티지) 다음으로 카니발이 오랫동안 이어지고 있다.</td>
	</tr>
</body>
</html>