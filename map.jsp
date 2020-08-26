<%@ page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/map.css">
    <link rel="stylesheet" type="text/css" href="css/menu.css">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script>
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map_canvas'), {
                center: {lat: 36.909129, lng: 127.144395},
                zoom: 16
            });
            var marker = new google.maps.Marker({
                position: {lat: 36.909129, lng: 127.144395},
                map: map,
                title: '초시락'
            });
        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDT7sSTMO5sgyqu_1l0KuaIK_QAyv0U44c&callback=initMap"
            async defer></script>
</head>
<body>
<div id="wrap2">
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
    <div id="container2">
        <div id="map">
            <h2 id="title">매장 안내</h2>
            <div id="map_canvas" style="width: 100%; height: 400px;"></div>
        </div>
        <div id="content">
            <h2 id="title">오시는 길</h2>
            <div id="navi">
                <p id="naviTitle">대중 교통</p>
                <p id="naviContent">성환역 1번출구 -> 셔틀버스 탑승 -> 셔틀버스 하차</p>
            </div>
            <div id="naviImg">
                <img src="images/naviImg.png" width="600px">
            </div>
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