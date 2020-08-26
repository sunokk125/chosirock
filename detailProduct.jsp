<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/product.css">
    <link rel="stylesheet" type="text/css" href="css/menu.css">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
</head>
<body>
<div id="wrap2">
<%
	request.setCharacterEncoding("euc-kr");
 	String DB_URL="jdbc:mysql://localhost:3306/project9";  
    String DB_ID="multi";  
    String DB_PASSWORD="abcd"; 
 	 
	Class.forName("org.gjt.mm.mysql.Driver"); 
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String key = request.getParameter("pid");

	String jsql = "select * from products where pid=?";
	 
	PreparedStatement  pstmt  = con.prepareStatement(jsql);
	pstmt.setString(1, key);

	ResultSet rs = pstmt.executeQuery();
	rs.next();

	String pid = rs.getString("pid");	
	String name = rs.getString("name");
    String description =  rs.getString("description");
    String cal =  rs.getString("cal");	
    String mass =  rs.getString("mass");
    String price =  rs.getString("price");
    String imgPath =  rs.getString("imgPath");

%>
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
    <div id="container2">
        <div id="contentTitle">
            <h2 id="title">상세 메뉴</h2>
        </div>
        <div id="content">
            <img src="images/<%=imgPath%>.png" width="250px" id="prdImage">
            <div id="prdIntro">
                <p id="prdName"><b>반찬명 : </b><%=name%></p>
				<br>
                <p id="prdPrice"><b>가  격 : </b><%=price%>원</p>
				<br>
                <p id="prdCal"><b>열  량(kcal) : </b><%=cal%>(kcal)</p>
				<br>
                <p id="prdMass"><b>제공량 (g) : </b><%=mass%>(g)</p>
				<br>
                <p id="prdDesc"><b>상품설명 :</b> <%=description%></p>
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