<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>ȸ�� ���̺� ���� ��ȸ   </title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet"></head>
<body>

<%
	request.setCharacterEncoding("euc-kr");
 	 String DB_URL="jdbc:mysql://localhost:3306/project9";  
     String DB_ID="multi";  
     String DB_PASSWORD="abcd"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

     String jsql = "select * from orders order by odate desc";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();
%>

<center>
<font color="blue" size='6'><b>[��ü �ֹ� ��ȸ]   </b></font><p>
<table>
	<tr>
		<td>��ȣ</td>
		<td>��ǰ��</td>
		<td>�ֹ� ���̵�</td>
		<td>�ֹ���</td>
		<td>�����</td>
		<td>���� ����</td>
		<td>����</td>
		<td>�� ����</td>
		<td>��¥</td>
		<td><b>[����]</b></td>
		<td><b>[����]</b></td>
	</tr>	

<%
		


		int no=1;
		while(rs.next()){
			String oid = rs.getString("oid");
			String uid = rs.getString("uid");
			String oname = rs.getString("oname");
			String ozipcode = rs.getString("ozipcode");
			String oaddress1 = rs.getString("oaddress1");
			String oaddress2 = rs.getString("oaddress2");
			int oprice = rs.getInt("oprice");
			int oquantity = rs.getInt("oquantity");
			int totalPrice = rs.getInt("totalPrice");
			String odate = rs.getString("odate");

			String jsql2 = "select count(*) from orders_products where oid= ?";   
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setString(1,oid);
			ResultSet rs2 = pstmt2.executeQuery();

			rs2.next();

			int num = rs2.getInt("count(*)");
%>
   <tr>
	  <td><%=no%></td>
 	  <td> <a href="selectDetailOrder.jsp?oid=<%=oid%>"><%=num%>ø ���ö�</a></td>
      <td><%=uid%></td>
	  <td><%=oname%></td>
	  <td><%=ozipcode%> <%=oaddress1%> <%=oaddress2%></td>
	  <td><%=oprice%></td>
	  <td><%=oquantity%></td>
	  <td><%=totalPrice%></td>
	  <td><%=odate%></td>	
	  <td align=center><a href="updateCountChoice.jsp?oid=<%=oid%>">����</a></td>
  	  <td align=center><a href="deleteOrder.jsp?oid=<%=oid%>">����</a></td>
  </tr>
<%
	no = no +1;		
}
%>
</table><p>
<br>
 <a href="manager_index.jsp" style="font-size:10pt;font-family:���� ���">�����ڸ�� ����������</a>

</body>
</html>