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

  	String key = request.getParameter("id"); 
	String jsql = "select * from users where id = ?";   
    PreparedStatement  pstmt  = con.prepareStatement(jsql);
	pstmt.setString(1, key);

	ResultSet rs = pstmt.executeQuery(); 
	rs.next();

	 
	String id = rs.getString("id");
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

<center>
<font color="blue" size='6'><b>[회원 상세정보 조회]    </b></font><p>
<table>
		<tr><td width=100>ID</td><td width=200><%=id%></td></tr>
		<tr><td>비밀번호</td><td><%=pwd%></td></tr>
		<tr><td>성명</td><td><%=name%></td></tr>
		<tr><td>주민번호</td><td><%=rrn%></td></tr>
		<tr><td>성별</td><td><%=sex%></td></tr>
		<tr><td>이메일</td><td><%=email%></td></tr>
		<tr><td>휴대폰 번호</td><td><%=phone%></td></tr>
		<tr><td>주소</td><td><%=zipcode%> <%=address1%> <%=address2%></td></tr>
    </table><p>

<a href="updateMember.jsp?id=<%=id%>" style="font-size:10pt;font-family:맑은 고딕">수정</a>&nbsp;&nbsp;
<a href="deleteMember.jsp?id=<%=id%>" style="font-size:10pt;font-family:맑은 고딕">삭제</a>
</center>

</body>
</html>