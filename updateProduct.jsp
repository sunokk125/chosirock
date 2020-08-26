<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>제품 정보 수정 </title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet"></head>
<body>

<%	 
	request.setCharacterEncoding("euc-kr");
 	String DB_URL="jdbc:mysql://localhost:3306/project9";  
    String DB_ID="multi";  
    String DB_PASSWORD="abcd";  
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	
	 String key = request.getParameter("pid");   
	 String jsql = "select * from products where pid = ?";
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,key);

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

<center>
<font color="blue" size='6'><b>[반찬 정보 수정] </b></font><p>
	<form method="post" action="updateProductResult.jsp">
	<table>
		<tr>
		<td>반찬명 : </td>
		<td><input type="hidden" name="pid" value="<%=pid%>"><input type="text" name="name" size=12 value="<%=name%>"></td>
	</tr>
	
	<tr>
		<td>가격 : </td>
		<td><input type="text" name="price" size=12 value="<%=price%>"></td>
	</tr>
	
	
	
	<tr>
		<td>칼로리 : </td>
		<td><input type="text" name="cal" size=12 value="<%=cal%>"></td>
	</tr>
	
	<tr>
		<td>제공량(g) : </td>
		<td><input type="text" name="mass" size=12 value="<%=mass%>"></td>
	</tr>
	
	<tr>
		<td>반찬 설명 : </td>
		<td><textarea name="description" rows="5" cols="30"><%=description%></textarea></td>
	</tr>

	
	<tr>
		<td>이미지 : </td>
		<td><input type="text" name="imgPath" size=12 value="<%=imgPath%>"></td>
	</tr>
		
		
	</table>
	<p><input type="submit" value=수정완료>
	</form>

</center>
</body>
</html>