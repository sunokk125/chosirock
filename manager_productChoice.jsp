<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>반찬선택  </title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet"></head>

	<script src="js/js_package.js" language="javascript">
	</script>
<body>

<%
	request.setCharacterEncoding("euc-kr");
 	 String DB_URL="jdbc:mysql://localhost:3306/project9";  
     String DB_ID="multi";  
     String DB_PASSWORD="abcd"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

     String jsql = "select * from products";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();

	 int count = Integer.parseInt(request.getParameter("count"));
%>
<center>
<font color="blue" size='6'><b>[반찬 선택]</b></font><p>
<form action="manager_directOrder.jsp" method="post" name="productChoiceForm">
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
							<input type="text" name="orderQty">
						</td>
					</tr>
				</table>
				<input type="button" onClick="checkQty()" value="다  음">
			</form>
</body>
</html>