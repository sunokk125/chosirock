<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
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

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	String jsql = "select * from users where id = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, id);

    ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		if (pwd.equals(rs.getString("password"))){
			session.setAttribute("sid", id);
			response.sendRedirect("index.jsp");
		}else{
%>
	<script>
		alert("아이디와 비밀번호를 확인해주세요");
		return false;
	</script>
<%
		}
	}else{
%>
	<script>
		alert("아이디와 비밀번호를 확인해주세요");
		return false;
	</script>
<%
	}
%>
</body>
</html>