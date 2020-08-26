<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title> 반찬 수 선택   </title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet"></head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
 	String DB_URL="jdbc:mysql://localhost:3306/project9";  
    String DB_ID="multi";  
    String DB_PASSWORD="abcd"; 
 	 
	Class.forName("org.gjt.mm.mysql.Driver"); 
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String oid = request.getParameter("oid");

    String jsql = "select count(*) from orders_products where oid = ?";   
	PreparedStatement  pstmt = con.prepareStatement(jsql);
	pstmt.setString(1,oid);
	ResultSet  rs = pstmt.executeQuery();
	rs.next();

	int count = rs.getInt("count(*)");
%>
<center>
<font color="blue" size='6'><b>[반찬 수 선택]   </b></font><p>
<form action="updateProductChoice.jsp" method="post">
<table>
	<tr>
		<td>반찬 수 입력 : </td>
		<td><input type="text" name="count" value="<%=count%>"><input type="hidden" name="oid" value="<%=oid%>"></td>
	</tr>
</table>
<input type="submit" value="다  음">
</form>

</body>
</html>