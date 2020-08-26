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
    String name = request.getParameter("name");
	String rrn1= request.getParameter("rrn1");
	String rrn2= request.getParameter("rrn2");


 	String DB_URL="jdbc:mysql://localhost:3306/project9";  
    String DB_ID="multi";  
    String DB_PASSWORD="abcd"; 
 	 
	Class.forName("org.gjt.mm.mysql.Driver"); 
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);


    String jsql = "select * from users where name=? && rrn = ?"; 
      
    
	PreparedStatement pstmt = con.prepareStatement(jsql); 
    pstmt.setString(1, name); 
    pstmt.setString(2, rrn1+"-"+rrn2); 
	
	ResultSet  rs = pstmt.executeQuery();

%>
<div id="wrap2">
    <div id="container1">
        <div id="header">
		<%
			String id = (String)session.getAttribute("sid");

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
            <h2 id="title">MyPage</h2>
        </div>
        <div id="content">
		<%
		
			if(rs.next()){
		%>
						<table>
				<tr>
					<td>��ȸ �� ���̵� : </td>
					<td><%=rs.getString("id")%></td>
				</tr>
			</table>
			<a href="searchPw.jsp">��й�ȣ ã��</a> / <a href="login.jsp">�α���</a>
			<% 
				}else{
			%>
				<table>
				<tr>
					<td>�Է��Ͻ� ������ ��ġ�ϴ� ���̵� �������� �ʽ��ϴ�. �Է��Ͻ� ������ Ȯ�����ֽʽÿ�.</td>
				</tr>
			</table>
			<%
			}
			%>
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