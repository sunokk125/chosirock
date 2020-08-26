<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>회원 정보 삭제 완료</title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet"></head>
<body>

<%
	request.setCharacterEncoding("euc-kr");
 	 String DB_URL="jdbc:mysql://localhost:3306/project9";  
    String DB_ID="multi";  
    String DB_PASSWORD="abcd";  
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	 int key = Integer.parseInt(request.getParameter("oid"));
	 
     String jsql = "delete from orders_products where oid= ?";        
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 pstmt.setInt(1, key);
	
 	 pstmt.executeUpdate();

	 String jsql2 = "delete from orders where oid=?";

	 PreparedStatement pstmt2 = con.prepareStatement(jsql2);

	 pstmt2.setInt(1,key);

	 pstmt2.executeUpdate();
%>
 <jsp:forward page="selectAllOrder.jsp"/>
 		
<%
%>
</body>
</html>