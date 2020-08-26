<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>제품 상세 정보 조회   </title>
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

<center>
<font color="blue" size='6'><b>[반찬 상세정보 조회]    </b></font><p>
<table>
		<tr><td width=100>반찬명</td><td width=200><%=name%></td></tr>
		<tr><td>반찬설명</td><td><%=description%></td></tr>
		<tr><td>열량</td><td><%=cal%></td></tr>
		<tr><td>제공량(g)</td><td><%=mass%></td></tr>
		<tr><td>가격</td><td><%=price%></td></tr>
		<tr><td>이미지</td><td><%=imgPath%></td></tr>
    </table><p>

<a href="updateProduct.jsp?pid=<%=pid%>" style="font-size:10pt;font-family:맑은 고딕">수정</a>&nbsp;&nbsp;
<a href="deleteProduct.jsp?pid=<%=pid%>" style="font-size:10pt;font-family:맑은 고딕">삭제</a>
</center>

</body>
</html>