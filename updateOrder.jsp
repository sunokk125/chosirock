<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>배송지 입력  </title>
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
<font color="blue" size='6'><b>[배송지 입력]</b></font><p>
<form action="updateOrderResult.jsp" method="post" name="orderForm">
<table>
<tr>
	<td>주문자 : </td>
	<td><input type="text" name="oname" value="<%=oname%>"></td>
</tr>
<tr>
	<td>배송지 주소 : </td>
	<td>
		<input type="text" name="zipcode" readOnly value="<%=ozipcode%>">
			<input type="button" value="우편번호검색" onClick="ozipCheck()" ><br>
            <input type="text" name="address1" placeholder="주소" readOnly value="<%=oaddress1%>"><br>
            <input type="text" name="address2" placeholder="상세 주소" value="<%=oaddress2%>">
	</td>
</tr>
<tr>
	<td>개당 도시락 금액 : </td>
	<td><input type="text" name="oprice" value="<%=oprice%>" readOnly></td>
</tr>
<tr>
	<td>개수 : </td>
	<td><input type="text" name="oquantity" value="<%=oqty%>" readOnly></td>
</tr>
<tr>
	<td>총 주문금액 : </td>
	<td><input type="text" name="totalPrice" value="<%=totalPrice%>" readOnly></td>
</tr>
<tr>
	<td>카드 종류 : </td>
	<td>
	<%
		String[] cardSelected = new String[3];

		if(ocardKind.equals("국민카드")){
			cardSelected[0] = "selected";
		}else if(ocardKind.equals("BC카드")){
			cardSelected[1] = "selected";
		}else if(ocardKind.equals("신한카드")){
			cardSelected[2] = "selected";
		}
	%>
		<select name="ocardKind">
			<option <%=cardSelected[0]%>>국민카드</option>
			<option <%=cardSelected[1]%>>BC카드</option>
			<option <%=cardSelected[2]%>>신한카드</option>
		</select>
	</td>
</tr>
<tr>
	<td>카드 번호 : </td>
	<td><input type="text" name="ocardNum" value="<%=ocardNum%>"></td>
</tr>

<tr>
	<td>선택한 반찬 : </td>
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
<input type="submit" value="다  음">
</form>
</body>
</html>