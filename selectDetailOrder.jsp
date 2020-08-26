<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>회원 상세 정보 조회   </title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet"></head>
<body>

<%
	request.setCharacterEncoding("euc-kr");
 	String DB_URL="jdbc:mysql://localhost:3306/project9";  
    String DB_ID="multi";  
    String DB_PASSWORD="abcd";  
 	 
	Class.forName("org.gjt.mm.mysql.Driver"); 
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

  	String key = request.getParameter("oid"); 
	String jsql = "select * from orders where oid = ?";   
    PreparedStatement  pstmt  = con.prepareStatement(jsql);
	pstmt.setString(1, key);

	ResultSet rs = pstmt.executeQuery(); 
	rs.next();

	 
	int oid = rs.getInt("oid");
	String uid = rs.getString("uid");
	String oname = rs.getString("oname");
	String ozipcode = rs.getString("ozipcode");
	String oaddress1 = rs.getString("oaddress1");
	String oaddress2 = rs.getString("oaddress2");
	int oprice = rs.getInt("oprice");
	int oquantity = rs.getInt("oquantity");
	int totalPrice = rs.getInt("totalPrice");
	String ocardKind = rs.getString("ocardKind");
	String ocardNum = rs.getString("ocardNum");
	String odate = rs.getString("odate");
	
	String jsql2 = "select * from orders_products where oid = ?";   
    PreparedStatement pstmt2  = con.prepareStatement(jsql2);
	pstmt2.setInt(1, oid);

	ResultSet rs2 = pstmt2.executeQuery();

%>

<center>
<font color="blue" size='6'><b>[주문 상세정보 조회]    </b></font><p>
<table>
		<tr><td width=100>주문 아이디</td><td width=200><%=uid%></td></tr>
		<tr><td>주문자</td><td><%=oname%></td></tr>
		<tr><td>배송지</td><td><%=ozipcode%> <%=oaddress1%> <%=oaddress2%></td></tr>
		<tr><td>개당 가격</td><td><%=oprice%></td></tr>
		<tr><td>수량</td><td><%=oquantity%></td></tr>
		<tr><td>총 가격</td><td><%=totalPrice%></td></tr>
		<tr><td>결제 카드</td><td><%=ocardKind%></td></tr>
		<tr><td>카드 번호</td><td><%=ocardNum%></td></tr>
		<tr><td>날짜</td><td><%=odate%></td></tr>
		<tr>
			<td>반찬 목록</td>
			<td>
				<%
					while(rs2.next()){
						int pid = rs2.getInt("pid");
						String jsql3 = "select * from products where pid = ?";   
						PreparedStatement pstmt3 = con.prepareStatement(jsql3);
						pstmt3.setInt(1,pid);

						ResultSet rs3 = pstmt3.executeQuery();
						rs3.next();
						
				%>
						<p><%=rs3.getString("name")%></p>
				<%
					}
				%>
			</td>
		</tr>
    </table><p>

<a href="updateCountChoice.jsp?oid=<%=oid%>" style="font-size:10pt;font-family:맑은 고딕">수정</a>&nbsp;&nbsp;
<a href="deleteOrder.jsp?oid=<%=oid%>" style="font-size:10pt;font-family:맑은 고딕">삭제</a>
</center>

</body>
</html>