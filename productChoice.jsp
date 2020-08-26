<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
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

     String jsql = "select * from products";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();

	 int count = Integer.parseInt(request.getParameter("count"));
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
            <span id="title">1. 반찬 수 선택 ></span>

            <span id="title"><b>2. 반찬 선택 ></b> </span>

            <span id="title">3. 배송지 선택 > </span>

            <span id="title">4. 선택 완료 </span>
        </div>
        <div id="content">
            <form action="directOrder.jsp" method="post" name="productChoiceForm">
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