<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>���� ���̺� ���� ��ȸ   </title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet"></head>
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
%>

<center>
<font color="blue" size='6'><b>[��ü ���� ��ȸ]   </b></font><p>
<table>
	<tr>
		<td>������</td>
		<td>���� ����</td>
		<td>����</td>
		<td>������(g)</td>
		<td>����</td>	
		<td><b>[����]</b></td>
		<td><b>[����]</b></td>
	</tr>	

<%
		while(rs.next()){
			String pid = rs.getString("pid");	
			String name = rs.getString("name");
    		String description =  rs.getString("description");
    		String cal =  rs.getString("cal");	
    		String mass =  rs.getString("mass");
    		String price =  rs.getString("price");
%>
   <tr>
 	  <td> <a href="selectDetailProduct.jsp?pid=<%=pid%>"><%=name%></a></td>
	  <td><%=description%></td>
	  <td><%=cal%></td>
	  <td><%=mass%></td>
	  <td><%=price%></td>
	  <td align=center><a href="updateProduct.jsp?pid=<%=pid%>">����</a></td>
  	  <td align=center><a href="deleteProduct.jsp?pid=<%=pid%>">����</a></td>
  </tr>
<%
		}
%>
</table><p>
<br>
 <a href="manager_index.jsp" style="font-size:10pt;font-family:���� ���">�����ڸ�� ����������</a>

</body>
</html>