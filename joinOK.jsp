<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/join.css">
    <link rel="stylesheet" type="text/css" href="css/menu.css">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
</head>
<body>

<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");   
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");

	String rrn1 = request.getParameter("rrn1");
	String rrn2 = request.getParameter("rrn2");

	String sex = request.getParameter("sex");

	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");

	String zipcode = request.getParameter("zipcode");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");



 	 String DB_URL="jdbc:mysql://localhost:3306/project9";  
     String DB_ID="multi";  
     String DB_PASSWORD="abcd"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "INSERT INTO users (id, name, password, rrn, sex, email, phone, zipcode ,address1,address2) VALUES (?,?,?,?,?,?,?,?,?,?)";	

	 PreparedStatement pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1,id);
	 pstmt.setString(2,name);
	 pstmt.setString(3,pwd);
	 pstmt.setString(4,rrn1+"-"+rrn2);
	 pstmt.setString(5,sex);
	 pstmt.setString(6,email1+"@"+email2);
	 pstmt.setString(7,phone1+"-"+phone2+"-"+phone3);
	 pstmt.setString(8,zipcode);
	 pstmt.setString(9,address1);
	 pstmt.setString(10,address2);

	 pstmt.executeUpdate();
%>
<div id="wrap2">
    <div id="container1">
        <div id="header">
            <a href="join.jsp"> 회원가입 </a> | <a href="login.jsp"> 로그인 </a>
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
        <div style="margin:200px">
			축하드립니다. 회원가입이 완료되었습니다.<br>
			<a href="login.jsp">로그인</a>
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