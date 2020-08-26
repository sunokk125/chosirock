<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>����� �Է�  </title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet"></head>
<script language="javascript" src="js/js_package.js">
</script>
<body>

<%
	request.setCharacterEncoding("euc-kr");
	String DB_URL="jdbc:mysql://localhost:3306/project9";  
    String DB_ID="multi";  
    String DB_PASSWORD="abcd"; 
 	 
	Class.forName("org.gjt.mm.mysql.Driver"); 
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String oid = request.getParameter("oid"); 

	String jsql3 = "select * from orders where oid = ?";   
	PreparedStatement  pstmt3 = con.prepareStatement(jsql3);
	pstmt3.setString(1,oid);

	ResultSet rs3 = pstmt3.executeQuery();
	rs3.next();

	String oname = rs3.getString("oname");
	String ozipcode = rs3.getString("ozipcode");
	String oaddress1 = rs3.getString("oaddress1");
	String oaddress2 = rs3.getString("oaddress2");
	String ocardKind = rs3.getString("ocardKind");
	String ocardNum = rs3.getString("ocardNum");
	


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
<form action="updateOrderResult.jsp" method="post" name="orderForm">
<table>
<tr>
	<td>�ֹ��� : </td>
	<td><input type="text" name="oname" value="<%=oname%>"></td>
</tr>
<tr>
	<td>����� �ּ� : </td>
	<td>
		<input type="text" name="zipcode" readOnly value="<%=ozipcode%>">
			<input type="button" value="�����ȣ�˻�" onClick="ozipCheck()" ><br>
            <input type="text" name="address1" placeholder="�ּ�" readOnly value="<%=oaddress1%>"><br>
            <input type="text" name="address2" placeholder="�� �ּ�" value="<%=oaddress2%>">
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
	<%
		String[] cardSelected = new String[3];

		if(ocardKind.equals("����ī��")){
			cardSelected[0] = "selected";
		}else if(ocardKind.equals("BCī��")){
			cardSelected[1] = "selected";
		}else if(ocardKind.equals("����ī��")){
			cardSelected[2] = "selected";
		}
	%>
		<select name="ocardKind">
			<option <%=cardSelected[0]%>>����ī��</option>
			<option <%=cardSelected[1]%>>BCī��</option>
			<option <%=cardSelected[2]%>>����ī��</option>
		</select>
	</td>
</tr>
<tr>
	<td>ī�� ��ȣ : </td>
	<td><input type="text" name="ocardNum" value="<%=ocardNum%>"></td>
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
	<input type="hidden" name="oid" value="<%=oid%>">
	</td>
</tr>
</table>
<input type="submit" value="��  ��">
</form>
</body>
</html>