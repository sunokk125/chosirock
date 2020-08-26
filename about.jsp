<%@ page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>ABOUT</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/about.css">
    <link rel="stylesheet" type="text/css" href="css/menu.css">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
</head>
<body>
<div id="wrap">
    <div id="container1">
        <div id="header">
		<%
			request.setCharacterEncoding("euc-kr");
			String id = (String)session.getAttribute("sid");

			if(id == null){
		%>
            <a href="join.jsp"> 회원가입 </a> | <a href="login.jsp"> 로그인 </a>
		<%
			}else{
		%>
			<a href="mypage.jsp"> 마이페이지 </a> | <a href="logout.jsp">로그아웃</a>
		<%
			}	
		%>
		
        </div>
        <div id="nav">
            <a href="index.jsp"><img src="images/logo.png" id="logo"></a>
            <ul>
                <li><a href="about.jsp">ABOUT</a></li>
                <li><a href="introProduct.jsp">반찬소개</a></li>
                <li><a href="map.jsp">매장위치</a></li>
                <li><a href="countChoice.jsp">도시락 제작</a></li>
            </ul>
        </div>
    </div>
    <div id="keyimage1">
        <p>ABOUT</p>
    </div>
    <div id="container3">
        <div id="introLeft">
            <div id="introTitle">
                초시락의 시작
            </div>
            <div id="introContent">
                저희 CHOSI樂은 바쁜 일상속에서 밥을 잘 먹지못하는 현대인들에게 좋은 식사를 대접하고 싶었습니다.
                또한 자신의 기호에 맞는 반찬을 도시락으로 가지고 다닐 수 있도록 만들자는 생각에서 시작했습니다.
            </div>
        </div>
        <img src="images/brand_img2.jpg" id="introImg">
    </div>
    <div id="container3">
        <img src="images/brand_img.jpg" id="introImg">
        <div id="introRight">
            <div id="introTitle">
                갓 지은 진심 한 끼에는 <br>힘이 있습니다
            </div>
            <div id="introContent">
                초시락은 쌀의 맛과 가격을 위하여 정기적으로 전국 무세미 rpc의 쌀을 엄격한 테스트를 통하여 선정하고 있습니다. 불고기는 청정 호주산 S등급,
                A등급의 목심만 사용하여 엄격한 품질관리를 통해 최상의 품질을 유지합니다. 또한, 점주교육을 통해 외식업에 대한 철학을
                공유하며 따끈한 한 끼의 힘에 대해 늘 고민합니다. 무엇보다도 이 세상 누구보다 도시락을 사랑합니다.
            </div>
        </div>
    </div>
    <div id="container3">
        <h2 id="title">CHOSI樂의 장점</h2>
        <div id="content">
            <img src="images/point_01.png">
            <p>갓 지은 밥</p>
        </div>
        <div id="content">
            <img src="images/point_02.png">
            <p>쉐프 메이드</p>
        </div>
        <div id="content">
            <img src="images/point_03.png">
            <p>청결함</p>
        </div>
        <div id="content">
            <img src="images/point_05.png">
            <p>간단한 식사</p>
        </div>
    </div>
    <div id="footer">
        COPYRIGHT 2019 choosirock CO. LTD. ALL RIGHTS RESERVED.
        고객센터 041-777-7777<br>
        AM10:00 ~ PM 18:00 / LUNCH PM 12:00 ~ 13:00<br>
        SAT , SUN , HOLLYDAY OFF<br>
        주소 : 충청남도 천안시 서북구 성환읍 대학로 91 | <a href="manager_login.html">관리자 로그인</a>
    </div>
</div>
</body>
</html>