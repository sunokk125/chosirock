<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/order.css">
    <link rel="stylesheet" type="text/css" href="css/menu.css">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
</head>
<body>

<%	
	request.setCharacterEncoding("euc-kr");
	String uid = (String)session.getAttribute("sid");
	String oname = request.getParameter("oname");
	String ozipcode = request.getParameter("zipcode");
	String oaddress1 = request.getParameter("address1");
	String oaddress2 = request.getParameter("address2");
	int oprice = Integer.parseInt(request.getParameter("oprice"));
	int oquantity = Integer.parseInt(request.getParameter("oquantity"));
	int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
	String ocardKind = request.getParameter("ocardKind");
	String ocardNum = request.getParameter("ocardNum");
	String[] dishArr= request.getParameterValues("dish");
	
	String DB_URL="jdbc:mysql://localhost:3306/project9";  
    String DB_ID="multi";  
    String DB_PASSWORD="abcd"; 
 	 
	Class.forName("org.gjt.mm.mysql.Driver"); 
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String jsql = "INSERT INTO orders (uid,oname,ozipcode,oaddress1,oaddress2,oprice,oquantity,totalPrice,ocardKind,ocardNum) VALUES (?,?,?,?,?,?,?,?,?,?)";	

	PreparedStatement pstmt  = con.prepareStatement(jsql);
	pstmt.setString(1,uid);
	pstmt.setString(2,oname);
	pstmt.setString(3,ozipcode);
	pstmt.setString(4,oaddress1);
	pstmt.setString(5,oaddress2);
	pstmt.setInt(6,oprice);
	pstmt.setInt(7,oquantity);
	pstmt.setInt(8,totalPrice);
	pstmt.setString(9,ocardKind);
	pstmt.setString(10,ocardNum);


	pstmt.executeUpdate();

	String jsql2="select max(oid) as oid from orders where uid=?";

	PreparedStatement pstmt2  = con.prepareStatement(jsql2);
	pstmt2.setString(1,uid);

	ResultSet rs2 = pstmt2.executeQuery();
	rs2.next();

	int oid = rs2.getInt("oid");

	for(int i=0; i<dishArr.length; i++){
		String jsql3 = "INSERT INTO orders_products (oid,pid) VALUES (?,?)";
		PreparedStatement pstmt3  = con.prepareStatement(jsql3);
		pstmt3.setInt(1,oid);
		pstmt3.setInt(2,Integer.parseInt(dishArr[i]));

		pstmt3.executeUpdate();
	}

%>
<div id="wrap2">
    <div id="container1">
        <div id="header">
		<%
			String id = (String)session.getAttribute("sid");

			if(id == null){
		%>
            <a href="join.jsp"> ȸ������ </a> | <a href="login.jsp"> �α��� </a>
		<%
			}else{
		%>
			<a href="mypage.jsp"> ���������� </a> | <a href="logout.jsp">�α׾ƿ�</a>
		<%
			}	
		%>
		
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
            <span id="title">1. ���� �� ���� > </span>

            <span id="title">2. ���� ���� > </span>

            <span id="title">3. ����� ���� > </span>

            <span id="title"><b>4. ���� �Ϸ� </b></span>
        </div>
        <div id="content">
			�ֹ��� �Ϸ�Ǿ����ϴ�<br>
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