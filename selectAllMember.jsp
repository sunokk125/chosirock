<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>회원 테이블 내용 조회   </title>
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
<font color="blue" size='6'><b>[전체 회원 조회]   </b></font><p>
<table>
	<tr>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>주민번호</td>
		<td>성별</td>	
		<td><b>[수정]</b></td>
		<td><b>[삭제]</b></td>
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
	  <td align=center><a href="updateMember.jsp?id=<%=id%>">수정</a></td>
  	  <td align=center><a href="deleteMember.jsp?id=<%=id%>">삭제</a></td>
  </tr>
<%
		}
%>
</table><p>
<br>
 <a href="manager_index.jsp" style="font-size:10pt;font-family:맑은 고딕">관리자모드 메인페이지</a>

</body>
</html>