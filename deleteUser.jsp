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
            <h2 id="title">ȸ�� Ż��</h2>
        </div>
        <div id="content">
		<h4> ������ ȸ�������� �����Ͻðڽ��ϱ�? ȸ�� ������ �ٽ� �ǵ��� �� �����ϴ�.</h4>
<table>
		<tr><td width=100>���̵� : </td><td width=200><%=id%></td></tr>
		<tr><td>��й�ȣ : </td><td><%=pwd%></td></tr>
		<tr><td>���� : </td><td><%=name%></td></tr>
		<tr><td>�ֹι�ȣ : </td><td><%=rrn%></td></tr>
		<tr><td>���� : </td><td><%=sex%></td></tr>
		<tr><td>�̸��� : </td><td><%=email%></td></tr>
		<tr><td>�޴��� ��ȣ : </td><td><%=phone%></td></tr>
		<tr><td>�ּ� : </td><td><%=zipcode%><%=address1%><%=address2%></td></tr>
</table><p>

<a href="deleteUserResult.jsp">����</a>&nbsp;&nbsp;
<a href="mypage.jsp"">���</a>
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