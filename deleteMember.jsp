<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<html><head><title>ȸ�� ���� ����</title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet"></head>
<body><center>

<%
	request.setCharacterEncoding("euc-kr");
 	 String DB_URL="jdbc:mysql://localhost:3306/project9";  
    String DB_ID="multi";  
    String DB_PASSWORD="abcd";   
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	 String key = request.getParameter("id");
	
     String jsql = "select * from users where id = ?";       
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
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

<font color="blue" size='6'><b>[ȸ�� ���� ����(Ż��) Ȯ��]</b></font><p>
<br><br>
<h4> ������ ȸ�������� �����Ͻðڽ��ϱ�?</h4>
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

<a href="deleteMemberResult.jsp?id=<%=id%>" style="font-size:10pt;font-family:���� ���">����</a>&nbsp;&nbsp;
<a href="selectAllMember.jsp" style="font-size:10pt;font-family:���� ���">���</a>
</center>
</body>
</html>