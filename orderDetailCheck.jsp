<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/mypage.css">
    <link rel="stylesheet" type="text/css" href="css/menu.css">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
</head>
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
            <h2 id="title">상세 주문 확인</h2>
        </div>
        <div id="content">
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
		</table>
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