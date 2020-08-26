<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<head>
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/order.css">
    <link rel="stylesheet" type="text/css" href="css/menu.css">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
	<script src="js/js_package.js" language="javascript">
	</script>
</head>
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
<div id="wrap2">
    <div id="container1">
        <div id="header">
		<%
			String id = (String)session.getAttribute("sid");

			if(id == null){
		%>
            <a href="join.jsp"> 회원가입 </a> | <a href="login.jsp"> 로그인 </a>
		<%
			}else{
		%>
			<a href="mypage.jsp"> 마이페이지 </a> | <a href="logout.jsp">로그아웃</a>
		<%
			}	
		%>
		
        </div>
        <div id="nav">
            <a href="index.jsp"><img src="images/logo.png" id="logo"></a>
            <ul>
                <li><a href="about.jsp">ABOUT</a></li>
                <li><a href="introProduct.jsp">반찬소개</a></li>
                <li><a href="map.jsp">매장위치</a></li>
                <li><a href="countChoice.jsp">도시락 제작</a></li>
            </ul>
        </div>
    </div>
    <div id="container2">
        <div id="contentTitle">
            <span id="title">1. 반찬 수 선택 > </span>

            <span id="title">2. 반찬 선택 > </span>

            <span id="title"><b>3. 배송지 선택 ></b> </span>

            <span id="title">4. 선택 완료 </span>
        </div>
        <div id="content">
            <form action="directOrderResult.jsp" method="post" name="orderForm">
<table>
<tr>
	<td>주문자 : </td>
	<td><input type="text" name="oname"></td>
</tr>
<tr>
	<td>배송지 주소 : </td>
	<td>
		<input type="text" name="zipcode" readOnly>
			<input type="button" value="우편번호검색" onClick="ozipCheck()" ><br>
            <input type="text" name="address1" placeholder="주소" readOnly><br>
            <input type="text" name="address2" placeholder="상세 주소">
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
		<select name="ocardKind">
			<option>국민카드</option>
			<option>BC카드</option>
			<option>신한카드</option>
		</select>
	</td>
</tr>
<tr>
	<td>카드 번호 : </td>
	<td><input type="text" name="ocardNum"></td>
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
	
	</td>
</tr>
</table>
<input type="button" onClick="checkOrder()" value="다  음">
</form>
        </div>
    </div>
    <div id="footer">
        COPYRIGHT 2019 choosirock CO. LTD. ALL RIGHTS RESERVED.
        고객센터 041-777-7777<br>
        AM10:00 ~ PM 18:00 / LUNCH PM 12:00 ~ 13:00<br>
        SAT , SUN , HOLLYDAY OFF<br>
        주소 : 충청남도 천안시 서북구 성환읍 대학로 91 | <a href="manager_login.html">관리자 로그인</a>
    </div>
</div>

</body>
</html>