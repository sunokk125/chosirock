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
<div id="wrap2">
    <div id="container1">
        <div id="header">
		<%

			if(id == null){
		%>
            <a href="join.jsp"> ȸ������ </a> | <a href="login.jsp"> �α��� </a>
		<%
			}else{
		%>
			<a href="mypage.jsp"> ���������� </a> | <a href="logout.jsp">�α׾ƿ�</a>
		<%
			}	
		%>
		
        </div>
        <div id="nav">
            <a href="index.jsp"><img src="images/logo.png" id="logo"></a>
            <ul>
                <li><a href="about.jsp">ABOUT</a></li>
                <li><a href="introProduct.jsp">�����Ұ�</a></li>
                <li><a href="map.jsp">������ġ</a></li>
                <li><a href="countChoice.jsp">���ö� ����</a></li>
            </ul>
        </div>
    </div>
    <div id="container2">
        <div id="contentTitle">
            <h2 id="title">ȸ�� ���� ���� �Ϸ�</h2>
        </div>
        <div id="content">
            <table>
		<tr>
			<td width=100>���̵� : </td>
			<td width=300><%=rs.getString("id")%></td>
		</tr>
		<tr>
			<td>��й�ȣ : </td>
			<td><%=rs.getString("password")%></td>
		</tr>
		<tr>
			<td>���� : </td>
			<td><%=rs.getString("name")%></td>
		</tr>
		<tr>
			<td>�ֹι�ȣ : </td>
			<td><%=rs.getString("rrn")%></td>
		</tr>
		<tr>
			<td>���� : </td>
			<td><%=rs.getString("sex")%></td>
		</tr>
		<tr>
			<td>�̸��� : </td>
			<td><%=rs.getString("email")%></td>
		</tr>
		<tr>
			<td>�޴��� ��ȣ : </td>
			<td><%=rs.getString("phone")%></td>
		</tr>
		<tr>
			<td>�ּ� : </td>
			<td>
				<%=rs.getString("zipcode")%><br>
				<%=rs.getString("address1")%><br>
				<%=rs.getString("address2")%><br>
			</td>
		</tr>
	</table>
	<a href="mypage.jsp">���� ��������</a>

        </div>
    </div>
    <div id="footer">
        COPYRIGHT 2019 choosirock CO. LTD. ALL RIGHTS RESERVED.
        ������ 041-777-7777<br>
        AM10:00 ~ PM 18:00 / LUNCH PM 12:00 ~ 13:00<br>
        SAT , SUN , HOLLYDAY OFF<br>
        �ּ� : ��û���� õ�Ƚ� ���ϱ� ��ȯ�� ���з� 91 | <a href="manager_login.html">������ �α���</a>
    </div>
</div>

</body>
</html>