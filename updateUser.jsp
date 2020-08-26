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
<script language="javascript" src="js/js_package.js">
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
	
	 
	String id = (String)session.getAttribute("sid");   
	String jsql = "select * from users where id = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1,id);

	ResultSet rs = pstmt.executeQuery();
	rs.next();
			
	String uid = rs.getString("id");
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
            <h2 id="title">MyPage</h2>
        </div>
        <div id="content">
            <form method="post" action="updateUserResult.jsp" name="newMem">
	<table>
		<tr>
			<td width=100>ID</td>
			<td><input type="hidden" name="id" value="<%=uid%>"><%=uid%></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" name="pwd" value="<%=pwd%>"></td>
		</tr>
		<tr>
			<td>성명</td>
			<td><input type="text" name="name" value="<%=name%>"></td>
		</tr>
		<tr>
			<td>주민번호</td>
			<td>
<%
	    	String[] rrnArr = rrn.split("-");
%>		
		    <input type="text" name="rrn1" value="<%=rrnArr[0]%>" size="6"> -
			<input type="text" name="rrn2" value="<%=rrnArr[1]%>" size="7">
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
<%
		if(sex.equals("남"))
		{
%>
				<input type="radio" name="sex" value="남" checked>남
				<input type="radio" name="sex" value="여">여
<%
		}	
		else
		{
%>
				<input type="radio" name="sex" value="남">남
				<input type="radio" name="sex" value="여" checked>여
<%
	}
%>				
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
<%
	    	String[] emailArr = email.split("@");  

			String[] emailSelected = new String[3]; 

			if(emailArr[1].equals("naver.com"))
			{
				emailSelected[0] = "selected";
			}  
			else if(emailArr[1].equals("gmail.com"))
			{
				emailSelected[1] = "selected";
			}
			else if(emailArr[1].equals("daum.net"))
			{
				emailSelected[2] = "selected";
			}

%>
		    <input type="text" name="email1" value="<%=emailArr[0]%>">
			<select name="email2">      
				<option value="naver.com" <%=emailSelected[0]%>>naver.com
				<option value="gmail.com" <%=emailSelected[1]%>>gmail.com
				<option value="daum.net" <%=emailSelected[2]%>>daum.net
			</select>		
			</td>	
		</tr>
		
		<tr>
			<td>휴대폰번호</td>
			<td>
<%
	    	String[] phoneArr  = phone.split("-");  

			String[]  phoneSelected = new String[3]; 

			if(phoneArr[0].equals("010"))
			{
				phoneSelected[0] = "selected";
			}  
			else if(phoneArr[0].equals("011"))
			{
				phoneSelected[1] = "selected";
			}
			else if(phoneArr[0].equals("016"))
			{
				phoneSelected[2] = "selected";
			}

%>
			<select name="phone1">      
				<option value="010" <%=phoneSelected[0]%>>010
				<option value="011" <%=phoneSelected[1]%>>011
				<option value="016" <%=phoneSelected[2]%>>016
			</select>		
		    <input type="text" name="phone2" value="<%=phoneArr[1]%>" size="4">-
		    <input type="text" name="phone3" value="<%=phoneArr[2]%>" size="4">
			</td>	
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" name="zipcode" readOnly value="<%=zipcode%>">
				<input type="button" value="우편번호검색" onClick="zipCheck()" ><br>
				<input type="text" name="address1" placeholder="주소" readOnly value="<%=address1%>"><br>
				<input type="text" name="address2" placeholder="상세 주소" value="<%=address2%>">
			</td>
		</tr>
		
		
	</table>
	<p><input type=submit value=수정완료>
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