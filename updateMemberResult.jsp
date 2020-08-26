<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
	<head><title>회원 정보 수정 완료</title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet"></head>
	<body>

<%
	 request.setCharacterEncoding("euc-kr");

	
	String id = request.getParameter("id");   
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");

	String rrn1 = request.getParameter("rrn1");
	String rrn2 = request.getParameter("rrn2");

	String sex = request.getParameter("sex");

	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");

	String zipcode = request.getParameter("zipcode");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");

 	String DB_URL="jdbc:mysql://localhost:3306/project9";  
    String DB_ID="multi";  
    String DB_PASSWORD="abcd";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "update users set password=?,name=?, rrn=?, sex=?,email=?, phone=?, zipcode=?, address1=?, address2=? where id=? ";	
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,pwd);
	 pstmt.setString(2,name);
	 pstmt.setString(3,rrn1+"-"+rrn2);
	 pstmt.setString(4,sex);
	 pstmt.setString(5,email1+"@"+email2);
	 pstmt.setString(6,phone1+"-"+phone2+"-"+phone3);
	 pstmt.setString(7,zipcode);
	 pstmt.setString(8,address1);
	 pstmt.setString(9,address2);
	 pstmt.setString(10,id);

	 pstmt.executeUpdate();

	 String jsql2 = "select * from users where id=?";
	 PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	 pstmt2.setString(1,id);

	 ResultSet rs = pstmt2.executeQuery();
	 rs.next();
%>
<center>
<br><br><br>
<font color="blue" size='6'><b>[수정된 회원 정보 내역]</b></font><p>
	<table>
		<tr>
			<td width=100>아이디 : </td>
			<td width=300><%=rs.getString("id")%></td>
		</tr>
		<tr>
			<td>비밀번호 : </td>
			<td><%=rs.getString("password")%></td>
		</tr>
		<tr>
			<td>성명 : </td>
			<td><%=rs.getString("name")%></td>
		</tr>
		<tr>
			<td>주민번호 : </td>
			<td><%=rs.getString("rrn")%></td>
		</tr>
		<tr>
			<td>성별 : </td>
			<td><%=rs.getString("sex")%></td>
		</tr>
		<tr>
			<td>이메일 : </td>
			<td><%=rs.getString("email")%></td>
		</tr>
		<tr>
			<td>휴대폰 번호 : </td>
			<td><%=rs.getString("phone")%></td>
		</tr>
		<tr>
			<td>주소 : </td>
			<td>
				<%=rs.getString("zipcode")%><br>
				<%=rs.getString("address1")%><br>
				<%=rs.getString("address2")%><br>
			</td>
		</tr>
	</table>
	<a href="selectAllMember.jsp">회원 조회 페이지로</a>
</center>
</body>
</html>