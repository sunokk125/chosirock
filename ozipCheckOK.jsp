<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<script language="javascript">
	function sendAddress(zip,s,g,d)
	{
		//�õ� ���� ���� ���� �ּ�
		var address =s + " " + g + " " + d;
		 // opener:   open()�Լ��� ȣ���ߴ� ����(�θ�) ������ ��ü�� �ǹ���
		opener.document.orderForm.zipcode.value=zip;
        opener.document.orderForm.address1.value=address;
		opener.document.orderForm.address2.focus();
		window.close();
	}
</script>

<%
    String DB_URL="jdbc:mysql://localhost:3306/project9";  
    String DB_ID="multi";  
    String DB_PASSWORD="abcd"; 
 	 
    Class.forName("org.gjt.mm.mysql.Driver");  
    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	request.setCharacterEncoding("euc-kr");

	String dongName = request.getParameter("dong");   
	String jsql = "select * from cl_zipcodet where dong like '%" + dongName + "%' ";  
	                                                       //  ����ǥ����� ��� ���Ǿ����� �����ؼ� �� ��!
	PreparedStatement 	pstmt = con.prepareStatement(jsql);
	ResultSet rs = pstmt.executeQuery();
%>

<html>
 <head><title><�����ȣ �˻�></title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet"></head>
 <body>
  <center>
	<h3>�����ȣ �˻����</h3>
	<table border=0>
	  <tr>
		<td><font size=2><b>�����ȣ</font></td><td><font size=2><b>��/��</font></td><td><font size=2><b>��/��</font></td>
		<td><font size=2><b>��</font></td><td><font size=2><b>����</font></td>
	  </tr>
<%
		while(rs.next())
		{
			String zipcode = rs.getString("zipcode");
            String sido = rs.getString("sido");
			String	gugun = rs.getString("gugun");
			String	dong = rs.getString("dong");					 			
			String	bunji = rs.getString("bunji");

			if(bunji==null)  bunji = "";    // �������� null �̸� ��ĭ���� ��µǵ���
%> 
	  <tr>
		 <td width=80><a href="javascript:sendAddress('<%=zipcode%>','<%=sido%>','<%=gugun%>','<%=dong%>','<%=bunji%>')"><font size=2><%=zipcode%></font></a></td>
		  <td width=80><font size=2><%=sido%></font></td>
		  <td width=120><font size=2><%=gugun%></font></td>
		  <td width=280><font size=2><%=dong%></font></td>
		  <% 
				if(bunji=="")
				{                    // ���̸� ���̺� ĭ�� �׷����� �����Ƿ� �����̽��� ä��
		  %>
		  <td>&nbsp;</td>	
		  <%
				}
				else
				{
		   %>
		  <td width=150><font size=2><%=bunji%></font></td>		
		  <%
				}
		  %>
	  </tr>
<%
		 } // while�� ����
%>
	</table>  
	<p><a href="ozipCheck.jsp">�ٽ� �Է�</a>
   </center>
  </body>
</html>
