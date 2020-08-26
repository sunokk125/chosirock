<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>반찬선택  </title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet"></head>
<body>

<%
	request.setCharacterEncoding("euc-kr");
 	String DB_URL="jdbc:mysql://localhost:3306/project9";  
    String DB_ID="multi";  
    String DB_PASSWORD="abcd"; 
 	 
	Class.forName("org.gjt.mm.mysql.Driver"); 
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	int oid = Integer.parseInt(request.getParameter("oid"));

    String jsql = "select * from products";   
	PreparedStatement  pstmt = con.prepareStatement(jsql);
	ResultSet rs = pstmt.executeQuery();

	String jsql2 = "select * from orders where oid = ?";   
	PreparedStatement  pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setInt(1,oid);
	ResultSet rs2 = pstmt2.executeQuery();

	rs2.next();

	int oquantity = rs2.getInt("oquantity"); 
	int count = Integer.parseInt(request.getParameter("count"));
%>

<center>
<font color="blue" size='6'><b>[반찬 선택]</b></font><p>
<form action="updateOrder.jsp" method="post">
<table>
<%
	for(int i=0; i<count; i++){
%>
	<tr>
		<td>반찬 <%=(i+1)%></td>
		<td>
		<select name="dish">
<%
		while(rs.next()){
			String pid = rs.getString("pid");
			String name = rs.getString("name");
			int price = rs.getInt("price");
%>
			<option value="<%=pid%>"><%=name%></option>	
<%
		
		}rs.beforeFirst();
%>
		</select>
		</td>
	</tr>
<%
	}
%>	
	<tr>
		<td>개수 입력 : </td>
		<td>
			<input type="text" name="orderQty" value="<%=oquantity%>"><input type="hidden" name="oid" value="<%=oid%>">
		</td>
	</tr>
</table>
<input type="submit" value="다  음">
</form>
</body>
</html>