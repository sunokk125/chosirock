<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>ȸ�� ���̺� ���� ��ȸ   </title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet"></head>
<body>

<%
	request.setCharacterEncoding("euc-kr");
 	 String DB_URL="jdbc:mysql://localhost:3306/project9";  
     String DB_ID="multi";  
     String DB_PASSWORD="abcd"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

     String jsql = "select * from users";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();
%>

<center>
<font color="blue" size='6'><b>[��ü ȸ�� ��ȸ]   </b></font><p>
<table>
	<tr>
		<td>���̵�</td>
		<td>��й�ȣ</td>
		<td>�̸�</td>
		<td>�ֹι�ȣ</td>
		<td>����</td>	
		<td><b>[����]</b></td>
		<td><b>[����]</b></td>
	</tr>	

<%
		while(rs.next()){
			String id = rs.getString("id");
    		String pwd =  rs.getString("password");	
			String name = rs.getString("name");
    		String rrn =  rs.getString("rrn");	
    		String sex =  rs.getString("sex");
%>
   <tr>
 	  <td> <a href="selectDetailMember.jsp?id=<%=id%>"><%=id%></a></td>
      <td><%=pwd%></td>
	  <td><%=name%></td>
	  <td><%=rrn%></td>
	  <td><%=sex%></td>	
	  <td align=center><a href="updateMember.jsp?id=<%=id%>">����</a></td>
  	  <td align=center><a href="deleteMember.jsp?id=<%=id%>">����</a></td>
  </tr>
<%
		}
%>
</table><p>
<br>
 <a href="manager_index.jsp" style="font-size:10pt;font-family:���� ���">�����ڸ�� ����������</a>

</body>
</html>