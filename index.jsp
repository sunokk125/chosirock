<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Choosirock</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/menu.css">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script>
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map_canvas'), {
                center: {lat: 36.909129, lng: 127.144395},
                zoom: 16
            });
            var marker = new google.maps.Marker({
                position : {lat:36.909129, lng:127.144395},
                map : map,
                title:'초시락'
            });
        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDT7sSTMO5sgyqu_1l0KuaIK_QAyv0U44c&callback=initMap"
            async defer></script>

</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
 	String DB_URL="jdbc:mysql://localhost:3306/project9";  
    String DB_ID="multi";  
    String DB_PASSWORD="abcd"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

%>
<div id="wrap">
    <div id="container1">
        <div id="header">
		<%
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
        <p>내 기호대로 만드는 도시락!<br><br> 취향대로 골라보세요!</p><br>
        <p><a href="countChoice.jsp">도시락 제작하러 가기 > </a></p>
    </div>
    <div id="container2">
        <div id="content1">
            <h2 id="title">많은 고객들이 찾아요!</h2>
		<%	
			String jsql = "select orders_products.pid,products.name,products.imgPath,count(*) from orders_products left join products on orders_products.pid=products.pid group by pid order by count(*) desc limit 4 ;";   
			PreparedStatement  pstmt = con.prepareStatement(jsql);
			ResultSet  rs = pstmt.executeQuery();
			
			if(rs.next()){
				rs.beforeFirst();
			while(rs.next()){

		%>
            <div id="product">
				<a href="detailProduct.jsp?pid=<%=rs.getString("pid")%>">
                <img src="images/<%=rs.getString("imgPath")%>.png">
                <div id="prdName"><%=rs.getString("name")%></div>
				</a>
            </div>
		
		<%
				}	
			}else{
				String jsql3 = "select * from products order by pdate limit 4 ;";   
				PreparedStatement  pstmt3 = con.prepareStatement(jsql3);
				ResultSet  rs3 = pstmt3.executeQuery();

				while(rs3.next()){
				%>
				<div id="product">
					<a href="detailProduct.jsp?pid=<%=rs3.getString("pid")%>">
					<img src="images/<%=rs3.getString("imgPath")%>.png">
					<div id="prdName"><%=rs3.getString("name")%></div>
					</a>
				</div>
				<%
				}
			}
		%>
        </div>
        <div id="content1">
            <h2 id="title">새롭게 찾아뵐 메뉴들입니다!</h2>
		<%
			
			String jsql2 = "select * from products order by pdate desc limit 4;";   
			PreparedStatement  pstmt2 = con.prepareStatement(jsql2);
			ResultSet  rs2 = pstmt2.executeQuery();

			while(rs2.next()){

		%>
            <div id="product">
				<a href="detailProduct.jsp?pid=<%=rs2.getString("pid")%>">
                <img src="images/<%=rs2.getString("imgPath")%>.png">
                <div id="prdName"><%=rs2.getString("name")%></div>
				</a>
            </div>
		<%
			}	
		%>
        </div>
    </div>
    <div id="keyimage2">
        <div id="container3">
            <div id="intro">
                <div id="introTitle">
                    든든한 한끼를 <br>위해 초시락이 <br>약속드립니다
                </div>
                <div id="introContent">
                    초시락은 바쁜 일상을 사는 현대인들을 위해 엄섬된 좋은 식재료만을
                    사용하여 대한민국을 대표하는 글로벌한 외식기업이 될 것을 약속드립니다.
                </div>
            </div>
        </div>
    </div>
    <div id="map">
        <h2 id="title">매장 안내</h2>
        <div id="map_canvas" style="width: 100%; height: 400px;"></div>
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