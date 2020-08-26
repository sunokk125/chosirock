<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/mypage.css">
    <link rel="stylesheet" type="text/css" href="css/menu.css">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
 	String DB_URL="jdbc:mysql://localhost:3306/project9";  
    String DB_ID="multi";  
    String DB_PASSWORD="abcd";  
 	 
	Class.forName("org.gjt.mm.mysql.Driver");  
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	String id = (String)session.getAttribute("sid");

	String jsql = "delete orders_products from orders_products left join orders on orders.oid=orders_products.oid where uid =?";        
	PreparedStatement  pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, id);
 	
	pstmt.executeUpdate();

	String jsql2 = "delete from orders where uid=?";        
	PreparedStatement  pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, id);
	
 	pstmt2.executeUpdate();
	 
    String jsql3 = "delete from users where id=?";        
	PreparedStatement  pstmt3 = con.prepareStatement(jsql3);
	pstmt3.setString(1, id);
	
 	pstmt3.executeUpdate();

	session.invalidate();
%>
<div id="wrap2">
    <div id="container1">
        <div id="header">
            <a href="join.jsp"> ȸ������ </a> | <a href="login.jsp"> �α��� </a>
        </div>
        <div id="nav">
            <a href="index.jsp"><img src="images/logo.png" id="logo"></a>
            <ul>
                <li><a href="about.jsp">ABOUT</a></li>
                <li><a href="introProduct.jsp">�����Ұ�</a></li>
                <li><a href="map.jsp">������ġ</a></li>
                <li><a href="countChoice.jsp">���ö� ����</a></li>
            </ul>
        </div>
    </div>
    <div id="container2">
        <div id="contentTitle">
            <h2 id="title">ȸ�� Ż��</h2>
        </div>
        <div id="content">
			ȸ�� Ż�� �Ϸ�Ǿ����ϴ�.<br>
			<a href="index.jsp">HOME</a>
        </div>
    </div>
    <div id="footer">
        COPYRIGHT 2019 choosirock CO. LTD. ALL RIGHTS RESERVED.
        ������ 041-777-7777<br>
        AM10:00 ~ PM 18:00 / LUNCH PM 12:00 ~ 13:00<br>
        SAT , SUN , HOLLYDAY OFF<br>
        �ּ� : ��û���� õ�Ƚ� ���ϱ� ��ȯ�� ���з� 91 | <a href="manager_login.html">������ �α���</a>
    </div>
</div>

</body>
</html>