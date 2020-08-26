<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head>
<title>    반찬 등록       </title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
</head>
<body>

<%
	request.setCharacterEncoding("euc-kr");

	String name = request.getParameter("name");   
	String price = request.getParameter("price");
	String cal = request.getParameter("cal");
	String mass = request.getParameter("mass");
	String description = request.getParameter("description");
	String imgPath = request.getParameter("imgPath");

 	 String DB_URL="jdbc:mysql://localhost:3306/project9";  
     String DB_ID="multi";  
     String DB_PASSWORD="abcd"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "INSERT INTO products (name, price, cal, mass, description, imgPath) VALUES (?,?,?,?,?,?)";	

	 PreparedStatement pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1,name);
	 pstmt.setString(2,price);
	 pstmt.setString(3,cal);
	 pstmt.setString(4,mass);
	 pstmt.setString(5,description);
	 pstmt.setString(6,imgPath);

	 pstmt.executeUpdate();
%>

<center>
	반찬이 등록되었습니다.<br>
	<a href="product.html">HOME</a>
</center>

</body>
</html>