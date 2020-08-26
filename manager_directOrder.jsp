<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>����� �Է�  </title></head>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
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

	String[] dishArr = request.getParameterValues("dish");
	int oqty = Integer.parseInt(request.getParameter("orderQty"));

	int oprice = 0;
	for(int i=0; i<dishArr.length; i++){
		String jsql = "select price from products where pid = ?";   
		PreparedStatement  pstmt = con.prepareStatement(jsql);
		pstmt.setString(1,dishArr[i]);

		ResultSet  rs = pstmt.executeQuery();
		rs.next();
		oprice += rs.getInt("price");
	}
	int totalPrice = oprice * oqty;
	 
%>
<center>
<font color="blue" size='6'><b>[����� �Է�]</b></font><p>
<form action="manager_directOrderResult.jsp" method="post" name="orderForm">
<table>
<tr>
	<td>�ֹ��� : </td>
	<td><input type="text" name="oname"></td>
</tr>
<tr>
	<td>����� �ּ� : </td>
	<td>
		<input type="text" name="zipcode" readOnly>
			<input type="button" value="�����ȣ�˻�" onClick="ozipCheck()" ><br>
            <input type="text" name="address1" placeholder="�ּ�" readOnly><br>
            <input type="text" name="address2" placeholder="�� �ּ�">
	</td>
</tr>
<tr>
	<td>���� ���ö� �ݾ� : </td>
	<td><input type="text" name="oprice" value="<%=oprice%>" readOnly></td>
</tr>
<tr>
	<td>���� : </td>
	<td><input type="text" name="oquantity" value="<%=oqty%>" readOnly></td>
</tr>
<tr>
	<td>�� �ֹ��ݾ� : </td>
	<td><input type="text" name="totalPrice" value="<%=totalPrice%>" readOnly></td>
</tr>
<tr>
	<td>ī�� ���� : </td>
	<td>
		<select name="ocardKind">
			<option>����ī��</option>
			<option>BCī��</option>
			<option>����ī��</option>
		</select>
	</td>
</tr>
<tr>
	<td>ī�� ��ȣ : </td>
	<td><input type="text" name="ocardNum"></td>
</tr>

<tr>
	<td>������ ���� : </td>
	<td>
	<%
		for(int i=0; i<dishArr.length; i++){
			String jsql2 = "select pid,name from products where pid = ?";   
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setString(1,dishArr[i]);

			ResultSet  rs2 = pstmt2.executeQuery();
			rs2.next();

	%>
			<p><%=rs2.getString("name")%></p>
			<input type="hidden" name="dish" value="<%=rs2.getInt("pid")%>">	
	<%
		}

	%>
	
	</td>
</tr>
</table>
<input type="button" onClick="checkOrder()" value="��  ��">
</form>
</body>
</html>