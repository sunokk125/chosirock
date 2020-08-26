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
	
	 
	String id = (String)session.getAttribute("sid");
	
     String jsql = "select * from users where id = ?";       
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1, id);

  	 ResultSet rs = pstmt.executeQuery();	
	 rs.next();
			
    String pwd =  rs.getString("password");	
	String name = rs.getString("name");
    String rrn =  rs.getString("rrn");	
    String sex =  rs.getString("sex");	
    String email =  rs.getString("email");	
    String phone =  rs.getString("phone");
    String zipcode =  rs.getString("zipcode");
    String address1 =  rs.getString("address1");
    String address2 =  rs.getString("address2");
%>
<div id="wrap2">
    <div id="container1">
        <div id="header">
		<%

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
            <h2 id="title">회원 탈퇴</h2>
        </div>
        <div id="content">
		<h4> 다음의 회원정보를 삭제하시겠습니까? 회원 정보는 다시 되돌릴 수 없습니다.</h4>
<table>
		<tr><td width=100>아이디 : </td><td width=200><%=id%></td></tr>
		<tr><td>비밀번호 : </td><td><%=pwd%></td></tr>
		<tr><td>성명 : </td><td><%=name%></td></tr>
		<tr><td>주민번호 : </td><td><%=rrn%></td></tr>
		<tr><td>성별 : </td><td><%=sex%></td></tr>
		<tr><td>이메일 : </td><td><%=email%></td></tr>
		<tr><td>휴대폰 번호 : </td><td><%=phone%></td></tr>
		<tr><td>주소 : </td><td><%=zipcode%><%=address1%><%=address2%></td></tr>
</table><p>

<a href="deleteUserResult.jsp">삭제</a>&nbsp;&nbsp;
<a href="mypage.jsp"">취소</a>
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