<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
	<head><title>반찬 정보 수정 완료</title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet"></head>
	<body>

<%
	 request.setCharacterEncoding("euc-kr");

	
	String pid = request.getParameter("pid");
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

	 String jsql = "update products set name=?, price=?,cal=?, mass=?, description=?, imgPath=? where pid=? ";	
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,name);
	 pstmt.setString(2,price);
	 pstmt.setString(3,cal);
	 pstmt.setString(4,mass);
	 pstmt.setString(5,description);
	 pstmt.setString(6,imgPath);
	 pstmt.setString(7,pid);

	 pstmt.executeUpdate();

	 String jsql2 = "select * from products where pid=?";
	 PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	 pstmt2.setString(1,pid);

	 ResultSet rs = pstmt2.executeQuery();
	 rs.next();
%>
<center>
<br><br><br>
<font color="blue" size='6'><b>[수정된 반찬 정보 내역]</b></font><p>
	<table>
		<tr>
			<td width=100>반찬명 : </td>
			<td width=300><%=rs.getString("name")%></td>
		</tr>
		<tr>
			<td>반찬설명 : </td>
			<td><%=rs.getString("description")%></td>
		</tr>
		<tr>
			<td>열량 : </td>
			<td><%=rs.getString("cal")%></td>
		</tr>
		<tr>
			<td>제공량(g) : </td>
			<td><%=rs.getString("mass")%></td>
		</tr>
		<tr>
			<td>가격 : </td>
			<td><%=rs.getString("price")%></td>
		</tr>
		<tr>
			<td>이미지 : </td>
			<td><%=rs.getString("imgPath")%></td>
		</tr>
	</table>
	<a href="selectAllProduct.jsp">반찬 조회 페이지로</a>
</center>
</body>
</html>